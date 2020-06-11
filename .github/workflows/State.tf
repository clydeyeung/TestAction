provider "aws" {
  profile    = "default"
  #region     = var.region	
  region     = "us-east-1"
  access_key = "AKIAIHQOKY5ZLUPQZZ4A"
  secret_key = "FTTTBwxIj2mpUMpkZINiVX3b8+mTctfqtdYcOY7Q"
}

resource "aws_instance" "example" {
  #ami           = "ami-2757f631"
  ami			= "ami-085925f297f89fce1"
  instance_type = "t2.micro"
  key_name = "Test"
  iam_instance_profile = "EC2-Product"
  #vpc_security_group_ids = ["sg-fa75ffd7"]
  vpc_security_group_ids = ["sg-00f17b1d7426674c9"]
  subnet_id = "subnet-3a88be04"
  tags = {
	Name = "staging_20200605"
	}
  provisioner "local-exec" {
	command = "echo ${aws_instance.example.public_ip} >> pub_ip.txt"
	}
}
