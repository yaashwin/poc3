# terraform.tfvars

aws_region = "us-east-1"

ami_id = "ami-0e6b4bffe2b86842b"

instance_type = "t2.medium"

key_name = "two_terra"

ssh_private_key_path = "/home/yaashwin/terraform2/two_terra.pem"

security_group_name = "allow_ssh_http_https"

security_group_description = "Allow SSH, HTTP, HTTPS, Jenkins, and SonarQube"
