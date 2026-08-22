# Estructura de `.BackNixOs`

```
.BackNixOs/
├── LICENSE
├── README.md
├── configuration.nix
├── flake.lock
├── flake.nix
├── home.nix
├── home-modules/
│   ├── ghostty.nix
│   ├── git.nix
│   ├── lazyvim.nix
│   └── zsh.nix
└── system/
    ├── PC/
    │   ├── default.nix
    │   ├── hardware-configuration.nix
    │   └── nvidia.nix
    └── laptop/
        ├── default.nix
        └── hardware-configuration.nix
```

## Descripción rápida

| Archivo/Carpeta | Propósito |
|---|---|
| `flake.nix` | Entry point del flake: define los inputs (nixpkgs, home-manager, lazyvim, dms, etc.) y las dos `nixosConfigurations` (`laptop`, `pc-escritorio`). |
| `flake.lock` | Versiones fijadas de todos los inputs. |
| `configuration.nix` | Configuración de sistema compartida entre ambos hosts (locale, timezone, xserver/desktopManager, paquetes, etc.). |
| `home.nix` | Configuración de home-manager para el usuario `mteo` (importa `home-modules/` y el módulo de DankMaterialShell). |
| `home-modules/git.nix` | Config de `programs.git` (usuario, email, safe.directory). |
| `home-modules/zsh.nix` | Config de zsh (aliases, `initExtra`/`initContent`). |
| `home-modules/ghostty.nix` | Config del terminal Ghostty. |
| `system/laptop/default.nix` | Config específica del host `laptop` (hostname, hardware particular). |
| `system/laptop/hardware-configuration.nix` | Config de hardware autogenerada para la laptop. |
| `system/PC/default.nix` | Config específica del host `pc-escritorio`. |
| `system/PC/hardware-configuration.nix` | Config de hardware autogenerada para la PC. |
| `system/PC/nvidia.nix` | Config específica de drivers Nvidia (solo PC). |
