#!/usr/bin/env bash
# generate-hardware.sh - Genera hardware-configuration.nix para un host nuevo
# Se ejecuta en la máquina destino (donde está el hardware real).
# Uso: ./scripts/generate-hardware.sh <nombre-host>
# Ejemplo: ./scripts/generate-hardware.sh mi-servidor

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Uso: $0 <nombre-host>"
  echo "Ejemplo: $0 mi-servidor"
  exit 1
fi

HOST_NAME="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET_DIR="$REPO_ROOT/system/hosts/$HOST_NAME"
TARGET_FILE="$TARGET_DIR/hardware-configuration.nix"
TMP_FILE="/tmp/hardware-config-$HOST_NAME.nix"

echo "Generando configuración de hardware para: $HOST_NAME"

# Generar en la máquina actual (donde está el hardware real)
sudo nixos-generate-config --file "$TMP_FILE"

# Crear directorio del host en el repositorio
mkdir -p "$TARGET_DIR"

# Copiar al repositorio
cp "$TMP_FILE" "$TARGET_FILE"

echo ""
echo "✓ Copiado a: $TARGET_FILE"
echo ""
echo "Pasos siguientes:"
echo "1. Crea system/hosts/$HOST_NAME/default.nix"
echo "2. Agrega al flake.nix:"
echo "   $HOST_NAME = mkHost ["
echo "     ./system/hosts/$HOST_NAME/hardware-configuration.nix"
echo "     ./system/hosts/$HOST_NAME/default.nix"
echo "   ];"
