variable "name" {
  type = string
  description = "(Optional) The name of the launch configuration.If you leave this blank, Terraform will auto-generate a unique name."
}

variable "image_id" {
  type = string
  description = "(Required) The size of instance to launch."
}

variable "instance_type" {
  type = string
  description = "(Required) The size of instance to launch."
}


variable "key_name" {
  type = string
  description = "(Optional) The key name that should be used for the instance."
}

variable "security_groups" {
  type = list
  description = "(Optional) A list of associated security group IDS."
}
