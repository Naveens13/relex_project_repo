# Creating Route Table
resource "aws_route_table" "web_server_route_table" {
  vpc_id = aws_vpc.web_server_vpc.id

  route {
    cidr_block = var.route_table_cidr
    gateway_id = aws_internet_gateway.web_server_ige.id
  }

  tags = {
    Name = "web_server_route_table"
  }
}
