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
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0ba9883b710b05ac6"
  instance_type = "t2.micro"
  key_name      = "chave"
  user_data = <<-EOF
  #!/bin/bash

  echo "Hello, World!" > /var/tmp/hello.txt
EOF

  tags = {
    Name = "Primeira instancia"
  }
}
