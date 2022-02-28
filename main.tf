provider "aws" {
    version = "~> 3.0"
    region = "sa-east-1"
  
}

provider "aws" {
    alias = "us-east-2"
    version = "~> 3.0"
    region = "us-east-2"
  
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
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"] #ID do security group (associa security group a instância EC2, usei o comando 'terraform show' pra ver o id)
}


## Criar a instância onde o S3 estará
resource "aws_instance" "dev4" {
    ami = "ami-090006f29ecb2d79a"
    instance_type = "t2.micro"
    key_name = "terraform-alura"
    tags = {
      "Name" = "dev4"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"] #ID do security group (associa security group a instância EC2, usei o comando 'terraform show' pra ver o id)
    depends_on = [aws_s3_bucket.dev4] # Faz referência ao resource "aws_s3_bucket" "dev4"
}

## Criar a instância onde o S3 estará
resource "aws_instance" "dev5" {
    ami = "ami-090006f29ecb2d79a"
    instance_type = "t2.micro"
    key_name = "terraform-alura"
    tags = {
      "Name" = "dev5"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"] #ID do security group (associa security group a instância EC2, usei o comando 'terraform show' pra ver o id)
}

## Criar máquina dev6 em outra region (deverá criar em paralelo: security group, ami, etc pois mudou a region)
resource "aws_instance" "dev6" {
    provider = aws.us-east-2
    ami = "ami-0b614a5d911900a9b"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
      "Name" = "dev6"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"] #ID do security group (fazendo referência ao security group da region us-east-1
    depends_on = [aws_dynamodb_table.dynamodb-homol]
}

# Criar o bucket S3 numa nova instância EC2 (o bucket é multiregional, não precisa identificar a region)

resource "aws_s3_bucket" "dev4" {
  bucket = "erika-dev4"
  acl = "private"

  tags = {
    Name        = "erika-dev4"
  }
}

# Criar resource Dynamo

resource "aws_dynamodb_table" "dynamodb-homol" {
  provider = aws.us-east-2
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST" # pagamento sob demanda
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}