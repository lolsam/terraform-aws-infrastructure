#root/main.tf 

provider "aws" {
  region = "${var.aws_region}"
}

module "backend_api" {
  source            = "./instance"
  subnet_id         = "${aws_subnet.private.id}"
  key_pair_id       = "${aws_key_pair.auth.id}"
  security_group_id = "${aws_security_group.default.id}"
  disk_size         = 10
  group_name = "api"
}

module "backend_worker" {
  source            = "./instance"
  subnet_id         = "${aws_subnet.private.id}"
  key_pair_id       = "${aws_key_pair.auth.id}"
  security_group_id = "${aws_security_group.default.id}"
  count         = 2
  group_name    = "worker"
  instance_type = "t2.medium"
}


