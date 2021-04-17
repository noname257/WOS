provider "aws" {
  region = "eu-north-1"
  access_key = "your key"
  secret_key = "your key"
}

resource "aws_instance" "ubuntu_Intstance" {
  count = 1
  ami = "ami-0ed17ff3d78e74700"
  instance_type = "t3.micro"
  key_name = "terraform"
  vpc_security_group_ids = [aws_security_group.ubuntuWeb.id]

tags = {
  Name = "Jenkins ubuntu"
 }
}

resource "aws_security_group" "ubuntuWeb" {
  name = "ubuntuWeb"
  description = "Allow 22 , 80 , 8080"
  ingress {
    description = "allow 22 port"
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow 80 port"
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
    }
  ingress {
    description = "allow 8080 port"
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
      }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

