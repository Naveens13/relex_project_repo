# Creating Security group
resource "aws_security_group" "web_server_security_group" {
  name        = "web_server_security_group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.web_server_vpc.id

  ingress {
    description = "SSH inbound from anywhere"
    from_port   = var.ssh_port_number
    to_port     = var.ssh_port_number
    protocol    = "tcp"
    cidr_blocks = ["${var.route_table_cidr}"]
  }

  ingress {
    description = "HTTP inbound from anywhere"
    from_port   = var.http_port_number
    to_port     = var.http_port_number
    protocol    = "tcp"
    cidr_blocks = ["${var.route_table_cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.route_table_cidr}"]
  }

  tags = {
    Name = "web_server_security_group"
  }
}
