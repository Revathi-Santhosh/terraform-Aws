resource "aws_autoscaling_group" "colossus_asg" {
  name = var.name
  launch_configuration = var.launch_configuration
  min_size = var.min_size
  max_size = var.max_size
  vpc_zone_identifier = var.vpc_zone_identifier
}
