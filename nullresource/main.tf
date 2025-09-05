resource "aws_instance" "ec2_instance" {
    ami = "ami-00bb6a80f01f03502"
    instance_type = "t2.micro"
    key_name = "my-demo-key"
    tags = {
       Name = "Terraform"
    }

    connection {
      type = "ssh"
      user = "ubuntu"
      agent = false
      host = self.public_ip
      private_key = file("./pem-key/my-demo-key.pem")
    }

    provisioner "remote-exec" {
      inline = [ "echo 'This is from Remote-exec' > /home/ubuntu/remote.txt" ]
    }  
}

resource "null_resource" "null_remote_exec" {
    connection {
      type = "ssh"
      user = "ubuntu"
      agent = false
      host = aws_instance.ec2_instance.public_ip
      private_key = file("./pem-key/my-demo-key.pem")
    }

    provisioner "remote-exec" {
      inline = [ "echo 'This is from Remote-exec null resource' > /home/ubuntu/remote-null.txt" ]
    }    
}