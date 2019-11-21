# Terraform EKS Module

This module handles the creation of an EKS cluster and autoscale gorups for worker nodes in AWS
The resources/services/activations/deletions that this module will create/trigger are:
- Create EKS Cluster
- Create Launch configureations
- Create AutoScale group


## Compatibility

This module is meant for use with Terraform 0.12. If you haven't
[upgraded][terraform-0.12-upgrade] and need a Terraform
0.11.x-compatible version of this module, the last released version
intended for Terraform 0.11.x is [3.0.0].

## Usage

```hcl
module "eks" {
    source          = "git::https://oauth2:<oauth token>@gitlab.com/kwdevops/aws-terraform-modules//eks?ref=js-add-eks" 
    cluster_name    = "kwdevops-eks"
    subnet_ids      = ["subnet-06ca0c4e431b55a7e", "subnet-06ca734a460e02697", "subnet-09d64c9db36d9d4e5"]
    ami_id          = "ami-00dc79254d0461090"
    instance_type   = "t2.micro"
    node_name       = "test"
    key_pair        = "pronoob-key"
    security_groups = ["sg-01bc290eeab123a7b"]
    disk_size       = 8
    min_size        = 1
    max_size        = 2
}
```