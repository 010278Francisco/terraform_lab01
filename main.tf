
#//////////////////////////////////////////////////////////
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}



#//////////////////////////////////////////////////////////
provider "aws" {
  region  = var.aws_region
  access_key = var.acces_key
  secret_key = var.secret_key
}

#Creammos ec2 instance
resource "aws_instance" "myFirstInstance"{
  ami    = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  security_groups = [var.security_group]
  tags={
  	Name= var.tag_name

	}
}








