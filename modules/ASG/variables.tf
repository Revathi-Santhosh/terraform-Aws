variable "name" {
  type = string
  description = "(Optional) The name of the auto scaling group. By default generated by Terraform."
}

variable "launch_configuration" {
  type = string
  description = "(Optional) The name of the launch configuration to use."
}

variable "vpc_zone_identifier" {
  type = list
  description = "(Optional) A list of subnet IDs to launch resources in."
}

variable "max_size" {
  type = number
  description = "(Required) The maximum size of the auto scale group."
}

variable "min_size" {
  type = number
  description = "Required) The minimum size of the auto scale group"
}
