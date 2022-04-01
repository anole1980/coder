terraform {
  required_providers {
    coder = {
      source  = "coder/coder"
      version = "0.2.1"
    }
  }
}

variable "access_key" {
  description = <<EOT
Create an AWS access key to provision resources with Coder:
- https://console.aws.amazon.com/iam/home#/users
  
AWS Access Key
EOT
  sensitive   = true
}

variable "secret_key" {
  description = <<EOT
AWS Secret Key
EOT
  sensitive   = true
}

variable "region" {
  description = "What region should your workspace live in?"
  default     = "us-east-1"
  validation {
    condition     = contains(["us-east-1", "us-east-2", "us-west-1", "us-west-2"], var.region)
    error_message = "Invalid region!"
  }
}

variable "disk_size" {
  description = "Specify your disk size (GiBs)"
  default     = "20"
  type        = number
  validation {
    condition = (
      var.disk_size >= 8 &&
      var.disk_size <= 256
    )
    error_message = "Disk size must be between 8 and 256."
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

data "coder_workspace" "me" {
}

data "coder_agent_script" "dev" {
  arch = "amd64"
  auth = "aws-instance-identity"
  os   = "linux"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "coder_agent" "dev" {
  count       = data.coder_workspace.me.transition == "start" ? 1 : 0
  instance_id = aws_instance.dev[0].id
}

locals {

  # User data is used to stop/start AWS instances. See:
  # https://github.com/hashicorp/terraform-provider-aws/issues/22

  user_data_start = <<EOT
Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0

--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

#cloud-config
cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="userdata.txt"

#!/bin/bash
sudo -E -u ubuntu sh -c '${data.coder_agent_script.dev.value}'
--//--
EOT

  user_data_end = <<EOT
Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0

--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

#cloud-config
cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="userdata.txt"

#!/bin/bash
sudo shutdown -h now
--//--
EOT
}

resource "aws_instance" "dev" {
  ami               = data.aws_ami.ubuntu.id
  availability_zone = "${var.region}a"
  instance_type     = "t3.micro"
  count             = 1

  user_data = data.coder_workspace.me.transition == "start" ? local.user_data_start : local.user_data_end
  tags = {
    Name = "coder-${data.coder_workspace.me.owner}-${data.coder_workspace.me.name}"
  }

}