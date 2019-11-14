# Terraform SG Module

This module handles the creation of SG in AWS
The resources/services/activations/deletions that this module will create/trigger are:
- Create Security Gorups


## Compatibility

This module is meant for use with Terraform 0.12. If you haven't
[upgraded][terraform-0.12-upgrade] and need a Terraform
0.11.x-compatible version of this module, the last released version
intended for Terraform 0.11.x is [3.0.0].

## Usage

```hcl
module "sg" {
    source = "git::https://oauth2:z<oauth token>@gitlab.com/kwdevops/aws-terraform-modules//sg"
    sg = [
        {
            name                 = "allow_ssh"
            description          = "Allow SSH inbound traffic"
            vpc_id               = module.vpc.vpc_id
            ingress_protocol     = "tcp"
            ingress_to_port      = "22"
            ingress_from_port    = "22"
            ingress_cidr_blocks   = "0.0.0.0/0"
            egress_protocol      = "-1"
            egress_to_port       = 0
            egress_from_port     = 0
            egress_cidr_blocks   = "0.0.0.0/0"
        },
                {
            name                 = "allow_https"
            description          = "Allow SSH inbound traffic"
            vpc_id               = module.vpc.vpc_id
            ingress_protocol     = "tcp"
            ingress_to_port      = "443"
            ingress_from_port    = "443"
            ingress_cidr_blocks   = "0.0.0.0/0"
            egress_protocol      = "-1"
            egress_to_port       = 0
            egress_from_port     = 0
            egress_cidr_blocks   = "0.0.0.0/0"
        },
    ] 
}
```