variable "node_group_name" {
    type = string
}

variable "desired_size" {
    type = string
}

variable "min_size" {
    type = string
}

variable "max_size" {
    type = string
}

variable "cluster_name" {
    type = string
}

variable "subnets_ids" {
}

variable "vpc_id" {
  type = string
}
variable "instance_types" {
}