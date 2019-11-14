resource "aws_iam_role" "test_role" {
  name = "test_role"
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
}
