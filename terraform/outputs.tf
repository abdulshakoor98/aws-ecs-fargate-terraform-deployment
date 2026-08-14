output "public_subnet_1_id" {
  value = module.subnets.public_subnet_1_id
}

output "public_subnet_2_id" {
  value = module.subnets.public_subnet_2_id
}

output "private_subnet_1_id" {
  value = module.subnets.private_subnet_1_id
}

output "private_subnet_2_id" {
  value = module.subnets.private_subnet_2_id
}

output "internet_gateway_id" {
  value = module.networking.internet_gateway_id
}

output "public_route_table_id" {
  value = module.networking.public_route_table_id
}

output "nat_gateway_id" {
  value = module.networking.nat_gateway_id
}

output "private_route_table_id" {
  value = module.networking.private_route_table_id
}

output "alb_security_group_id" {
  value = module.security_group.alb_security_group_id
}

output "ecs_security_group_id" {
  value = module.security_group.ecs_security_group_id
}

output "ecs_task_execution_role_arn" {
  value = module.iam.ecs_task_execution_role_arn
}

output "ecs_task_role_arn" {
  value = module.iam.ecs_task_role_arn
}

output "alb_arn" {
  value = module.alb.alb_arn
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "target_group_arn" {
  value = module.alb.target_group_arn
}

output "ecs_cluster_name" {
  value = module.ecs.ecs_cluster_name
}

output "ecs_service_name" {
  value = module.ecs.ecs_service_name
}

output "ecs_task_definition_arn" {
  value = module.ecs.ecs_task_definition_arn
}