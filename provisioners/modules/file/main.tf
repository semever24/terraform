resource "null_resource" "null_remote_exec" {
    connection {
      type = "ssh"
      user = var.user_name
      agent = false
      host = var.host_public_ip
      private_key = file(var.file_path)
    }

    provisioner "file" {
      source = var.source_path
      destination = var.destination_path
    }   
}