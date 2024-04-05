provider "aws" {
    region = "ap-south-1"
  
}
#ec2 instance
resource "aws_instance" "web" {
  ami           = "ami-007020fd9c84e18c7"
  instance_type = "t3.micro"
  iam_instance_profile ="${aws_iam_instance_profile.ec2_profile.name}"
  tags = {
    Name = "HelloWorld"
  }
}
