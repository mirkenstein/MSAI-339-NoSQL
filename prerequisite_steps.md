# Recommended Steps to be completed before attending the class
Installing the Docker Desktop and downloading the container images needed for the
exercises might take extra time.
It is recommended that you complete these steps in advance.

   
### Install Docker for your operating system. 
Start page: [Docker Desktop](https://www.docker.com/products/docker-desktop/)

 To test your Docker installation try the Hello-World example ad described here
[https://hub.docker.com/_/hello-world](https://hub.docker.com/_/hello-world)
```shell
docker run hello-world
```
You will see an output similar to this one 
```shell
$ docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
719385e32844: Pull complete
Digest: sha256:a13ec89cdf897b3e551bd9f89d499db6ff3a7f44c5b9eb8bca40da20eb4ea1fa
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.
```
### Download the docker images that we will need for the exercises
Elastic-Logstash-Kibana
```shell
docker pull docker.elastic.co/elasticsearch/elasticsearch:8.11.4
docker pull docker.elastic.co/kibana/kibana:8.11.4
docker pull docker.elastic.co/logstash/logstash:8.11.4
```
Streamsets
```shell
docker pull streamsets/datacollector:5.6.3
 ```


Next we will install the NoSQL database Elasticsearch together with its dashboard component called Kibana as described in the section
[Install Elastic-Kibana and Load Data](./ELK/README.md)
