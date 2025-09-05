resource "tls_private_key" "rsa_private_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "key_pair_pem" {
  key_name = var.key_name
  public_key = tls_private_key.rsa_private_key.public_key_openssh
}

resource "local_file" "pem_file" {
    filename = var.pem_file_path
    content = tls_private_key.rsa_private_key.private_key_pem
    file_permission = "0400" 
}