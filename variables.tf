#common variables
variable "resource_tags" {}
variable "aws_region" {}

#networking variables
variable "vpc_cidr_block" {}
variable "enable_dns_hostnames" {}
variable "public_subnets_cidrs" {}
variable "private_application_subnets_cidrs" {}
variable "private_data_subnets_cidrs" {}
variable "map_public_ip_on_launch" {}
variable "route_table_cidr" {}

#security group variables
variable "ingress_rules" {}

#instance variables
variable "instance_type" {}

#asg variables
variable "desired_capacity" {}
variable "max_size" {}
variable "min_size" {}
variable "web_internal_lb" {}
variable "app_internal_lb" {}

#db variables
variable "db_engine" {}
variable "db_storage_type" {}
variable "db_allocated_storage" {}
variable "db_engine_version" {}
variable "db_instance_class" {}
variable "db_username" {}
variable "db_password" {}
variable "multi_az" {}
variable "skip_final_snapshot" {}
