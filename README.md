# docker-postgresql-restore

## Description

This project allows you to run a containerized [PostgreSQL](https://www.postgresql.org/) instance with data from an exported data dump.

## Usage
* Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
* Clone this repository
* Export a dump of a PostgreSQL database as a `.tar` file
* Run the following command with optional build args:

`docker build -t <repository>:<tag> --build-arg POSTGRES_USER=<user> --build-arg POSTGRES_PASSWORD=<password> --build-arg FILE=<file> .`

* Run the following command, providing the desired host port:

`docker run -d -p <host-port>:5432 <repository>:<tag>`

* Defaults:
    * POSTGRES_USER=postgres
    * POSTGRES_PASSWORD=example
    * FILE=dump.tar
