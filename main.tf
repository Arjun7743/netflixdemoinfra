provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-04808bdb94be6720e"
  instance_type          = "c7i-flex.large"
  key_name               = "First_key"
  vpc_security_group_ids = ["sg-0e879257216d52216"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
