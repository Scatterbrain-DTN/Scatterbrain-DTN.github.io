#!/bin/bash

# get the directory in which this script is located (the theme source dir)
SOURCE_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

# create the container for zola builds and tailwindcss updates
podman build -t develop-zola-tailwindcss "${SOURCE_DIR}" || exit 2

# update the CSS file using tailwindcss
podman run --rm -v ${SOURCE_DIR}:/source -w /source develop-zola-tailwindcss \
    tailwindcss -i src/css/main.css -o static/css/main.css --minify || exit 3
