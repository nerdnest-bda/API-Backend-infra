output "cluster_name" {
  value = aws_ecs_cluster.nerd_nest_cluster.name
}

output "service_name" {
  value = aws_ecs_service.nerd_nest.name
}
