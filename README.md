# Simple neovim config, with only a small amount of plugins

<!--toc:start-->
- [Simple neovim config, with only a small amount of plugins](#simple-neovim-config-with-only-a-small-amount-of-plugins)
  - [Package manager/Lazy loading/Lua compilation for faster startup time](#package-managerlazy-loadinglua-compilation-for-faster-startup-time)
    - [Package manager](#package-manager)
    - [Lazy loading](#lazy-loading)
    - [Lua config compilation for faster startup](#lua-config-compilation-for-faster-startup)
  - [Colorscheme](#colorscheme)
  - [Treesitter](#treesitter)
  - [Lsp](#lsp)
  - [Code completion/autocompletion and snippets](#code-completionautocompletion-and-snippets)
  - [Fuzzy finder/searcher](#fuzzy-findersearcher)
  - [statusline](#statusline)
  - [File manager](#file-manager)
  - [Keybindings cheatsheet](#keybindings-cheatsheet)
  - [Auto pair](#auto-pair)
  - [Miscelenaous plugins](#miscelenaous-plugins)
<!--toc:end-->

Very simple neovim config with just stuff I need to do my work/act like I'm a worker.

Trying to use as many built in stuff as possible ( That's the main reason I'm rocking the nighly version of neovim ).

I have all my configurations in a `lua/config` directory with a pack.lua file for some plugins that don't need any configurations.

Now I will try and go over a couple type of plugins that I'm using or that I'm not using because it's now built in or just annoying and I don't understand why people use them.

## Package manager/Lazy loading/Lua compilation for faster startup time

This is a pretty broad category because the most popular package manager lazy actually does all of this that's why I have it all mentioned here.

### Package manager

I'm using the new built in neovim package manager **pack** that's currently only available in the neovim nighly v0.12

### Lazy loading

I don't do any lazy loading, I only use ( Looks at notes ) 6 packages only, and they all are either just a colorscheme or have amazing built in lazyloading.

### Lua config compilation for faster startup

This is a feature that lazy.nvim does, and another plugin called impatient.nvim ( I believe that's the name ), but neovim has a built in feature for that since couple version ago ( It's still "experimenta" ) that works as well as the options named before.

## Colorscheme

Using gruvbox colorscheme, fight me or join me I don't care.

## Treesitter

I enjoy using treesitter for syntax highlight.

## Lsp

I use the regular lsp with nvim-lspconfig just for the configurations so I don't have to set configuration for every lsp myself or update them if something changes in how an lsp work's.

I'm still able to change lsp settings using `lsp/name_of_lsp.lua` and changing specific settings I need.

## Code completion/autocompletion and snippets

I'm using the built in code completion and use mini.autocomplete to have autocompletion and definitions automatically show when typing but much less anoying than most other's autocompletion plugins.

I don't use any plugin for stuff like path completion because neovim already has it built in, just type <C-x><C-f> and there are other type's of completion that already exist in neovim.

For snippets I'm also making use of neovim's built in snippet engine with mini.snippets to add some more simple functionality.

## Fuzzy finder/searcher

I'm using mini.pick with multiple other mini extensions to add in more features some of them being:

- git related searches
- pattern searching like FIXME/HACK/TODO/NOTE
- diagnostics
- most visited paths
- path's set with specific tag

## statusline

I'm using the mini.statusline that's very simpe and only has the kind of info I need and nothing else.

## File manager

Mini.move, simple and easilly extendable.

## Keybindings cheatsheet

mini.clue, simple and looks like helix and is less in the way than whichkey and other similar plugins.

Easy to also add custom completions for easier time.

## Auto pair

I don't use any autopair plugins, they are annoying and almost never pair when I need them to and only pair when I don't need them to.

## Miscelenaous plugins

This are all mostly for some nihe stuff and don't have a specific category

- mini.notify : Simple notification
- mini.visits : track visited files and file tagging
- mini.indentscope : highlight current indent scope
- mini.starter : simple dashboard
- mini.sessions : simple session creator
- mini.splitjoin : for easy spliting arguments
- mini.move : add keybindings for moving lines
- mini.icons : add icons support for everything I just named
