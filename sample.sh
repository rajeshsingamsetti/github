#!/bin/bash
while [ TRUE ]
do
read -p "Enter Username 1:" USER1
read -s -p "Please Enter The Password:" PASSWORD
if [ -z $USER1 ]; then
   echo "Please Enter A Valid Username."
else
   EXUSER=$(cat /etc/passwd | cut -d ":" -f 1 | grep -w "$USER1")
   echo $EXUSER
   if [[ "$EXUSER" == "$USER1" ]]; then
       echo "User Exists, please enter a unique username"
   else
       useradd -m $USER1
       chown $USER1:$USER1 /home/$USER1
       echo "$USER1:$PASSWORD" | sudo chpasswd
       echo "User $USER1 sucessfully created..!!"
   fi
fi
done
