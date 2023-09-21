#VPC--------------------------------------------------------

resource "aws_vpc" "main" {
  cidr_block = var.vpc-cidr-block

  tags = {
    Name = "Main VPC"
  }
}

#IGW--------------------------------------------------------

resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main.id

  tags = local.common_tags
}

#RouteTable-------------------------------------------------

resource "aws_route_table" "main-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr-blocks
    gateway_id = aws_internet_gateway.main-igw.id
  }

  route {
    ipv6_cidr_block = var.ipv6-cidr
    gateway_id      = aws_internet_gateway.main-igw.id
  }

  tags = local.common_tags
}

#Subnet-----------------------------------------------------

resource "aws_subnet" "main-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet-cidr

  tags = local.common_tags
}

#RouteTableAssociation--------------------------------------

resource "aws_route_table_association" "main-rta" {
  subnet_id      = aws_subnet.main-subnet.id
  route_table_id = aws_route_table.main-rt.id
}

#NetworkInterface--------------------------------------------

resource "aws_network_interface" "web-nic" {
  subnet_id       = aws_subnet.main-subnet.id
  private_ips     = var.nic-private-ip
  security_groups = [aws_security_group.allow-web-access.id]
}

#EIP--------------------------------------------------------

resource "aws_eip" "my-eip" {
  depends_on = [aws_internet_gateway.main-igw]

  domain                    = "vpc"
  network_interface         = aws_network_interface.web-nic.id
  associate_with_private_ip = var.eip-private-ip
}
