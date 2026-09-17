#!/usr/bin/env bash

set -euo pipefail

readonly expected_output="alo test"

if [[ ! -x ./pp ]]; then
    echo "Error: ./pp has not been built. Run 'make' first." >&2
    exit 1
fi

if diff -u <(printf '%s\n' "$expected_output") <(./pp); then
    echo "✓ Program output matches the expected value."
else
    echo "✗ Program output does not match the expected value." >&2
    exit 1
fi
