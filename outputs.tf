output "vpc_id" {
    description = "VPC ID"
    value       = module.networking.vpc_id
}

output "nat_gateway_ip" {
    description = "ID of the web security group"
    value       = module.networking.nat_gateway_ip
}

output "web_sg_id" {
    description = "ID of the web security group"
    value       = module.web_sg.web_sg_id
}

output "web_dns_name" {
  description = "The DNS name of my web application"
  value       = module.web_asg.web_dns_name
}

