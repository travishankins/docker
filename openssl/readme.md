# OpenSSL Container

This container provides an isolated environment for running OpenSSL commands. It’s useful for tasks such as generating certificates, converting key formats, and testing SSL/TLS configurations without installing OpenSSL directly on your host system.

## Prerequisites

- **Docker:** Make sure Docker is installed on your system.
- **Project Files:** Store your SSL files (e.g., keys, certificates, etc.) in your `~/Developer` folder (or adjust the paths as needed).

## Building the Image

From the root of your repository (or from the `/docker/openssl` directory), run the following command to build the Docker image for the ARM64 platform (compatible with Apple Silicon):

```bash
docker build --platform linux/arm64 -t openssl-container ./docker/openssl
Running the Container

You can run the container using the following command:

docker run --rm -it \
  --platform linux/arm64 \
  -v ~/Developer:/root/Developer \
  -w /root/Developer$(pwd | sed "s|$HOME/Developer||") \
  openssl-container
This command mounts your ~/Developer directory into the container at /root/Developer and sets the working directory inside the container to match your current directory relative to ~/Developer.

Example OpenSSL Commands

Once inside the container, you can use OpenSSL as you normally would. For example:

Check a Private Key:
openssl rsa -in priv.pem -check
Convert a PKCS7 Certificate to PEM:
openssl pkcs7 -print_certs -in config.crt -out config.pem
Bundle Key and Certificate into a PFX File:
openssl pkcs12 -export -out certificate.pfx -inkey priv.pem -in config.pem -certfile intermediate.crt
```
