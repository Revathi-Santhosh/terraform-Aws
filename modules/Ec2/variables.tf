variable "ami" {
  type = string
  description = "ami - (Required) The AMI to use for the instance."
}
variable "instance_type" {
  type = string
  description = "instance_type - (Required) The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
}
variable "subnet_id" {
  type = string
  description = "(Optional) The VPC Subnet ID to launch in"
}
variable "security_groups" {
  type = list
  description = "security_groups - (Optional, EC2-Classic and default VPC only) A list of security group names (EC2-Classic) or IDs (default VPC) to associate with."
}
variable "tags" {
  type = map
  description = "(Optional) A map of tags to assign to the resource."
}
variable "key_name" {
  type = string
  description = "(Optional) The key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource."
}
variable "associate_public_ip_address" {
  type = bool
  description = "(Optional) Associate a public ip address with an instance in a VPC. Boolean value."
}
