variable "ec2-ami" {
  description = "EC2 AMI"
  type        = string
  default     = "ami-0b25f6ba2f4419235"
}

variable "instance-type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key-name" {
  description = "Name of key pair"
  type        = string
  default     = "key-pair"
}

variable "vpc-cidr-block" {
  description = "VPC cidr block"
  type        = string
  default     = "10.0.0.0/16"
}
variable "cidr-blocks" {
  description = "cidr blocks for route-table"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ipv6-cidr" {
  description = "cidr block for ipv6 route"
  type        = string
  default     = "::/0"
}

variable "subnet-cidr" {
  description = "subnet cidr block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "nic-private-ip" {
  description = "private ip for NIC"
  type        = list(string)
  default     = ["10.0.1.50"]
}

variable "eip-private-ip" {
  description = "private ip for EIP"
  type        = string
  default     = "10.0.1.50"
}

variable "sg-cidr-blocks" {
  description = "cidr blocks for SG"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
