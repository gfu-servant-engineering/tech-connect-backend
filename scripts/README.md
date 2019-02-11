# Server Configuration Scripts

This directory contains the beginnings of the scripts used to configure our backend server. Each are works in progress and will continue to be updated throughout the semester. Each script is detailed below with its purpose and current status.

### server_config.sh
This script installs all necessary support for docker and clones the strapi docker repo. It is currently using ap as the installation package manager. If running it on a distribution that does not support, just edit the script to use the correct package manager.

### server_setup.sh
This was the first script written and is considered a trial run. The goals of this script include:
- add all five users
- configure each user for ssh auth and sudo-ness
- install git, node, and strapi.
To help with development and multiple people working on it, we decided to split it into multiple scripts which are detailed below. 

### user_setup.sh
This script modularized user creation and configuration. The goal of this script is to create all five users, add them to the sudoers group, create an .ssh directory and add their ssh key to authorized keys. This script contains some bugs in its current state. **These bugs include incorrect passwords and permissions.** These bugs are fixed in *test.sh*.

### test.sh
This is an updated script that improves upon *user_setup.sh*. There are no current bugs in this script other than the fact we have been unable to ssh to the created users despite the correct keys in authorized_keys. We will continue to test this.

### rm_users.sh
This script is only for testing purposes. **DO NOT RUN ON A FULLY CONFIGURED SERVER** 
