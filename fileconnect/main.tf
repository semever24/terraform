provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-00bb6a80f01f03502" # Replace with your own AMI ID
  instance_type = "t2.micro"
  key_name      = "my-demo-key"         # Replace with your key pair name

  # Security group settings
  security_groups = ["default"]

  # User data or other configurations can be added here

  # Use the file provisioner to copy the file to the EC2 instance
  provisioner "file" {
    source      = "./pem-keys/file.txt"   # Path to your local file
    destination = "/home/ubuntu/file.txt"           # Path on the EC2 instance

    connection {
      type        = "ssh"
      user        = "ubuntu" # Default user for Ubuntu EC2 instances
      agent       = false  
      private_key = file("./pem-keys/my-demo-key.pem") # Path to your private key
      host        = aws_instance.example.public_ip
    }
  }

  tags = {
    Name = "example-instance"
  }
}

output "instance_ip" {
  value = aws_instance.example.public_ip
}