provider "aws" {
  region = "us-east-1"
}

resource "null_resource" "build_ami" {
  provisioner "local-exec" {
    command = "packer build ami-setup/packer/packer.json"


  }
}

data "aws_ami" "custom" {
  most_recent = true
  owners      = ["self"]

  depends_on = [null_resource.build_ami]
}


