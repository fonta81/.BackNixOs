# Estructura del Proyecto

```text
./
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
├── core/
│   ├── config/
│   │   ├── locale.nix
│   │   └── packages.nix
│   ├── services/
│   │   ├── desktop.nix
│   │   ├── dms.nix
│   │   └── steam.nix
│   ├── system/
│   │   ├── boot.nix
│   │   ├── networking.nix
│   │   └── nix-settings.nix
│   └── users/
│       └── user.nix
└── system/
    └── hosts/
        ├── laptop/
        │   ├── amd.nix
        │   ├── default.nix
        │   └── hardware-configuration.nix
        └── PC/
            ├── default.nix
            ├── hardware-configuration.nix
            └── nvidia.nix
```

## Descripción rápida

| Archivo/Carpeta | Propósito |
| --- | --- |
| `flake.nix` | Entry point del flake: define los inputs y las `nixosConfigurations`. |
| `flake.lock` | Versiones fijadas de todos los inputs. |
| `configuration.nix` | Configuración de sistema compartida. |
| `core/config/locale.nix` | Configuración de localización e idioma. |
| `core/config/packages.nix` | Definición y organización de paquetes principales. |
| `core/services/desktop.nix` | Configuración del entorno de escritorio. |
| `core/services/dms.nix` | Configuración del Display Manager. |
| `core/services/steam.nix` | Configuración de Steam. |
| `core/system/boot.nix` | Configuración del cargador de arranque (bootloader). |
| `core/system/networking.nix` | Configuración de red. |
| `core/system/nix-settings.nix` | Ajustes generales de Nix. |
| `core/users/user.nix` | Configuración del usuario. |
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
