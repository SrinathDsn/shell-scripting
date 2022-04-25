#!/bin/bash

source components/common.sh


Print "Configure YUM Repo"
curl -f -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo &>>${LOG_FILE}
StatCheck $?

Print "Install MYSQL"
yum install mysql-community-server -y &>>${LOG_FILE}
StatCheck $?

Print "Start MySQL Service"
systemctl enable mysqld &>>${LOG_FILE} && systemctl start mysqld &>>${LOG_FILE}
StatCheck $?

echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('Roboshop@1');" >/tmp/rootpass.sql

DEFAULT_ROOT_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
mysql -uroot -p"${DEFAULT_ROOT_PASSWORD}" </tmp/rootpass.sql


