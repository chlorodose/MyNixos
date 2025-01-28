{ ... }: {
  programs.nixvim.globals = {
    mapleader = " ";
    maplocalleader = "\\";

    # LazyVim auto format
    autoformat = true;

    # Snacks animations
    # Set to `false` to globally disable all snacks animations
    snacks_animate = true;

    # LazyVim picker to use.
    # Can be one of: telescope, fzf
    # Leave it to "auto" to automatically use the picker
    # enabled with `:LazyExtras`
    lazyvim_picker = "auto";

    # LazyVim completion engine to use.
    # Can be one of: nvim-cmp, blink.cmp
    # Leave it to "auto" to automatically use the completion engine
    # enabled with `:LazyExtras`
    lazyvim_cmp = "auto";

    # if the completion engine supports the AI source,
    # use that instead of inline suggestions
    ai_cmp = true;

    # LazyVim root dir detection
    # Each entry can be:
    # * the name of a detector function like `lsp` or `cwd`
    # * a pattern or array of patterns like `.git` or `lua`.
    # * a function with signature `function(buf) -> string|string[]`
    root_spec = [ "lsp" [ ".git" "lua" ] "cwd" ];

    # Optionally setup the terminal to use
    # This sets `vim.o.shell` and does some additional configuration for:
    # * pwsh
    # * powershell
    # LazyVim.terminal.setup("pwsh")

    # Set LSP servers to be ignored when used with `util.root.detectors.lsp`
    # for detecting the LSP root
    root_lsp_ignore = [ "copilot" ];

    # Hide deprecation warnings
    deprecation_warnings = false;

    # Show the current document symbols location from Trouble in lualine
    # You can disable this for a buffer by setting `vim.b.trouble_lualine = false`
    trouble_lualine = true;
  };
  programs.nixvim.opts = {
    autowrite = true; # Enable auto write
    # only set clipboard if not in ssh to make sure the OSC 52
    # integration works automatically. Requires Neovim >= 0.10.0
    completeopt = "menu,menuone,noselect";
    conceallevel =
      2; # Hide * markup for bold and italic but not markers with substitutions
    confirm = true; # Confirm to save changes before exiting modified buffer
    cursorline = true; # Enable highlighting of the current line
    expandtab = true; # Use spaces instead of tabs
    fillchars = {
      foldopen = "";
      foldclose = "";
      fold = " ";
      foldsep = " ";
      diff = "╱";
      eob = " ";
    };
    foldlevel = 99;
    formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()";
    formatoptions = "jcroqlnt"; # tcqj
    grepformat = "%f:%l:%c:%m";
    grepprg = "rg #vimgrep";
    ignorecase = true; # Ignore case
    inccommand = "nosplit"; # preview incremental substitute
    jumpoptions = "view";
    laststatus = 3; # global statusline
    linebreak = true; # Wrap lines at convenient points
    list = true; # Show some invisible characters (tabs...
    mouse = "a"; # Enable mouse mode
    number = true; # Print line number
    pumblend = 10; # Popup blend
    pumheight = 10; # Maximum number of entries in a popup
    relativenumber = true; # Relative line numbers
    ruler = false; # Disable the default ruler
    scrolloff = 4; # Lines of context
    sessionoptions = [
      "buffers"
      "curdir"
      "tabpages"
      "winsize"
      "help"
      "globals"
      "skiprtp"
      "folds"
    ];
    shiftround = true; # Round indent
    shiftwidth = 2; # Size of an indent;
    showmode = false; # Dont show mode since we have a statusline
    sidescrolloff = 8; # Columns of context
    signcolumn =
      "yes"; # Always show the signcolumn otherwise it would shift the text each time
    smartcase = true; # Don't ignore case with capitals
    smartindent = true; # Insert indents automatically
    spelllang = [ "en" ];
    splitbelow = true; # Put new windows below current
    splitkeep = "screen";
    splitright = true; # Put new windows right of current
    tabstop = 2; # Number of spaces tabs count for
    termguicolors = true; # True color support;
    undofile = true;
    undolevels = 10000;
    updatetime = 200; # Save swap file and trigger CursorHold
    virtualedit =
      "block"; # Allow cursor to move where there is no text in visual block mode
    wildmode = "longest:full,full"; # Command-line completion mode
    winminwidth = 5; # Minimum window width
    wrap = false; # Disable line wrap
    smoothscroll = true;
    foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()";
    foldmethod = "expr";
    foldtext = "";
    # opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
    # opt.shortmess:append({ W = true, I = true, c = true, C = true })
    # opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus
  };
}
