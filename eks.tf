resource "aws_eks_cluster" "default" {
  name     = var.name
  version  = var.eks_version
  role_arn = var.cluster_arn

  vpc_config {
    subnet_ids              = flatten([var.subnet_ids])
    security_group_ids      = flatten([var.security_group])
    endpoint_private_access = var.cluster_private_access
    endpoint_public_access  = var.cluster_public_access
  }
    encryption_config {
    resources = ["secrets"]
    provider {
      # key_arn = aws_kms_key.platform-gitlab-kms.arn
      key_arn = "arn:aws:kms:me-south-1:414582846745:key/40160713-0135-4592-ad32-586ff0ed947f"
    }
  }
}