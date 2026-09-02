# AWS Infrastructure Variables
variable "region" {
  description = "The AWS region in which the infrastructure will be deployed"
  type        = string
  default     = "eu-west-1"
}

# KMS Variables
variable "kms_key_1_default_retention_days" {
  description = "The default retention period in days for keys created in the KMS keyring"
  type        = number
  default     = 10
}

variable "kms_key_2_default_retention_days" {
  description = "The default retention period in days for keys created in the KMS keyring"
  type        = number
  default     = 10
}

# DynamoDB Variables
variable "dynamodb_terraform_state_lock_1_billing_mode" {
  description = "The billing mode for the DynamoDB table used for Terraform state locking"
  type        = string
  default     = "PAY_PER_REQUEST"
}

# Hosted Zone Variables
variable "zone_1_name" {
  description = "The domain name of the hosted zone to create"
  type        = string
  default     = "example.com"
}

variable "zone_1_apex_ip" {
  description = "The IPv4 address the apex A record points to (replace with your server IP)"
  type        = string
  default     = "127.0.0.1"
}
