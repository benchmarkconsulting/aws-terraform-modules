resource "aws_iam_role" "test_role" {
  name = "test_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.test_role.name
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.test_role.name
}


resource "aws_eks_cluster" "default" {
 name       = var.cluster_name
 role_arn           = aws_iam_role.test_role.arn
 vpc_config {
    subnet_ids = var.subnet_ids
  }
  depends_on = [
    "aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.cluster_AmazonEKSServicePolicy",
  ]
}

resource "aws_launch_configuration" "node" {
  iam_instance_profile        = aws_iam_role.test_role.arn
  image_id                    = var.ami_id
  instance_type               = var.instance_type
  name_prefix                 = var.name
  key_name                    = var.key_pair
  associate_public_ip_address = false
  security_groups             = [var.security_groups]

  root_block_device {
    volume_size = var.disk_size}
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    "aws_eks_cluster.default",
  ]
}




