
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


provider "docker" {}


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

