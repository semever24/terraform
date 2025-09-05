resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Allow inbound traffic for web server"

  # Inbound Rule: Allow HTTP (Port 80) from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open to the world
  }

  # Inbound Rule: Allow SSH (Port 22) from a specific IP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["167.103.7.111/32"]  # Replace with your IP for security
  }

  # Outbound Rule: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebServerSecurityGroup"
  }
}

resource "aws_instance" "web_server" {
  ami           = "ami-00bb6a80f01f03502"  # Replace with a valid AMI ID
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.web_sg.id]  # Attach SG to instance

  tags = {
    Name = "WebServer"
  }
}