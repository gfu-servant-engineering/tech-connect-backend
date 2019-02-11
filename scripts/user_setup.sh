#!/bin/bash

users=("kaylee" "lilie" "connor" "chris" "danielle")
pass=("sh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCuSOwJlCrpuuAjIotCdXVUPAAEcPd7TlOMiMi/tu0fU0W6loWKQv7j3Ncc81/FPf1569RAhcXhQI6GOs7mL/VZ+rK22KLVNdYQSapFXQChVaiHvPd/KzSCF79sv5Ds8qIuNCBm3MG8wUoo+CbtJvsQnHmcNPHimVYN7E75b3iJ5yipBI1AxFpPCFcuE/QevPP1A/W5yRkQxfhZo30uMDAqlC0Ti3M0zAzxunJCCvcT38QyLuU2TcUXbXnUA2GLAUvvNQTE9jvbX7ERLCI76Ge+cm8B93PwVHVcDNiaKcFUktvgyjPGlV9AcQvS6OERr4AjjNXbJV59MgguFUOzFVfb Kaylee@MSI" "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDXJ71Kt3A0wmSCwZScdCYyGD3TnQWICujKVtAObXewkBDkWEGkgFAAVGDxZyg8+nbxCuTo/n5bB8LwYnt7Cbioi5sPA7btynKdSwoMXMIZFN8sp0NXpnbCx9BjO7lfNpbOkd831Z8B/vKc1rPGUE81j8Non24lSUS7T428TUAmCe5oWhfXtec+20jYkhCAssYIHOsKfMtlGYQMORfR3ftiOp5SUtMipasxYYD0Blh20TJgKiKcX1EDYYud/sjwWBHnwF2JHrxTjLXxXItxlQMtin5NDC1GvRyOBpMrnFLfPAlBBWMAoXVSWADHQTebmxb6G9t4qoEPxwNTeMmRlbVl liliedelamotte@gmail.com" "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAs9BziDLOj5Ln3V7hPF4Y5jEDpxA00c6Y6w0B8bGE+AAffBTSfXO6gTlqvmLigWA71HzyUGQCa3oZLNkafb5OLdVQMCfpI9fUrGqbaOPkKMsFzjeL5IsCrOb3+R5QhEqEXYgMScNk7WyHCyYzMja8ocUASvbAxqvCbLYkUwbJca6JHN3GQer78reODb1x+ElV41i6dqRm3NpXdp5TuBQkybmGdAG1cl976l1qhfkRebG1WW5O94SCaSdn/SwQn8uyZ2FLuqVHxPWmwo2H/U4jxddOExK5xeHIAxqFRfebAVzfrpeEsYW7mKc4ZupTKIZfMtYBx/bldbZGDAzkS9raGw== rsa-key-20190124" "" "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZjqNBEjXU9jHwUhnGiMUZKL5a6f5Ko3/D3VYLGPCMSVgxIY1ct9SfJVapoF3exTzhHHmuge5yfaazE9daio0S4cuLD/KT6A14wJfzmK5OsUsd4hSAE1ko/2q564Mn+37shW/AX22YtG8X2HjgpTng1F/+rW4TC/496pTntk9hExl35/2+NA4ZV/DxvnuPDnGkOZytQeDP3cCtfMXbLzERnP/ST5k3slrZDpB/Hs8TsswKkwYpp9IzkXG+RWgwQxR2tt2zzIiPznG43NDc+LaJLkXXvVri23XU50XCHco+S6ktW1lyDR4Gsfv7IzXO5r4bOIWnna2OKREQpBDo1Mhb danielleince@Danielles-MacBook-Pro.local")

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
         [ $? -eq 0 ] && echo "$user has been added to system!" || echo "failed to add $user!"
         usermod -aG wheel $user
         AH="/home/$user"
         mkdir $AH/.ssh
         chmod 700 $AH/.ssh
         touch $AH/.ssh/authorized_keys
         echo "${pass[$user]}" > $AH/.ssh/authorized_keys
         chmod 600 $AH/.ssh/authorized_keys        
      fi
   done
else
   echo "Only root may add a user to the system"
   exit 2
fi

