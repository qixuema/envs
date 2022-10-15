# The following example starts a container and configures it to always restart unless it is explicitly stopped or Docker is restarted.
```shell
docker run -d --restart unless-stopped <container name>
```

# This command changes the restart policy for an already running container named <container name>.
```shell
docker update --restart unless-stopped <container name>
```