resource "aws_vpc" "aws-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "aws_vpc"
  }
}

resource "aws_subnet" "aws-public-subnet" {
  vpc_id     = aws_vpc.aws-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "aws-public-subnet"
  }
}

resource "aws_subnet" "aws-private-subnet" {
  vpc_id     = aws_vpc.aws-vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "aws-private-subnet"
  }
}

resource "aws_internet_gateway" "aws-ig" {
  vpc_id = aws_vpc.aws-vpc.id
  tags = {
    Name = "aws-ig"
  }
}

resource "aws_route_table" "aws_public-rt" {
  vpc_id = aws_vpc.aws-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws-ig.id
  }
  tags = {
    Name = "aws-public-rt"
  }
}

resource "aws_route_table_association" "aws_public-rt-a" {
  subnet_id      = aws_subnet.aws-public-subnet.id
  route_table_id = aws_route_table.aws_public-rt.id
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.aws-vpc.id

  tags = {
    Name = "allow_ssh"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
