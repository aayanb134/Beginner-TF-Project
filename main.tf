#VPC----------------------------------------------

resource "aws_vpc" "main" {
  cidr_block = ""

  tags = {
    Name = "Main VPC"
  }
}

#IGW----------------------------------------------

resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main.id

  tags = local.common_tags
}

#RouteTable---------------------------------------

resource "aws_route_table" "main-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = ""
    gateway_id = aws_internet_gateway.main-igw.id
  }

  tags = local.common_tags
}

#Subnet-------------------------------------------

resource "aws_subnet" "main-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = ""

  tags = local.common_tags
}
