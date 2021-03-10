#!/bin/sh

mysql -u root <<EOF
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON *.* TO 'groot'@'localhost' IDENTIFIED BY 'ImGroot';
FLUSH PRIVILEGES;
EOF
