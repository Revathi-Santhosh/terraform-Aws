resource "aws_launch_configuration" "colossus_lc" {
  name = var.name
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = var.security_groups
}
