terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}

variable "reponame_terraform" {}
variable "container_port_terraform" {}


provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = var.reponame_terraform 
  ports {
    internal = 80
    external = var.container_port_terraform
  }
}
