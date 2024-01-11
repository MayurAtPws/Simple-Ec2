provider "aws" {
  region = "us-east-1" # Nrth Vgna
}

resource "aws_instance" "my_instance" {
  ami           = "ami-06aa3f7caf3a30282"  # Ubuntu 20.4 AMI ID from North Virginia
  instance_type = "t2.micro"

  root_block_device {
    volume_type = "gp2"
    volume_size = 10  # Increase root volume size to 10 GB
  }

  key_name = "mayurpws" #using a keypair previously createdb on AWS

  user_data = file("startNginx.sh") # Script to install and Update the NGINX Page

  tags = {
    Name = "may_Terraform_Nginx"
  }
}

output "public_ip" {
  value = aws_instance.my_instance.public_ip # Show the Created Instance IP to view the Webpage
}
