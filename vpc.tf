# Creating a vpc
resource "aws_vpc" "web_server_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "server_vpc"
  }
}
