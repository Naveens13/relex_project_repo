# Creating Internet Gateway
resource "aws_internet_gateway" "web_server_ige" {
  vpc_id = aws_vpc.web_server_vpc.id

  tags = {
    Name = "web_server_ige"
  }
}
