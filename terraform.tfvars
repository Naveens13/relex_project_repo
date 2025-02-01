
aws_region                  = "us-east-1"
ami_id                      = "ami-0c614dee691cbbf37"
instance_type               = "t2.micro"
ec2_name                    = "web_server"
vpc_cidr                    = "10.0.0.0/16"
route_table_cidr            = "0.0.0.0/0"
ssh_port_number             = 22
http_port_number            = 80
subnet_cidr                 = "10.0.1.0/24"
cpu_util_threshold          = 50
cpu_util_period             = 120
cpu_util_evaluation_periods = 2
