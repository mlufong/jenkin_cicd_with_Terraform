provider "aws" {
    region = "us-west-2" #replace this region with the region you are working in
  
}


resource "aws_instance" "dev-ec2" {

    ami = var.ami_id
    instance_type = var.dev_instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.security_group_ids
    key_name = var.key_pair


    tags = {
      Name = "dev-ec2"
    }
  
}

resource "aws_instance" "prod-ec2" {

    ami = var.ami_id
    instance_type = var.prod_instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.security_group_ids
    key_name = var.key_pair


    tags = {
      Name = "prod-ec2"
    }
  
}

resource "aws_s3_bucket" "prod-s3-bucket" {
    bucket = "prod-s3-bucket"
    acl = "private"

    tags = {
      Name = "prod-s3-bucket"
    }
  
}