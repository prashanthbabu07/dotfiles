#!/usr/bin/env bash

ROOT_PATH="$(pwd)"
OPENAPI_REFERENCE_PATH="openapi/descriptions/Organization-OpenAPI3.yaml"
OPENAPI_BUNDLED_PATH="openapi/bundled/Organization-OpenAPI3.yaml"
REDOCLY_CONFIG_PATH="openapi/tools/redocly-cli/.redocly.lint-ignore.yaml"

bundle.sh \
  --root-path "$ROOT_PATH" \
  --openapi-reference-path "$OPENAPI_REFERENCE_PATH" \
  --openapi-bundled-path "$OPENAPI_BUNDLED_PATH" \
  --redocly-config-path "$REDOCLY_CONFIG_PATH"

