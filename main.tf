### Infrastucture As Code
### Terraform Config file

provider "aws" {
  region = "us-east-1"  # Set your preferred AWS region
  #access_key = "AKIA4YOTRCANSAPYITEW"
  #secret_key = "eOTgnC8xRUl6pyeIxpPfk+W5tg5fx6TyIA7A0ibp"
}
# Use the existing security group by ID
data "aws_security_group" "existing_sg" {
  id = "sg-0123456789abcdef0"  # Replace with your actual security group ID
}

# Define an AWS EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0fc5d935ebf8bc3bc"  # Use the appropriate AMI for your region
  instance_type = "t2.medium"
  key_name      = "Assignment1"  # Set your SSH key pair name
vpc_security_group_ids = ["sg-0123456789abcdef0", "new-security-group-id"]
  tags = {                                                
    Name = "kube-S1"
  }
}
resource "aws_instance" "example2" {
  ami           = "ami-0fc5d935ebf8bc3bc"  # Use the appropriate AMI for your region
  instance_type = "t2.medium"
  key_name      = "Assignment1"  # Set your SSH key pair name
vpc_security_group_ids = ["sg-0123456789abcdef0", "new-security-group-id"]
  tags = {
    Name = "kube-S2"
  }
}
resource "aws_instance" "Master" {
  ami           = "ami-0fc5d935ebf8bc3bc"  # Use the appropriate AMI for your region
  instance_type = "t2.medium"
  key_name      = "Assignment1"  # Set your SSH key pair name
vpc_security_group_ids = ["sg-0123456789abcdef0", "new-security-group-id"]
  tags = {
    Name = "kube-Master"
  }
}
