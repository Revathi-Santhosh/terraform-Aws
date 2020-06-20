output "id" {
  value = aws_autoscaling_group.colossus_asg.id
}

output "arn" {
  value = aws_autoscaling_group.colossus_asg.arn
}

output "max_size" {
  value = aws_autoscaling_group.colossus_asg.max_size
}

output "min_size" {
  value = aws_autoscaling_group.colossus_asg.min_size
}
