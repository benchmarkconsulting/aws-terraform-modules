variable "eks" {
  type        = list(map(string))
  description = "used to create the eks cluster via modules"
}