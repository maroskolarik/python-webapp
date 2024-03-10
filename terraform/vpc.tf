resource "aws_vpc" "aws-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.vpc-name
  }
}

resource "aws_subnet" "aws-public-subnet" {
  vpc_id     = aws_vpc.aws-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = var.subnet-name
  }
}

resource "aws_internet_gateway" "aws-igw" {
  vpc_id = aws_vpc.aws-vpc.id
  tags = {
    Name = var.igw-name
  }
}

resource "aws_route_table" "aws-rt" {
  vpc_id = aws_vpc.aws-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws-igw.id
  }
  tags = {
    Name = var.rt-name
  }
}

resource "aws_route_table_association" "aws_public-rt-a" {
  subnet_id      = aws_subnet.aws-public-subnet.id
  route_table_id = aws_route_table.aws-rt.id
}

resource "aws_security_group" "aws-sg" {
  name        = var.sg-name
  description = "allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.aws-vpc.id
  ingress = [
    for port in [22] : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      ipv6_cidr_blocks = ["::/0"]
      self             = false
      prefix_list_ids  = []
      security_groups  = []
      cidr_blocks      = ["0.0.0.0/0"]
    }
  ]
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.sg-name
  }
}
