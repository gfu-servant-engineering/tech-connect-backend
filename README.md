# tech-connect-backend

This repository hosts the backend components of Tech Connect and consists of a cloned strapi-docker repo and some set up scripts. The directory of scripts contains a read me with more details about the purpose/current state of the scripts but for the most part they will not be necessary in environment setup.

## Environment Setup

#### Install Docker CE

Below are the steps for installing Docker CE on a Debian Instance. We found we had the most success with this linux distribution but if you're using a different one, visit [Docker's Documentation](https://docs.docker.com/glossary/?term=installation) for necessary steps.

1. Update the `apt` package index:
```
$ sudo apt-get update
```

2. Install packages to allow `apt` to use a repository over HTTPS:
