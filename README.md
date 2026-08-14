# Estructura del Directorio NixOS

```text
/etc/nixos/
├── configuration.nix          # Configuración del sistema (bootloader, usuarios, servicios, etc.)
├── hardware-configuration.nix  # Detección de hardware generada automáticamente
├── home.nix                   # Configuración principal de Home Manager para el usuario 'mteo'
├── home-modules/              # Módulos de configuración de usuario
│   ├── ghostty.nix            # Configuración de la terminal Ghostty
│   ├── git.nix                # Configuración de Git (usuario, email, repositorios seguros)
│   └── zsh.nix                # Configuración de Zsh (aliases, oh-my-zsh, paquetes locales)
└── system/                    # Módulos del sistema
    └── nvidia.nix             # Configuración de drivers y controladores NVIDIA
```
