#!/usr/bin/env bash
# Build the Hugo site, or start the local preview server.
set -euo pipefail

cd "$(dirname "$0")"

usage() {
  cat <<'EOF'
Usage: ./build.sh [-r|--run]

  (no arguments)  Clean-build the site into public/
  -r, --run       Start the Hugo preview server instead of building
  -h, --help      Show this help
EOF
}

require_hugo() {
  if command -v hugo >/dev/null 2>&1; then
    return 0
  fi

  cat <<'EOF'

Hugo is not installed, so this site cannot be built yet.

Install Hugo, then run ./build.sh again:

  macOS (Homebrew):  brew install hugo
  Install guide:     https://gohugo.io/installation/

EOF
  exit 1
}

run_server=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    -r|--run)
      run_server=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      echo >&2
      usage >&2
      exit 1
      ;;
  esac
done

require_hugo

if [[ "$run_server" -eq 1 ]]; then
  echo "Starting the Hugo preview server. Press Ctrl-C to stop."
  exec hugo server
fi

rm -rf public
hugo --cleanDestinationDir

dest="$(cd public && pwd)"
echo
echo "Build complete."
echo "The site is in: ${dest}"
