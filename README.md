# Tech Connect Backend

This repository hosts the backend components of Tech Connect and consists of a cloned strapi-docker repo and some set up scripts. The directory of scripts contains a read me with more details about the purpose/current state of the scripts but for the most part they will not be necessary in environment setup.

## Environment Setup

#### Install Docker CE

Below are the steps for installing Docker CE on a Debian Instance. We found we had the most success with this linux distribution but if you're using a different one, visit [Docker's Documentation](https://docs.docker.com/glossary/?term=installation) for necessary steps.

1. Update the `apt` package index:
```
$ sudo apt-get update
```

2. Install packages to allow `apt` to use a repository over HTTPS:
```
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
```

3. Add Docker’s official GPG key:
```
$ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
```

4. Use the following command to set up the stable repository.
```
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
```

5. Update the `apt` package index.
```
$ sudo apt-get update
```

6. Install the latest version of Docker CE and containerd, or go to the next step to install a specific version:
```
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

7. Verify that Docker CE is installed correctly by running the `hello-world` image.
```
$ sudo docker run hello-world
```


### Install docker-compose

Before installing docker-compose verify that you don't already have it by running `sudo docker-compose`.

If it's not found, run the following command to install it:
```
$ sudo apt install docker-compose
```



## Run Strapi App

1. cd current_running_strapi
2. Run using `SUDO docker-compose up`


## Troubleshooting

If given a docker version error after running the `sudo docker-compose up` command, change the version in the `docker-compose.yml` file in your strapi project from 3 to 2. The problem should be resolved.

## Table Definitions

### experience
`experience_title`:`String`
`experience_description`:`text`
`profile`:relation to `profile` (many `experiences`, one `profile`)

### skill
`skill_name`:`String`
`profile`:relation to `profile` (many `experiences`, one `profile`)

### profile
`profile_name`:`String`
`skills`:relation to `skill` (many `skills`, one `profile`)
`experiences`:relation to `experience` (many `experiences`, one `profile`)
`projects`:relation to `project` (many `projects`, one `profile`)

### project
`project_name`:`String`
`project_image`:`Media` (could be image, pdf, etc)
`project_goals`:`text`
`project_holy_goals`:`text`
`project_description`:`text`
`project_timeline`:`date`
`project_help`:`text`
`profiles`:relation to `profile` (one `project`, many `profiles`)
