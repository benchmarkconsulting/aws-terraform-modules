resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "kwdevop-eks-role"
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "kwdevop-eks-role"
}
resource "aws_eks_cluster" "default" {
 cluster_name       = var.cluster_name
 role_arn           = aws_iam_role_policy_attachment.cluster_AmazonEKSServicePolicy.role
 vpc_config {
    subnet_ids = var.subnet_ids
  }
}
