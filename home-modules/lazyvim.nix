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
      nixd
      alejandra
      pyright
      vtsls
      typescript-language-server
      typescript
      lua-language-server
      nil
      stylua
      nixfmt
      gotools # Incluye goimports
      shfmt
      tree-sitter
      ast-grep
      python3
    ];

    # Only needed for languages not covered by LazyVim extras
    treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      git_config
      wgsl # WebGPU Shading Language
      templ # Go templ files
    ];
  };
}
