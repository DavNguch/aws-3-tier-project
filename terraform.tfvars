#common variables
aws_region = "eu-west-1"
resource_tags = {
  Project = "Dry-deploy"
  Owner = "Tasker"
  CreatedBy = "Nguch"
  Environment = "Prod"
}

#networking variables
vpc_cidr_block = "10.255.172.0/22"
enable_dns_hostnames = true
public_subnets_cidrs = ["10.255.175.0/27","10.255.175.32/27"]
private_application_subnets_cidrs = ["10.255.172.0/24","10.255.173.0/24"]
private_data_subnets_cidrs = ["10.255.174.0/25","10.255.174.128/25"]
map_public_ip_on_launch = true
route_table_cidr = "0.0.0.0/0"

#security group variables
ingress_rules = [ 
    {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    source_security_group_id = []
    },
    {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    source_security_group_id = []
    },
    {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    source_security_group_id = []
    }
]

#web instance variable
instance_type = "t2.micro"

#asg variables
desired_capacity = 2
max_size = 3
min_size = 1
web_internal_lb = false
app_internal_lb = true

#db variables
db_username = "dbadmin"
db_password = "wrongpassword"
db_engine = "mysql"
db_engine_version = "5.7"
db_storage_type = "gp3"
db_allocated_storage = 20
skip_final_snapshot = true
multi_az = true
db_instance_class = "db.t2.micro"
