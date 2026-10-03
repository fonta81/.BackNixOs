{ config, pkgs, ... }:
{
  programs.lazyvim = {
    enable = true;

    extras = {
      # LazyExtras:

      lang.rust = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = true;
      };

      lang.typescript = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = true;
      };

      lang.nix = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = true;
      };

      lang.python = {
        enable = true;
        installDependencies = true; # Install ruff
        installRuntimeDependencies = true; # Install python3
      };

      lang.go = {
        enable = true;
        installDependencies = true; # Install gopls, gofumpt, etc.
        installRuntimeDependencies = true; # Install go compiler
      };

      lang.clangd = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = true;
      };

    };

    # Additional packages (optional)
    extraPackages = with pkgs; [
      # Nix tooling & LSPs
      nixd
      nil
      alejandra
      nixfmt-rfc-style # o nixfmt según tu versión
      # Python & Lua
      pyright
      python3
      lua-language-server
      stylua
      # Web & WebDev (TypeScript, JS, HTML)
      vtsls
      typescript
      typescript-language-server
      # Go & Shell
      gotools
      shfmt
      # Rust
      cargo
      rustc
      rust-analyzer
      rustfmt
      clippy
      # General utilities & tools
      tree-sitter
      ast-grep
    ];

    treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      git_config
      wgsl
      templ
    ];
  };
}
