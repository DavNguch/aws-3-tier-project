
# Terraform AWS Networking module
module "networking" {
    source  = "app.terraform.io/Dev-Tasker/networking/aws"
    version = "1.0.0"


    #common variables
    aws_region = var.aws_region
    resource_tags = var.resource_tags

    #networking variables
    vpc_cidr_block                      = var.vpc_cidr_block
    enable_dns_hostnames                = var.enable_dns_hostnames
    public_subnets_cidrs                = var.public_subnets_cidrs
    private_application_subnets_cidrs   = var.private_application_subnets_cidrs
    private_data_subnets_cidrs          = var.private_data_subnets_cidrs
    map_public_ip_on_launch             = var.map_public_ip_on_launch
    route_table_cidr                    = var.route_table_cidr
  
}

module "web_sg" {
    msource  = "app.terraform.io/Dev-Tasker/security-group-module/aws"
    version = "1.0.0"

    #common variables
    aws_region = var.aws_region
    resource_tags = var.resource_tags

    #web security group variables
    vpc_id          = module.networking.vpc_id
    ingress_rules   = var.ingress_rules
    tier_name       = "web"
     
}

module "app_sg" {
    source  = "app.terraform.io/Dev-Tasker/security-group-module/aws"
    version = "1.0.0"

    #common variables
    aws_region = var.aws_region
    resource_tags = var.resource_tags

    #app security group variables
    vpc_id          = module.networking.vpc_id
    tier_name       = "app"
    ingress_rules   = [ 
    {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = []
    source_security_group_id = [module.web_sg.web_sg_id]
    }
    ]
}


module "web_asg" {
    source  = "app.terraform.io/Dev-Tasker/asg-module/aws"
    version = "1.0.1"

    #common variables
    aws_region = var.aws_region
    resource_tags = var.resource_tags

    #web asg variables
    security_group_id        = module.web_sg.web_sg_id
    desired_capacity         = var.desired_capacity
    max_size                 = var.max_size
    min_size                 = var.min_size
    vpc_id                   = module.networking.vpc_id
    tier_name                = "web"
    subnets_ids              = module.networking.public_subnet_ids
    user_data_file           = "frontend.sh"
    internal_lb              = var.web_internal_lb
}

module "app_asg" {
    source  = "app.terraform.io/Dev-Tasker/asg-module/aws"
    version = "1.0.1"

    #common variables
    aws_region = var.aws_region
    resource_tags = var.resource_tags

    #app asg variables
    security_group_id        = module.app_sg.app_sg_id
    desired_capacity         = var.desired_capacity
    max_size                 = var.max_size
    min_size                 = var.min_size
    vpc_id                   = module.networking.vpc_id
    tier_name                = "app"
    subnets_ids              = module.networking.private_data_subnet_ids
    user_data_file           = "backend.sh"
    internal_lb              = var.app_internal_lb
    
}



module "rds" {
    source  = "app.terraform.io/Dev-Tasker/rds-module/aws"
    version = "1.0.0"

    #common variables
    aws_region = var.aws_region
    resource_tags = var.resource_tags

    #db variables
    db_engine                           = var.db_engine
    db_storage_type                     = var.db_storage_type
    db_allocated_storage                = var.db_allocated_storage
    private_application_subnet_cidrs    = var.private_application_subnets_cidrs
    db_engine_version                   = var.db_engine_version
    db_instance_class                   = var.db_instance_class
    db_username                         = var.db_username
    db_password                         = var.db_password
    private_data_subnet_ids             = module.networking.private_data_subnet_ids
    multi_az                            = var.multi_az
    vpc_id                              = module.networking.vpc_id
    skip_final_snapshot                 = var.skip_final_snapshot
}