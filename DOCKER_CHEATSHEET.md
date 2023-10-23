#Docker Cheat Sheet 

### Network
```shell
 docker network inspect
 docker network inspect <name>
 ```
Attach container to a network
https://docs.docker.com/engine/reference/commandline/network_connect/
```shell
docker network connect <network> <container>
```
### Volumes
Volumes are not removed with the container termination. To inspect existing volumes use these commands
```shell
docker volume ls 
docker volume inspect <volume name>
```


