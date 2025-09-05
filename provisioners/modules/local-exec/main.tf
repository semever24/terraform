resource "null_resource" "null_local_exec" {
  provisioner "local-exec" {
    command = "echo 'This is ec2 public ip: ${var.public_ip}' > conf/inventory"
  }
}