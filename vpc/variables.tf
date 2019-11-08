variable "vpc" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
  default     = []
}

variable "subnet" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
  default     = []
}