#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World depuis $(hostname -f)</h1>" > /var/lib/httpd/html/index.html