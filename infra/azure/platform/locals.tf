locals {
  full_name = format("%s-%s", var.prefix, "k8s")

  tags = {
    Project  = var.prefix
    FullName = local.full_name
  }
}
