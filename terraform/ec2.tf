resource "aws_instance" "ec2" {
  ami                         = var.instance-ami
  instance_type               = var.instance-type
  key_name                    = var.key-name
  subnet_id                   = aws_subnet.aws-public-subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.aws-sg.id]
  user_data                   = file("./scripts/install-tools.sh")
  tags = {
    Name = var.instance-name
  }
}