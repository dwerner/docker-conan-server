# docker-conan-server

Docker image definition for a [Conan.io](https://conan.io) server

## Running the server

First create the server container
```bash
mkdir conan_server
docker run \
    -p 9300:9300 \
    -v conan_server:/var/lib/conan \
    --name conan_server \
    dwerner/conan-server:latest
```

The configure the server by editting the `.conan_server/server.conf`
file. The `host_name` and `public_port` parameters are of particular
importance and must match the name of the docker host and the public
port exposed for the container.
