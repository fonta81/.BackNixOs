{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true; # Establecer Neovim como el editor por defecto ($EDITOR)

    # 1. Opciones generales de Neovim (vim.opt)
    opts = {
      number = true;          # Mostrar números de línea
      relativenumber = true;  # Números relativos para saltos rápidos
      shiftwidth = 2;         # Tamaño de sangría/tabulación
      tabstop = 2;            # Ancho del carácter TAB
      expandtab = true;       # Convertir pestañas a espacios
      smartindent = true;     # Sangría inteligente
      termguicolors = true;   # Habilitar colores verdaderos de terminal
      cursorline = true;      # Resaltar la línea actual
      ignorecase = true;      # Búsqueda no sensible a mayúsculas
      smartcase = true;       # Búsqueda sensible si incluye mayúsculas
    };

    # 2. Tema / Esquema de colores
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha"; # mocha, macchiato, frappe, latte
      };
    };

    # 3. Tecla líder (Leader key) y Keymaps
    globals.mapleader = " "; # Usa la barra espaciadora como Leader

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<CR>";
        options.desc = "Abrir / Cerrar explorador de archivos";
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
        options.desc = "Buscar archivos (Telescope)";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<CR>";
        options.desc = "Buscar texto en archivos (Grep)";
      }
    ];

    # 4. Plugins
    plugins = {
      # Resaltado de sintaxis
      treesitter.enable = true;

      # Barra de estado inferior
      lualine.enable = true;

      # Explorador de archivos lateral
      nvim-tree.enable = true;

      # Buscador difuso (Fuzzy Finder)
      telescope.enable = true;

      # Parejas automáticas de paréntesis y comillas
      nvim-autopairs.enable = true;

      # Comentarios rápidos con "gcc" o "gc"
      comment.enable = true;

      # Integración con Git en el margen de líneas
      gitsigns.enable = true;

      # Servidores LSP (Language Server Protocol)
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;     # Servidor LSP para archivos Nix
          pyright.enable = true;    # Servidor LSP para Python
          ts_ls.enable = true;      # Servidor LSP para TypeScript / JavaScript
          bashls.enable = true;     # Servidor LSP para Bash
        };
      };

      # Autocompletado inteligente (nvim-cmp)
      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
          };
        };
      };
    };
  };
}
