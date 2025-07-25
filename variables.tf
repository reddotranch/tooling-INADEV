variable "ami_id" {
  description = "The AMI ID for the instances"
  type        = string
  default     = "ami-0ec1bf4a8f92e7bd1"
}

variable "instance_type" {
  description = "The instance type for the instances"
  type        = string
  default     = "t3.large"
}


variable "key_name" {
  description = "The key name for the instances"
  type        = string
  default     = "dev-pipeline"
}

##########################
#Sonaqube instance
##########################
variable "security_group_id" {
  type    = string
  default = "sg-072019c391e521148"
}

variable "subnet_id" {
  type    = string
  default = "subnet-02dbcffbed6d9f6f4"
}

##########################
#TF state file
##########################
variable "s3_bucket" {
  description = "The name of the S3 bucket for storing Terraform state"
  type        = string
  default     = "betech-terraform-state-bucket-2025"
}

variable "dynamodb_table" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
  default     = "betech-terraform-locks"
}

variable "main-region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}
