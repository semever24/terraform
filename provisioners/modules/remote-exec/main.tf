resource "null_resource" "null_remote_exec" {
    connection {
      type = "ssh"
      user = var.user_name
      agent = false
      host = var.host_public_ip
      private_key = file(var.file_path)
    }

    provisioner "remote-exec" {
      inline = var.command
    }   
}