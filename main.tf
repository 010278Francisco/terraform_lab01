terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}


variable "reponame" {}
variable "container_port" {}


#provider "docker" {}


resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = var.reponame #Se manda llamar las variable nombre directo de nuestro jenkingsPipeline
  ports {
    internal = 80
    external = var.container_port  #Se manda llamar las variable del puerto directo de nuestro jenkingsPipeline
  }
}

provider "aws" {
  region  = var.aws_region
}


#Se crea el grupo de seguridad y la reglas
resource "aws_security_group" "my_security_group"{
	name = var.security_group
	description = "security group for ec2 instance"

	ingress{
		from_port   = 8000
		to_port     = 8000
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]

	}
	ingress{
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]

	}
	egress{
		from_port   = 0
		to_port     = 65535
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]

	}

	tags ={
	 Name = var.security_group 

	}
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


#Craamos la ip elastic
resource "aws_eip" "myFirstInstance"{
  vpc  = true
  instance = aws_instance.myFirstInstance.id
  tags={
	Name = "my_elastic_ip"

	}

}




