provider "aws" {
    version = "~> 3.0"
    region = "sa-east-1"
  
}

# criar um resource

## Criar 3 máquinas(instâncias EC2)
resource "aws_instance" "dev" {
    count = 3
    ami = "ami-090006f29ecb2d79a"
    instance_type = "t2.micro"
    key_name = "terraform-alura"
    tags = {
      "Name" = "dev${count.index}"
    }
    vpc_security_group_ids = ["vpc-00fbb870d0a3f5da2"] #ID do security group (ID da VPC)
}

## Criar security groups

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks = ["179.251.246.120/32"] # IP permitido - IP dinâmico (ver em: https://whatismyipaddress.com/)
  }
  tags = {
    Name = "ssh"
  }
}
