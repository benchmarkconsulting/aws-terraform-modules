resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "eks-cluster-manage"
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "eks-cluster-manage"
}
resource "aws_eks_cluster" "default" {
 name       = var.cluster_name
 role_arn           = aws_iam_role_policy_attachment.cluster_AmazonEKSServicePolicy.id
 vpc_config {
    subnet_ids = var.subnet_ids
  }
}
