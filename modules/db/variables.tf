variable "vpc_id" {}
variable "subnet_ids" { type = list(string) }
variable "db_username" {}
variable "db_password" {}
variable "db_name" {}
variable "sg_ids" { type = list(string) }
variable "multi_az" { default = false }
variable "instance_class" { default = "db.t3.micro" }
variable "allocated_storage" {}
variable "storage_type" {}
variable "engine" {}
variable "engine_version" {}
variable "skip_final_snapshot" {}
variable "publicly_accessible" {}
variable "deletion_protection" {}
variable "backup_retention_period" {}

