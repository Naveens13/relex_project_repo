# Creating EC2 instance
resource "aws_instance" "web_server_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.web_server_security_group.id}"]
  subnet_id              = aws_subnet.web_server_subnet_public.id
  user_data              = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              echo "<html><body><h1>Hello, World! - RELEX </h1></body></html>" | sudo tee /var/www/html/index.html
              systemctl start httpd
              systemctl enable httpd
              EOF

  tags = {
    Name = var.ec2_name
  }
}



