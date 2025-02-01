output "web_server_public_ip" {
  description = "This is public IP of web_server"
  value       = "http://${aws_instance.web_server_ec2.public_ip}:80"
}

output "web_server_private_ip" {
  description = "This is private ip of web_server"
  value       = aws_instance.web_server_ec2.private_ip
}

output "subnet_id" {
  description = "This is the id of subnet for validation"
  value       = aws_subnet.web_server_subnet_public.id
}

output "vpc_id" {
  description = "This is vpc id of ec2 instance"
  value       = aws_vpc.web_server_vpc.id
}


