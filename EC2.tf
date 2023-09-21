resource "aws_instance" "apache-webapp" {
  ami           = data.aws_ami.amzlinux2.id
  instance_type = ""
  key_name      = ""
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
