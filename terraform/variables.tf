variable "instance-name" {
  description = "value of the Name tag for the EC2 instance"
  type        = string
  default     = "ec2"
}

variable "instance-type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance-ami" {
  description = "EC2 instance AMI"
  type        = string
  default     = "ami-04dfd853d88e818e8"
}

variable "key-name" {
  description = "EC2 SSH key name"
  type        = string
  default     = "aws-ec2-ubuntu"
}

variable "vpc-name" {
  description = "value of the Name tag for the VPC"
  type        = string
  default     = "aws-vpc"
}

variable "subnet-name" {
  description = "value of the Name tag for the subnet"
  type        = string
  default     = "aws-public-subnet"
}

variable "igw-name" {
  description = "value of the Name tag for the internet gateway"
  type        = string
  default     = "aws-igw"
}

variable "rt-name" {
  description = "value of the Name tag for the route table"
  type        = string
  default     = "aws-rt"
}

variable "sg-name" {
  description = "value of the Name tag for the security group"
  type        = string
  default     = "aws-sg"
}

variable "iam-role" {
  description = "value of the Name tag for the IAM role"
  type        = string
  default     = "aws-iam-role"
}
