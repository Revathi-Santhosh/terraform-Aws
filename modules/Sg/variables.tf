variable "name" {
  type = string
  description = "(Optional, Forces new resource) The name of the security group."
}
variable "description" {
  type = string
  description = "(Optional, Forces new resource) The name of the security group."
}
variable "vpc_id" {
  type = string
  description = "(Optional, Forces new resource) The name of the security group."
}
variable "http_ingress_description" {
  type = string
  description = "(Optional, Forces new resource) The name of the security group."
}
variable "http_cidr_block" {
    type = list
    description = "(Optional) List of CIDR blocks."
}
variable "ssh_ingress_description" {
  type = string
  description = "(Optional, Forces new resource) The name of the security group."
}
variable "ssh_cidr_block" {
  type = list
  description = "(Optional) List of CIDR blocks."
}
variable "tags" {
  type = map
  description = "(Optional) A map of tags to assign to the resource."
}
