# Creating subnet
resource "aws_subnet" "web_server_subnet_public" {
  vpc_id                  = aws_vpc.web_server_vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "web_server_subnet_public"
  }
}
