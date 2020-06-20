module "colossus_vpc" {

  source = "../modules/vpc"
  cidr_block = "10.1.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "colossus_vpc"
  }
}

module "colossus_igw" {
  source = "../modules/igw"
  vpc_id = module.colossus_vpc.id
  tags = {
    Name = "colossus_igw"
  }
}

module "collossus_public_subnet" {
  source = "../modules/subnet"
  vpc_id     = module.colossus_vpc.id
  cidr_block = "10.1.5.0/24"
  tags = {
    Name = "colossus_public_subnet"
  }
}



module "colossus_pub_rt" {
  source = "../modules/routetable"
  vpc_id = module.colossus_vpc.id
  tags = {
    Name = "colossus_mainroute"
  }
}



module "pub_igw_associate" {

  source = "../modules/route_gateway_id"

  route_table_id = module.colossus_pub_rt.id
  gateway_id    =  module.colossus_igw.id
  destination_cidr_block = "0.0.0.0/0"
}



module "colossus_rta_cidr" {

  source = "../modules/routetable_associations"
  subnet_id      = module.collossus_public_subnet.id
  route_table_id = module.colossus_pub_rt.id
}

module "jenkins_sec_group" {
  source = "../modules/Sg"
  name        = "jenkins_security_group"
  description = "security group for colossus"
  vpc_id      = module.colossus_vpc.id
  tags = {
    Name = "jenkins_securtity_group"
  }

}

module "jenkins_ssh_rule"{
  source ="../modules/sg_group"
  inbound_type = "ingress"
  from_port  = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.jenkins_sec_group.id
}
module "jenkins_http_rule"{
  source ="../modules/sg_group"
  inbound_type = "ingress"
  from_port  = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.jenkins_sec_group.id
}
module "jenkins_https_rule"{
  source ="../modules/sg_group"
  inbound_type = "ingress"
  from_port  = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.jenkins_sec_group.id
}

module "jenkins_app_rule"{
  source ="../modules/sg_group"
  inbound_type = "ingress"
  from_port  = 8080
  to_port = 8080
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.jenkins_sec_group.id
}

module "nexus_sec_group" {
  source = "../modules/Sg"
  name        = "nexus_secuirty_group"
  description = "security group for colossus"
  vpc_id      = module.colossus_vpc.id
  tags = {
    Name = "nexus_security_group"
  }

}

module "nexus_ssh_rule"{
  source ="../modules/sg_group"
  inbound_type = "ingress"
  from_port  = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.nexus_sec_group.id
}
module "nexus_http_rule"{
  source ="../modules/sg_group"
  inbound_type = "ingress"
  from_port  = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.nexus_sec_group.id
}
module "nexus_https_rule"{
  source ="../modules/sg_group"
  inbound_type = "ingress"
  from_port  = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.nexus_sec_group.id
}

module "nexus_app_rule"{
  source ="../modules/sg_group"
  inbound_type = "ingress"
  from_port  = 8081
  to_port = 8081
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.nexus_sec_group.id
}

module "jenkins_ec2_public_instance" {
  source = "../modules/Ec2"
  ami = "ami-039a49e70ea773ffc"
  instance_type = "t2.micro"
  security_groups = [module.jenkins_sec_group.id]
  subnet_id = module.collossus_public_subnet.id
  key_name = "jenkins"
  associate_public_ip_address  = true
  tags = {
    Name = "jenkins"
  }
}

module "nexus_ec2_public_instance" {
  source = "../modules/Ec2"
  ami = "ami-039a49e70ea773ffc"
  instance_type = "t2.medium"
  security_groups = [module.nexus_sec_group.id]
  subnet_id = module.collossus_public_subnet.id
  key_name = "jenkins"
  associate_public_ip_address  = true
  tags = {
    Name = "nexus"
  }
}
