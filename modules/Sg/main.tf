resource "aws_security_group" "colossus_sg" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  ingress {
    description = var.http_ingress_description
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.http_cidr_block
  }

  ingress {
    description = var.ssh_ingress_description
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}
