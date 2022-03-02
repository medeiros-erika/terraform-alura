#  Permite dar o comando "terraform output" e printar uma informação
output "dev6" {
    value = "${aws_instance.dev5.public_ip}"
}