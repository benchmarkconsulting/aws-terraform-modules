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
    # subnet_ids = var.subnet_ids
  }
  depends_on = [
    "aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.cluster_AmazonEKSServicePolicy",
  ]
}
  
# resource "aws_launch_configuration" "node" {
#   iam_instance_profile        = "${var.instance_profile}"
#   image_id                    = "${local.ami_id}"
#   instance_type               = "${var.instance_type}"
#   name_prefix                 = "${var.name}"
#   key_name                    = "${var.key_pair}"
#   associate_public_ip_address = false
#   security_groups             = ["${var.security_groups}"]
#   user_data_base64            = "${base64encode(local.user_data)}"
#   spot_price                  = "${var.spot_price}"

#   root_block_device {
#     volume_size = "${var.disk_size}"
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_autoscaling_group" "node" {
#   launch_configuration = "${aws_launch_configuration.node.id}"
#   max_size             = "${var.max_size}"
#   min_size             = "${var.min_size}"
#   name                 = "${var.name}"
#   vpc_zone_identifier  = ["${var.subnet_ids}"]

#   tag {
#     key                 = "Name"
#     value               = "${var.name}"
#     propagate_at_launch = true
#   }

#   tag {
#     key                 = "kubernetes.io/cluster/${var.cluster_name}"
#     value               = "owned"
#     propagate_at_launch = true
#   }
# }


