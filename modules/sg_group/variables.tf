variable "inbound_type" {
  type = string
  description = "(Required) The type of rule being created. Valid options are ingress (inbound) or egress (outbound)."
  }


variable "from_port" {
  type = string
  description = "(Required) The start port (or ICMP type number if protocol is icmp or icmpv6)."
  }


variable "to_port" {
  type = string
  description =  "(Required) The end port (or ICMP code if protocol is icmp)."
  }

variable "protocol" {
  type = string
  description = "(Required) The protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number."
  }

variable "cidr_blocks" {
  type = list
  description = "(Required) The protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number."
  }

variable "security_group_id" {
  type = string
  description = "(Required) The protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number."
  }
