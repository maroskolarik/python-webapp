output "instance_public_ip" {
  description = "public IP of the EC2 instance"
  value       = aws_instance.ec2.public_ip
}
