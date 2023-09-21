resource "aws_security_group" "allow-web-access" {
  name        = "allow-ssh-http-https"
  description = "allow port 22, 80 and 443"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
    cidr_blocks = var.sg-cidr-blocks
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "http"
    cidr_blocks = var.sg-cidr-blocks
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "https"
    cidr_blocks = var.sg-cidr-blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.sg-cidr-blocks
  }

  tags = {
    Name = "Allow Web Access"
  }
}
