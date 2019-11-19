
resource "aws_eks_cluster" "default" {
 name       = var.node_name
 role_arn           = aws_iam_role.cluster.arn
 vpc_config {
    subnet_ids = var.subnet_ids
  }
  depends_on = [
    "aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.cluster_AmazonEKSServicePolicy",
  ]
}

resource "aws_launch_configuration" "node" {
  iam_instance_profile        = aws_iam_instance_profile.node.name
  image_id                    = var.ami_id
  instance_type               = var.instance_type
  name                        = var.node_name
  key_name                    = var.key_pair
  associate_public_ip_address = false
  security_groups             = var.security_groups

  root_block_device {
    volume_size = var.disk_size
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    "aws_eks_cluster.default",
  ]
}





