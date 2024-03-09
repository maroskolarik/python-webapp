variable "instance_name" {
  description = "value of the Name tag for the EC2 instance"
  type        = string
  default     = "ec2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_ami" {
  description = "EC2 instance AMI"
  type        = string
  default     = "ami-04dfd853d88e818e8"
}
