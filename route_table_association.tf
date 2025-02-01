# Creating Route Table Association 
resource "aws_route_table_association" "web_server_route_association" {
  subnet_id      = aws_subnet.web_server_subnet_public.id
  route_table_id = aws_route_table.web_server_route_table.id
}
