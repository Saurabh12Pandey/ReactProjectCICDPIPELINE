terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Pull the React app image from Docker Hub
resource "docker_image" "react_app" {
  name         = "sp8970196621/react-app"   # Replace with your Docker Hub repository/image name
  keep_locally = false  # Set to true if you want to keep the image locally
}

# Create a Docker container using the React app image
resource "docker_container" "react_app_container" {
  image = docker_image.react_app.name  # Use the image_id from the docker_image resource
  name  = "react-app-container"  # Name of the container

  ports {
    internal = 80  # The port your React app listens on inside the container
    external = 8000  # The port exposed on your host machine
  }
}
