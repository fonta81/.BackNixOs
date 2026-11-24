#!/usr/bin/env bash
# generate-hardware.sh - Genera hardware-configuration.nix para un host nuevo
# Se ejecuta en la máquina destino (donde está el hardware real).
# Uso: ./scripts/generate-hardware.sh

set -euo pipefail

if [ $# -ne 0 ]; then
  echo "Uso: $0"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET_DIR="$REPO_ROOT/system/hosts/generic"
TARGET_FILE="$TARGET_DIR/hardware-configuration.nix"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Generando configuración de hardware para: generic"

# Generar en la máquina actual (donde está el hardware real)
sudo nixos-generate-config --dir "$TMP_DIR"

# Crear directorio del host en el repositorio
mkdir -p "$TARGET_DIR"

# Copiar al repositorio
cp "$TMP_DIR/hardware-configuration.nix" "$TARGET_FILE"

echo ""
echo "✓ Copiado a: $TARGET_FILE"
echo ""
echo "Pasos siguientes:"
echo "Revisa el host generic en flake.nix:"
echo "  ./system/hosts/generic/hardware-configuration.nix"
