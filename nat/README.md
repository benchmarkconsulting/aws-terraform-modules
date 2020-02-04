# Terraform AWS NAT Module

This module handles the creation of SG in AWS
The resources/services/activations/deletions that this module will create/trigger are:
- Create Elastic IP
- Create NAT gateway
- Create Create Internet Route table
- Create Route Association 


## Compatibility

This module is meant for use with Terraform 0.12. If you haven't
[upgraded][terraform-0.12-upgrade] and need a Terraform
0.11.x-compatible version of this module, the last released version
intended for Terraform 0.11.x is [3.0.0].

## Usage

```hcl
mmodule "nat" {
    source  = "git::https://github.com/baws-terraform-modules//nat" 

    vpc_id = module.vpc.vpc_id
    public_subnet_id = module.vpc.subnet_public[0]
    private_subnet_id = module.vpc.subnet_private[0]

}
```
