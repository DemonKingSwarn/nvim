local M = {}

-- ========= file utils =========
local function read_file(path)
  local fd = vim.loop.fs_open(path, "r", 438)
  if not fd then return nil, "Cannot open file: " .. path end
  local stat = vim.loop.fs_fstat(fd)
  if not stat then vim.loop.fs_close(fd); return nil, "Cannot stat file: " .. path end
  local data = vim.loop.fs_read(fd, stat.size, 0)
  vim.loop.fs_close(fd)
  if not data then return nil, "Cannot read file: " .. path end
  return data
end

local function get_extension(path)
  local ext = path:match("^.+(%.[^/%.]+)$")
  return ext or ""
end

local function basename(path)
  return path:match("([^/]+)$") or path
end

local function detect_filetype(path)
  return vim.filetype.match({ filename = basename(path) })
end

local function make_tmp_path(ext)
  local random = (vim.loop.now() .. vim.loop.hrtime()):gsub("%D", "")
  random = random:sub(#random - 7)
  return "/tmp/" .. random .. (ext or "")
end

-- ========= visual center (gutters) =========
local Pad = { state = nil }

local function is_valid_win(w)
  return w and vim.api.nvim_win_is_valid(w)
end

local function make_pad_buf()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].modifiable = false
  return buf
end

local function lock_pad_window(win)
  vim.api.nvim_win_set_option(win, "number", false)
  vim.api.nvim_win_set_option(win, "relativenumber", false)
  vim.api.nvim_win_set_option(win, "cursorline", false)
  vim.api.nvim_win_set_option(win, "list", false)
  vim.api.nvim_win_set_option(win, "wrap", false)
  vim.api.nvim_win_set_option(win, "winfixwidth", true)
end

local function create_or_update_pads(center_win, width)
  width = width or 36

  if Pad.state
     and is_valid_win(Pad.state.left_win)
     and is_valid_win(Pad.state.right_win)
     and is_valid_win(Pad.state.main_win) then
    Pad.state.width = width
    pcall(vim.api.nvim_win_set_width, Pad.state.left_win, width)
    pcall(vim.api.nvim_win_set_width, Pad.state.right_win, width)
    return
  end

  local original_win = center_win

  vim.api.nvim_set_current_win(original_win)
  vim.cmd("topleft vnew")
  local left_win = vim.api.nvim_get_current_win()
  local left_buf = make_pad_buf()
  vim.api.nvim_win_set_buf(left_win, left_buf)
  pcall(vim.api.nvim_win_set_width, left_win, width)
  lock_pad_window(left_win)

  vim.api.nvim_set_current_win(original_win)
  vim.cmd("botright vnew")
  local right_win = vim.api.nvim_get_current_win()
  local right_buf = make_pad_buf()
  vim.api.nvim_win_set_buf(right_win, right_buf)
  pcall(vim.api.nvim_win_set_width, right_win, width)
  lock_pad_window(right_win)

  vim.api.nvim_set_current_win(original_win)

  Pad.state = { left_win = left_win, right_win = right_win, main_win = original_win, width = width }

  vim.api.nvim_create_autocmd("WinClosed", {
    callback = function(args)
      local w = tonumber(args.match)
      if Pad.state and w == Pad.state.main_win then
        pcall(vim.api.nvim_win_close, Pad.state.left_win, true)
        pcall(vim.api.nvim_win_close, Pad.state.right_win, true)
        Pad.state = nil
      end
    end,
    desc = "AnimUwU pad cleanup",
  })
end

local function ensure_center_layout(width)
  local main = Pad.state and Pad.state.main_win or vim.api.nvim_get_current_win()
  create_or_update_pads(main, width)
end

-- ========= typing animation =========
local function type_text_into_buffer(buf, win, text, opts)
  opts = opts or {}
  local speed = tonumber(opts.speed) or 12

  local lines = {}
  for s in (text .. "\n"):gmatch("(.-)\n") do
    table.insert(lines, s)
  end

  vim.bo[buf].modifiable = true
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "" })

  local timer = vim.loop.new_timer()
  local i_line, i_char = 1, 1
  local row = 0

  local function on_tick()
    if i_line > #lines then
      timer:stop(); timer:close()
      vim.schedule(function() pcall(vim.cmd.normal, "zz") end)
      return
    end

    local current = lines[i_line]
    if i_char > #current then
      row = row + 1
      vim.api.nvim_buf_set_lines(buf, row, row, false, { "" })
      i_line = i_line + 1
      i_char = 1
      vim.schedule(function() pcall(vim.cmd.normal, "zz") end)
      return
    end

    local ch = current:sub(i_char, i_char)
    local existing = vim.api.nvim_buf_get_lines(buf, row, row + 1, false)[1] or ""
    vim.api.nvim_buf_set_lines(buf, row, row + 1, false, { existing .. ch })
    i_char = i_char + 1
  end

  timer:start(0, speed, vim.schedule_wrap(on_tick))
end

-- ========= open tmp buffer =========
local function open_tmp_buffer(tmp_path, filetype)
  vim.cmd("enew")
  local buf = vim.api.nvim_get_current_buf()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_buf_set_name(buf, tmp_path)
  vim.bo[buf].buftype = ""
  vim.bo[buf].swapfile = false
  vim.bo[buf].modifiable = true
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "" })
  if filetype and #filetype > 0 then vim.bo[buf].filetype = filetype end
  pcall(vim.cmd.normal, "zz")
  return buf, win
end

-- ========= command =========
function M.setup()
  vim.api.nvim_create_user_command("AnimUwU", function(cmd)
    -- :AnimUwU /path/to/file [speed_ms] [pad_width]
    local arg = vim.trim(cmd.args or "")
    if arg == "" then
      vim.notify("AnimUwU: provide path; optional speed_ms pad_width", vim.log.levels.ERROR)
      return
    end
    local path, speed_str, pad_str = arg:match("^%s*(%S+)%s*(%S*)%s*(%S*)%s*$")
    local speed = tonumber(speed_str)
    local padw = tonumber(pad_str) or 36

    local data, err = read_file(path)
    if not data then
      vim.notify("AnimUwU: " .. err, vim.log.levels.ERROR)
      return
    end

    local ext = get_extension(path)
    local ft = detect_filetype(path)
    local tmp_path = make_tmp_path(ext)

    local buf, win = open_tmp_buffer(tmp_path, ft)
    pcall(function() vim.fn.writefile({ "" }, tmp_path) end)

    ensure_center_layout(padw)
    vim.api.nvim_create_autocmd({ "WinResized", "TabEnter" }, {
      callback = function()
        if Pad.state and is_valid_win(Pad.state.main_win) then
          ensure_center_layout(Pad.state.width or padw)
        end
      end,
      desc = "AnimUwU maintain centered pads",
    })

    type_text_into_buffer(buf, win, data, { speed = speed })
  end, {
    nargs = "+",
    complete = "file",
    desc = "Open centered tmp buffer (side pads, no text padding) and retype a file",
  })
end

return M

