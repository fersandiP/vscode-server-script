packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "vscode-ubuntu-20-04-amd64-test"
  region        = "ap-southeast-1"
  // instance_type = "t3a.micro"

  // Ubuntu 20.04 LTS
  source_ami = "ami-0d058fe428540cd89"

  // skip_create_ami = true

  spot_price          = "0.01"
  spot_instance_types = ["t3a.small", "t3.small"]
  // spot_tags = {
  //   Name = "packer-spot"
  // }
  fleet_tags = {
    Name = "packer-fleet"
  }

  ssh_username  = "ubuntu"
  ssh_interface = "public_ip"
}

build {
  name = "learn-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  # Install ZSH and oh-my-zsh
  provisioner "shell" {
    script = "install-zsh.sh"
  }

  # Inject custom .zshrc
  provisioner "file" {
    source      = ".zshrc"
    destination = "/home/ubuntu/.zshrc"
  }

  # Install asdf
  provisioner "shell" {
    script = "install-asdf.sh"
  }

  # Install Docker
  provisioner "shell" {
    script = "install-docker.sh"
  }
}
