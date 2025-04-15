#!/bin/bash
# This script runs the Azure CLI/Terraform container.
# It mounts your local ~/.azure and ~/Developer directories
# and sets the working directory to the current directory relative to ~/Developer.

docker run --rm -it \
  --platform linux/arm64 \
  -v ~/.azure:/root/.azure \
  -v ~/Developer:/root/Developer \
  -w /root/Developer$(pwd | sed "s|$HOME/Developer||") \
  azure-terraform
