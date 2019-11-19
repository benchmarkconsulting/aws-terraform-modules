# Terraform VPC Module

This module handles the creation of an EC2 instance in AWS
The resources/services/activations/deletions that this module will create/trigger are:
- Create EC2 instance
- Use bootstrap script to install/configure required applications at instance launch


## Compatibility

This module is meant for use with Terraform 0.12. If you haven't
[upgraded][terraform-0.12-upgrade] and need a Terraform
0.11.x-compatible version of this module, the last released version
intended for Terraform 0.11.x is [3.0.0].

## Usage

```hcl
module "compute" {

source = "git::https://oauth2:<oauth token>@gitlab.com/kwdevops/aws-terraform-modules//compute"

    ami = "ami-04763b3055de4860b"
    name = "Bastion"
    instance_count = 1
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-09573720b4eaed7a6", "sg-0e61312d446cf26f4"]
    subnet_id = "subnet-053b659b0f7b0d570"
    scriptname = "bootstrap.txt"
    key_name = "MyUSE1KP"
}
```