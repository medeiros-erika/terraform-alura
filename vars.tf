# Mapeando as variáveis

# Definir variável para 'amis'
variable "amis" {
    type = map

    default = {
        "sa-east-1" = "ami-090006f29ecb2d79a"
        "us-east-2" = "ami-0b614a5d911900a9b"
    }
  
}
# Definir variável para cidr_blocks (evitar ter que editar manualmente cada security group)
variable "cdirs_acessos_remotos"{
    type = list
    
    default = ["179.251.246.120/32"]
}

# Definir variável para 'key_name'
variable "key_name" {
    default = "terraform-alura"
}