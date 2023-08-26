resource "aws_db_subnet_group" "main" {
  name       = "${local.name_prefix}-subnets"
  subnet_ids = var.subnet_ids

  tags       = merge (local.tags , { Name = "${local.name_prefix}-subnets"} )
}

resource "aws_security_group" "main" {
  name        = "${local.name_prefix}-sg"
  description = "${local.name_prefix}-sg"
  vpc_id      = var.vpc_id
  tags        = merge(local.tags , { Name = "${local.name_prefix}-sg" })

  ingress {
    description      = "rds"
    from_port        = var.port
    to_port          = var.port
    protocol         = "tcp"
    cidr_blocks      = var.sg_ingress_cidr
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_rds_cluster" "main" {
  cluster_identifier      = "${local.name_prefix}-cluster"
  engine                  = "${local.name_prefix}-cluster"
  engine_version          = var.engine_version
  db_subnet_group_name    = aws_db_subnet_group.main.name
  database_name           =
  master_username         = "foo"
  master_password         = "bar"
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
}

