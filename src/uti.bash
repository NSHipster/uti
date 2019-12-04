#!/bin/bash

set -r

set -o errexit
set -o pipefail
set -o nounset

if ! [ -x "$(command -v mdls)" ]; then
    echo 'error: mdls command not available.' >&2
    exit 1
fi

if [[ $# -eq 0 ]]; then
    echo 'usage: uti path [path...]' >&2
    exit 0
fi

for arg in "$@"; do
    if ! { [ -f "$arg" ] || [ -d "$arg" ]; }; then
        echo "error: $arg is not a file or directory" >&2
        exit 1
    fi
done

mdls -name kMDItemContentType "$@" |
    sed -E 's/kMDItemContentType = "(.+)"/\1/'
