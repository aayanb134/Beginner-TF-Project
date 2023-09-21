resource "aws_instance" "apache-webapp" {
  ami           = var.ec2-ami
  instance_type = var.instance-type
  key_name      = var.key-name
  subnet_id     = aws_subnet.main-subnet.id
  user_data     = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum install httpd -y
  sudo systemctl enable httpd
  sudo service httpd start
  sudo echo 'Hello There Good Sir'
  EOF
}
