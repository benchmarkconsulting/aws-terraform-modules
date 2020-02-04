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
  source          = "git::https://github.com/aws-terraform-modules//eks"
  vpc_id          = "vpc-00a16978e759218be"
  cluster_name    = "demo-eks-cluster"
  node_group_name = "demo-eks-nodes"
  instance_types  = ["t3.xlarge"]
  subnets_ids     = ["subnet-01435320c75c2fc42", "subnet-0424bf107636e4fab", "subnet-0c42f2af42598470e"]
  desired_size    = 1
  min_size        = 1
  max_size        = 3
}
```
