#!/bin/bash

users=("kaylee" "lilie" "connor" "chris")

echo
echo "************* CREATING USERS *****************"
echo

if [ $(id -u) -eq 0 ]; then
   for user in ${users[@]}; do

      egrep "^$user" /etc/passwd >/dev/null

      if [ $? -eq 0 ]; then
         echo "$user already exists"

      else
         useradd -m -p 'd0n0t3nt3r' $user
         usermod -aG wheel $user
         [ $? -eq 0 ] && echo "$user has been added to system!" || echo "failed to add $user!"
         
         touch .ssh/authorized_keys
         echo "${pass[$user]}" > .ssh/authorized_keys
         echo 600 .ssh/authorized_keys
         logout
      fi
   done
else
   echo "Only root may add a user to the system"
   exit 2
fi

echo
echo "************* CHECKING INSTALLATION *****************"
echo

# check git installation
if hash git 2>/dev/null; then
   echo "git is already installed. run the command git --version to check the current version"
   echo
else
   echo "installing git..."
   yum install git
   echo
fi

#check node installation
if hash node 2>/dev/null; then
   echo "node.js is already installed..."
   echo
else
   echo "installing node.js..."
   yum install rh-nodejs8
   echo
fi

#check nvm installation
if type nvm >/dev/null; then
   echo "nvm is already installed..."
   echo
else
   echo "installing nvm..."
   curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
   echo

   # need to reinstall node :/
   nvm install node
   echo "if there is an error with nvm run the following commands"
   echo "exec bash"
   echo " nvm install node"
fi

#check strapi installation
if hash strapi 2>/dev/null; then
   echo "strapi is already installed..."
   echo
else
   echo "installing strapi..."
   npm install strapi@alpha -g
   echo
fi

echo "installation complete"
echo
echo "************* CLONE BACKEND *****************"
echo

#git clone https://github.com/gfu-servant-engineering/tech-connect-backend.git

