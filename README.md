# Opentheso Docker

Opentheso Docker est une version _dockérisée_ d'Opentheso. Cela permet de tester
[Opentheso](https://opentheso.huma-num.fr/opentheso/) sur un poste local sans
installation complexe.

Il faut d'abord installer [Docker
Desktop](https://docs.docker.com/engine/install/) sur son poste de travail, que
ce soit un PC Windows, un MAC ou une machine Linux.

1. **Docker Desktop** — Il faut avoir Docker Desktop installé sur son poste.
2. **Opentheso Docker** — Ce
3. **Construire les images Docker**
4. **Lancer Opentheso**

There are two options for running the Docker Containers:
1. Using Docker Compose to manage the containers for you
2. Using Docker directly to start each container

:warning: Pre-requisites :
1. Docker : last version (see https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
2. Place a copy of `opentheso2-23.09.01.war` in the `opentheso2/docker` directory.


## Building the Docker Image
The configuration for two Docker Images are provided; one image for Opentheso2 itself, and the other for a Postgres database which holds the Opentheso2 data. 

```
docker image build -t mycontainername/opentheso2-postgres -f Dockerfile-postgres .

docker image build -t mycontainername/opentheso2 .
```

## Running via Docker Compose

Simply execute:

```
cd opentheso2/docker

docker compose up -d
```

## Running directly with Docker

A Docker Container for the Opentheso2 Posgres database must be started before starting a container for Opentheso22 itself.

```
cd opentheso2/docker

docker run --name opentheso2-db --volume opentheso2-pgdata:/pgdata --env POSTGRES_USER=opentheso --env POSTGRES_PASSWORD=opentheso --env PGDATA=/pgdata mycontainername/opentheso2-postgres

docker run --name opentheso2 --link opentheso2-db --publish 8080:8080 -it mycontainername/opentheso2
```

## Accessing Opentheso2

Once the Docker Containers are running, you can access Opentheso2 in a web-browser by visiting: http://localhost:80/opentheso2


# Docker Volumes

The docker volume `opentheso2-pgdata` stores the database, if you want to start with a clean slate you can remove the volume and it will be re-created. To remove the volume just run:

```
docker volume rm opentheso2-pgdata
```
