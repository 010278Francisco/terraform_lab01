terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}



provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "prueba" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  security_groups= ["launch-wizard-4"]
  key_name= "ssh-proyecto"
  

  tags = {
    Name = "prueba"
  }
}
 


output "instance_public_ip" {
  description = "Obtener la IP publica de mi instancia"
  value = aws_instance.prueba.public_ip  // aws_instance.$NOMBRE-RECURSO-TIPO-aws_instance$.public_ip
}









