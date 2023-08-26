data "aws_ssm_parameter" "master_username" {
  name = "rds.dev.master_username"
}
data "aws_ssm_parameter" "database_name" {
  name = "rds.dev.database_name"
}
data "aws_ssm_parameter" "master_password" {
  name = "rds.dev.master_password"
}