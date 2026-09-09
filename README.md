# Project Structure

[Español](README.es.md)

```text
./
├── LICENSE
├── README.md
├── README.es.md
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

## Quick Description

| File/Folder | Purpose |
| --- | --- |
| `flake.nix` | Flake entry point: defines inputs and `nixosConfigurations`. |
| `flake.lock` | Pinned versions of all inputs. |
| `configuration.nix` | Shared system configuration. |
| `core/config/locale.nix` | Localization and language configuration. |
| `core/config/packages.nix` | Main package definition and organization. |
| `core/services/desktop.nix` | Desktop environment configuration. |
| `core/services/dms.nix` | Display Manager configuration. |
| `core/services/steam.nix` | Steam configuration. |
| `core/system/boot.nix` | Bootloader configuration. |
| `core/system/networking.nix` | Network configuration. |
| `core/system/nix-settings.nix` | General Nix settings. |
| `core/users/user.nix` | User configuration. |
| `home.nix` | Home-manager configuration for user `mteo`. |
| `home-modules/git.nix` | `programs.git` config. |
| `home-modules/zsh.nix` | zsh config. |
| `home-modules/ghostty.nix` | Ghostty terminal config. |
| `home-modules/lazyvim.nix` | LazyVim editor config. |
| `system/hosts/laptop/default.nix` | Host specific config for `laptop`. |
| `system/hosts/laptop/hardware-configuration.nix` | Hardware config for laptop. |
| `system/hosts/laptop/amd.nix` | Specific AMD config (laptop). |
| `system/hosts/PC/default.nix` | Host specific config for `PC`. |
| `system/hosts/PC/hardware-configuration.nix` | Hardware config for PC. |
| `system/hosts/PC/nvidia.nix` | Nvidia drivers config (PC). |
