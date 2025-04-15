# Azure CLI/Terraform Container

This container provides a pre-configured environment for working with the Azure CLI and Terraform. It allows you to manage Azure resources and deploy Terraform configurations in a consistent, isolated environment without needing to install these tools directly on your host system.

## Prerequisites

- **Docker:** Make sure Docker is installed on your system.
- **Azure CLI Credentials:** Your Azure CLI credentials should be stored in your `~/.azure` directory.
- **Terraform Configurations:** Place your Terraform configuration files in your `~/Developer` folder (or adjust the paths as needed).

## Building the Image

From the root of your repository (or from the `/docker/azurecli-terraform` directory), run the following command to build the Docker image for the ARM64 platform (compatible with Apple Silicon):

```bash
docker build --platform linux/arm64 -t azure-terraform ./docker/azurecli-terraform
```

## Running the Container

You can run the container using the following command:

```bash
docker run --rm -it \
  --platform linux/arm64 \
  -v ~/.azure:/root/.azure \
  -v ~/Developer:/root/Developer \
  -w /root/Developer$(pwd | sed "s|$HOME/Developer||") \
  azure-terraform
```

This command mounts your `~/.azure` and `~/Developer` directories into the container, setting the working directory to the current directory relative to `~/Developer`.
