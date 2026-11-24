#!/usr/bin/env bash

set -euo pipefail

TEST_ROOT="$(mktemp -d)"
trap 'rm -rf "$TEST_ROOT"; rm -f /tmp/hardware-config-generic.nix' EXIT

mkdir -p "$TEST_ROOT/scripts" "$TEST_ROOT/mock-bin"
cp scripts/generate-hardware.sh "$TEST_ROOT/scripts/generate-hardware.sh"

cat > "$TEST_ROOT/mock-bin/nixos-generate-config" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
target="${@: -1}"
printf 'generated hardware\n' > "$target"
EOF

cat > "$TEST_ROOT/mock-bin/sudo" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
nixos-generate-config "$@"
EOF

chmod +x \
  "$TEST_ROOT/mock-bin/nixos-generate-config" \
  "$TEST_ROOT/mock-bin/sudo" \
  "$TEST_ROOT/scripts/generate-hardware.sh"

(
  cd "$TEST_ROOT"
  PATH="$TEST_ROOT/mock-bin:$PATH" ./scripts/generate-hardware.sh
)

test -f "$TEST_ROOT/system/hosts/generic/hardware-configuration.nix"
grep -Fx 'generated hardware' \
  "$TEST_ROOT/system/hosts/generic/hardware-configuration.nix" >/dev/null

if (
  cd "$TEST_ROOT"
  PATH="$TEST_ROOT/mock-bin:$PATH" ./scripts/generate-hardware.sh unexpected-host
) 2>/dev/null; then
  echo "FAIL: script accepted an unexpected host argument" >&2
  exit 1
fi

test ! -d "$TEST_ROOT/system/hosts/unexpected-host"

echo "PASS: generate-hardware uses system/hosts/generic"
