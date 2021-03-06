#!/bin/bash

source components/common.sh

Print "Setup YUM Repos"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG_FILE

StatCheck $?

Print "Install Mongodb"
yum install -y mongodb-org &>>$LOG_FILE
StatCheck $?

Print "Update MongoDB listen address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
StatCheck $?

Print "Start Mongodb"
systemctl enable mongod &>>$LOG_FILE && systemctl start mongod &>>$LOG_FILE
StatCheck $?


Print "Download Schema"
curl -f -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>$LOG_FILE
StatCheck $?

Print "Extract Schema"
cd /tmp && unzip -o mongodb.zip &>>$LOG_FILE
StatCheck $?

Print "Load Schema"
cd mongodb-main
for schema in catalogue users; do
  echo "Load $schema Schema"
  mongo < ${schema}.js &>>$LOG_FILE
  StatCheck $?
done
