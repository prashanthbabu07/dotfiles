#!/usr/bin/env bash

set -e

show_help() {
  cat <<EOF
Usage: $0 --root-path <path> --openapi-reference-path <path> --openapi-bundled-path <path> --redocly-config-path <path>

Required arguments:
  --root-path                Project root directory (absolute path)
  --openapi-reference-path   Path to OpenAPI reference YAML (relative to root)
  --openapi-bundled-path     Output path for bundled YAML (relative to root)
  --redocly-config-path      Path to Redocly config file (relative to root)
EOF
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --root-path) ROOT_PATH="$2"; shift 2 ;;
    --openapi-reference-path) OPENAPI_REFERENCE_PATH="$2"; shift 2 ;;
    --openapi-bundled-path) OPENAPI_BUNDLED_PATH="$2"; shift 2 ;;
    --redocly-config-path) REDOCLY_CONFIG_PATH="$2"; shift 2 ;;
    --help) show_help; exit 0 ;;
    *) echo "Unknown argument: $1"; show_help; exit 1 ;;
  esac
done

# Validate required arguments
if [[ -z "$ROOT_PATH" || -z "$OPENAPI_REFERENCE_PATH" || -z "$OPENAPI_BUNDLED_PATH" || -z "$REDOCLY_CONFIG_PATH" ]]; then
  echo "Error: Missing required arguments."
  show_help
  exit 1
fi

docker run --rm \
  -v "${ROOT_PATH}:/local" redocly/cli lint \
  "/local/${OPENAPI_REFERENCE_PATH}" \
  --config="/local/${REDOCLY_CONFIG_PATH}"

docker run --rm \
  -v "${ROOT_PATH}:/local" redocly/cli bundle \
  "/local/${OPENAPI_REFERENCE_PATH}" \
  -o "/local/${OPENAPI_BUNDLED_PATH}" \
  --ext yaml

