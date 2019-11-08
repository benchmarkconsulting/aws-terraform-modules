variable "cidr_block" {
  description = "The AWS region to create things in."
}

variable "instance_tenancy" {
  description = "The AWS region to create things in."
}

variable "enable_dns_support" {
  description = "The AWS region to create things in."
}

variable "enable_dns_hostnames" {
  description = "The AWS region to create things in."
}

variable "enable_classiclink" {
  description = "The AWS region to create things in."
}

variable "public_subnets" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
  default     = []
}

variable "private_subnets" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
  default     = []
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = []
}