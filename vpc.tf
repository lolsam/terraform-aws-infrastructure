resource "aws_vpc" "app" {
  cidr_block           = var.vpc_appcidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = {
    "Name" = var.environName
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "app_secondary_cidr" {
  vpc_id     = aws_vpc.app.id
  cidr_block = var.vpc_appsecondarycidr
}

resource "aws_vpc" "ops" {
  cidr_block           = var.vpc_opscidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = {
    "Name" = "${var.environName}-ops"
  }
}
