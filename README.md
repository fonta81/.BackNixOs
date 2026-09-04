# Estructura del Proyecto

```text
./
├── LICENSE
├── README.md
├── configuration.nix
├── core/
│   └── packages.nix
├── flake.lock
├── flake.nix
├── home.nix
├── home-modules/
│   ├── ghostty.nix
│   ├── git.nix
│   ├── lazyvim.nix
│   └── zsh.nix
└── system/
    └── hosts/
        ├── PC/
        │   ├── default.nix
        │   ├── hardware-configuration.nix
        │   └── nvidia.nix
        └── laptop/
            ├── amd.nix
            ├── default.nix
            └── hardware-configuration.nix
```

## Descripción rápida

| Archivo/Carpeta | Propósito |
| --- | --- |
| `flake.nix` | Entry point del flake: define los inputs y las `nixosConfigurations`. |
| `flake.lock` | Versiones fijadas de todos los inputs. |
| `configuration.nix` | Configuración de sistema compartida. |
| `core/packages.nix` | Definición y organización de paquetes principales. |
| `home.nix` | Configuración de home-manager para el usuario `mteo`. |
| `home-modules/git.nix` | Config de `programs.git`. |
| `home-modules/zsh.nix` | Config de zsh. |
| `home-modules/ghostty.nix` | Config del terminal Ghostty. |
| `home-modules/lazyvim.nix` | Config del editor LazyVim. |
| `system/hosts/laptop/default.nix` | Config específica del host `laptop`. |
| `system/hosts/laptop/hardware-configuration.nix` | Config de hardware de la laptop. |
| `system/hosts/laptop/amd.nix` | Config específica AMD (laptop). |
| `system/hosts/PC/default.nix` | Config específica del host `PC`. |
| `system/hosts/PC/hardware-configuration.nix` | Config de hardware de la PC. |
| `system/hosts/PC/nvidia.nix` | Config de drivers Nvidia (PC). |
