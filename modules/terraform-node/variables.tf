variable "ami_id" {
  description = "The AMI ID for the Jenkins server"
  type        = string
  default     = "ami-0ec1bf4a8f92e7bd1"
}

variable "instance_type" {
  description = "The instance type for the Jenkins server"
  type        = string
  default     = "t3.large"
}

variable "key_name" {
  description = "The key name for the Jenkins server"
  type        = string
  default     = "dev-pipeline"
}

variable "main-region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "The Subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "The Security Group ID"
  type        = string
}

