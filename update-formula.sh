#!/bin/sh
# Usage: ./update-formula.sh <version>
# Example: ./update-formula.sh 0.0.1
#
# Fetches SHA256 checksums from a GitHub release and updates Formula/egpu.rb.
# Run from the root of the homebrew-gpu-cli-tap repository after each new release.

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <version>"
  echo "Example: $0 0.0.1"
  exit 1
fi

VERSION="$1"
BASE_URL="https://github.com/exabits-xyz/gpu-cli/releases/download/v${VERSION}"

echo "Fetching checksums for v${VERSION}..."
CHECKSUMS=$(curl -sL "${BASE_URL}/checksums.txt")

if [ -z "$CHECKSUMS" ]; then
  echo "Error: Could not fetch checksums. Check that v${VERSION} release exists on GitHub."
  exit 1
fi

get_sha256() {
  echo "$CHECKSUMS" | grep "$1" | awk '{print $1}'
}

SHA_DARWIN_ARM64=$(get_sha256 "egpu_darwin_arm64.tar.gz")
SHA_DARWIN_AMD64=$(get_sha256 "egpu_darwin_amd64.tar.gz")
SHA_LINUX_ARM64=$(get_sha256 "egpu_linux_arm64.tar.gz")
SHA_LINUX_AMD64=$(get_sha256 "egpu_linux_amd64.tar.gz")

if [ -z "$SHA_DARWIN_ARM64" ] || [ -z "$SHA_DARWIN_AMD64" ] || [ -z "$SHA_LINUX_ARM64" ] || [ -z "$SHA_LINUX_AMD64" ]; then
  echo "Error: Could not find one or more checksums in the release."
  exit 1
fi

echo "darwin_arm64 : $SHA_DARWIN_ARM64"
echo "darwin_amd64 : $SHA_DARWIN_AMD64"
echo "linux_arm64  : $SHA_LINUX_ARM64"
echo "linux_amd64  : $SHA_LINUX_AMD64"

FORMULA="Formula/egpu.rb"

awk -v ver="$VERSION" \
    -v da64="$SHA_DARWIN_ARM64" \
    -v dx64="$SHA_DARWIN_AMD64" \
    -v la64="$SHA_LINUX_ARM64" \
    -v lx64="$SHA_LINUX_AMD64" '
  /version "[^"]*"/ { sub(/version "[^"]*"/, "version \"" ver "\"") }
  /darwin_arm64/    { next_sha=da64 }
  /darwin_amd64/    { next_sha=dx64 }
  /linux_arm64/     { next_sha=la64 }
  /linux_amd64/     { next_sha=lx64 }
  /sha256 / && next_sha != "" {
    sub(/sha256 "[^"]*"/, "sha256 \"" next_sha "\"")
    next_sha=""
  }
  { print }
' "$FORMULA" > "${FORMULA}.tmp" && mv "${FORMULA}.tmp" "$FORMULA"

echo ""
echo "Formula/egpu.rb updated to v${VERSION}."
echo "Review the changes, then commit and push:"
echo "  git add Formula/egpu.rb"
echo "  git commit -m \"egpu v${VERSION}\""
echo "  git push"
