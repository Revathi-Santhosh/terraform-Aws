resource "aws_instance" "colossus_ec2" {
  ami = var.ami
  instance_type = var.instance_type
  security_groups = var.security_groups
  subnet_id = var.subnet_id
  key_name = var.key_name
  associate_public_ip_address  = var.associate_public_ip_address 
  tags = var.tags
}
