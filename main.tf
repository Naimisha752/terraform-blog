provider "aws" {
  region     = "us-east-1"
  
  
}

#Create a new EC2 launch configuration
resource "aws_instance" "ec2_public" {
  ami                         = ami-0b5eea76982371e91
  instance_type               = t2.micro
  key_name                    = nm-1
  security_groups             = ["${sg-073428dd2f5e5ee88}"]
  subnet_id                   = subnet-0e17f101bc52fd133
  associate_public_ip_address = true
  #user_data                   = "${data.template_file.provision.rendered}"
  #iam_instance_profile = "${aws_iam_instance_profile.some_profile.id}"
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name" = "EC2-PUBLIC"
  }
  
 
}
#Create a new EC2 launch configuration
resource "aws_instance" "ec2_private" {
  ami                         = ami-0b5eea76982371e91
  instance_type               = t2.micro
  key_name                    = nm-1
  security_groups             = ["${sg-073428dd2f5e5ee88}"]
  subnet_id                   = subnet-0e17f101bc52fd133
  associate_public_ip_address = false
  #user_data                   = "${data.template_file.provision.rendered}"
  #iam_instance_profile = "${aws_iam_instance_profile.some_profile.id}"
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name" = "EC2-PRIVATE"
  }
 
}
stages {
}
