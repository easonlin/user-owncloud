CREATE DATABASE IF NOT EXISTS owncloud;
GRANT ALL ON owncloud.* TO 'owncloud'@'localhost' IDENTIFIED BY 'PASSWORD';
FLUSH PRIVILEGES;