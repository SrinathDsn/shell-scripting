#!/bin/bash

source components/common.sh

Print "Configure YUM Repos"
curl -fsSL https://rpm.nodesource.com/setup_lts.x | bash - &>>${LOG_FILE}
StatCheck $?

Print "Install NodeJS"
yum install nodejs gcc-c++ -y &>>${LOG_FILE}
StatCheck $?

id ${APP_USER} &>>${LOG_FILE}
if [ $? -ne 0 ]; then
  Print "Add Application user"
  useradd ${APP_USER} &>>${LOG_FILE}
  StatCheck $?
fi


Print "Download App Component"
curl -f -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>${LOG_FILE}
StatCheck $?

Print "Cleanup old content"
rm -rf /home/${APP_USER}/catalogue &>>${LOG_FILE}
StatCheck $?

Print "Extract App Content"
cd /home/${APP_USER} &>>${LOG_FILE} && unzip -o /tmp/catalogue.zip &>>${LOG_FILE} && mv catalogue-main catalogue &>>${LOG_FILE}
StatCheck $?

Print "Install App Dependencies"
cd /home/${APP_USER}/catalogue &>>${LOG_FILE} && npm install &>>${LOG_FILE}
StatCheck $?

Print "Fix App User Permissions"
chown -R ${APP_USER}:${APP_USER} /home/${APP_USER}
StatCheck $?
