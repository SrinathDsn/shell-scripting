#!/bin/bash

StatCheck() {
  if [ $1 -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
  else
    echo "\e[31mFAILURE\e[0m"
    exit 2
  fi
}

Print() {
  echo -e "\e[36m $11 \e[0m"
}

USER_ID=$(id -u)
if [ "$USER_ID" -ne 0]; then
  echo You should run your script as sudo or root user
  exit 1
fi

Print "Installing Nginx"
yum install nginx -y
StatCheck $?

Print "Downloading Nginx Content"
curl -f -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
StatCheck $?

Print "Cleanup Old Nginx content and extract new downloaded archive"
rm -rf /usr/share/nginx/html/*
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
StatCheck $?

Print "Starting Nginx"
systemctl restart nginx
StatCheck $?
systemctl enable nginx
