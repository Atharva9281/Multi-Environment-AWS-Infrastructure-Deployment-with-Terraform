variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  default     = "us-east-1"
}

variable "my-env" {
    description = "This is the environment for infra"
    type = string
}

variable "ami_id" {
    description = "This is the AMI Id for EC2"
    type = string
}

variable "instance_type" {
    description = "This is the type of instance for EC2"
    type = string
}

variable "instance_count" {
    description = "This is the count of instance"
    type = number
}