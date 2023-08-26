locals {
  name_prefix = "${var.env}-${var.rds_type}-rds"
  tags        = merge(var.tags, {tf-module = rds} , { env = var.env})
}