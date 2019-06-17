variable "key_name" {
}

variable "public_key_path" {
}

variable "instance_count" {
}

variable "instance_type" {
}

variable "ami" {
}

variable "iamrole" {
}

variable "security_group" {
  type = list(string)
}

variable "subnets" {
 type = list(string)
}

variable "ebs_optimized" {
  default = true
}

variable "monitoring" {
  default = false
}

variable "associate_public_ip_address" {
  default = false
}

variable "source_dest_check" {
  default = true
}

variable "volume_size" {
}

variable "volume_type" {
  default = "gp2"
}

variable "delete_on_termination" {
  default = true
}

variable "instance_name" {
}

#***************tags*******************

variable "tags" {
  default = {}
}
