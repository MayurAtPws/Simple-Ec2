# To create a Ec2 instance with additional Volume attached and Mounted to it
provider "aws" {
  region = "us-east-1" # North Virginia
}

resource "aws_instance" "my_instance" {
  ami           = "ami-06aa3f7caf3a30282"  # Ubuntu 20.4 AMI ID from North Virginia
  instance_type = "t2.micro"

  root_block_device {
    volume_type = "gp2"
    volume_size = 10  # Increase root volume size to 10 GB
  }

  
  ebs_block_device {
    device_name = "/dev/sdf"  # 
    volume_type = "gp2"
    volume_size = 10
  }

  key_name = "mayurpws" # Using a keypair previously created on AWS

  user_data = file("attachVolume.sh") # Script to install and update the NGINX Page

  tags = {
    Name = "may_Terraform_Nginx"
  }
}

output "public_ip" {
  value = aws_instance.my_instance.public_ip # Show the created instance IP to view the webpage
}
