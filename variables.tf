variable "environName" {
  default = "stage"
}

variable "aws_region" {
  default = "us-west-2"
}

#-------VPC variables-------------

variable "vpc_dfltcidr" {
  default = "172.31.0.0/16"
}

variable "vpc_opscidr" {
  default = "172.41.0.0/16"
}

variable "vpc_appcidr" {
  default = "10.30.0.0/16"
}

variable "vpc_appsecondarycidr" {
  default = "10.240.0.0/24"
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  default     = true
}

variable "alarms_email" {
  default = "youremail@gmail.com"
}
