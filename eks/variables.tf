variable "cluster_name" {
  description = "used to create the eks cluster name"
}

variable "subnet_ids" {
  description = "used to attach the eks to private subnet"
}
variable "instance_type" {
  default     = "t2.micro"
  description = "EC2 instance type for the node instances."
}
variable "ami_id" {
  default = "ami-00dc79254d0461090"
  description = "ami to use with the default if not specified"
}
variable "name" {
  description = "used to attach the eks to private subnet"
}
variable "key_pair" {
  description = "The EC2 Key Pair to allow SSH access to the instances."
}
variable "security_groups" {
  type        = "list"
  description = "The security groups assigned to the worker nodes. If it is incorrect, nodes will not be able to reach each other."
}
variable "disk_size" {
  default     = ""
  description = "The root device size for the worker nodes."
}