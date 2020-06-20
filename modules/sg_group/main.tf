resource "aws_security_group_rule" "security_group_rule" {
  type              = var.inbound_type
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
  security_group_id = var.security_group_id
}
