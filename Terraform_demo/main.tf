terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.12.2"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

# Create a Image
resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

# Start a container
resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "mynew_container"

  ports {
    internal = 80
    external = 8000
}
}