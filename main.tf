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
}

## Criar security groups

