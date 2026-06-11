provider "aws" {
  region = "eu-west-3"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

resource "aws_security_group" "web_sg" {
  name        = "formation-web-sg-etudiant10"
  description = "Allow SSH"
  vpc_id      = "vpc-069d4125c9d3310ee"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # --- PREMIER BLOC DE TAGS ---
  tags = {
    Name        = "formation-web-sg-etudiant10"
    Owner       = "etudiant10"
    Project     = "formation-terraform"
    Environment = "dev"
  }
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = "subnet-0542f3c290c618a77"
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  # Terraform va appliquer ces tags au moment de l'appel RunInstances
  tags = {
    Name        = "web-etudiant10"
    Owner       = "etudiant10"
    Project     = "tp03-ec2"
    Environment = "dev"
  }

  # On applique aussi les tags aux disques (EBS) car c'est souvent ça qui bloque
  volume_tags = {
    Name        = "web-etudiant10-disk"
    Owner       = "etudiant10"
    Project     = "tp03-ec2"
    Environment = "dev"
  }

  user_data = <<-EOT
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Hello World</h1>" > /var/www/html/index.html
  EOT
}
