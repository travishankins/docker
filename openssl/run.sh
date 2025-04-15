#!/bin/bash
# This script runs the OpenSSL container with your local Developer folder mounted.
# It sets the working directory inside the container to match your current directory relative to ~/Developer.

# Calculate the subdirectory relative to ~/Developer.
SUBDIR=$(pwd | sed "s|$HOME/Developer||")

docker run --rm -it \
  --platform linux/arm64 \
  -v ~/Developer:/root/Developer \
  -w /root/Developer${SUBDIR} \
  openssl-container
