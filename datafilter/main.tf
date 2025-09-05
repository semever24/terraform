data "aws_instance" "ec2_instance_status" {
  instance_id = "i-0a71b9f10bb431f19"
}

data "aws_ami" "ami_id" {
    most_recent = true

    filter {
      name = "name"
      values = [ "ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*" ] # Ubuntu 22.04, 64-bit
    }

    filter {
      name = "architecture"
      values = ["x86_64"]  # 64-bit architecture
    }

    owners = ["099720109477"] # Canonical (Official Ubuntu AMIs)  
}