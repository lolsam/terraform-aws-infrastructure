resource "aws_instance" "generic-instance" {
  count                       = var.instance_count
  instance_type               = var.instance_type
  ami                         = var.ami
  key_name                    = var.key_name
  vpc_security_group_ids      = var.security_group
  subnet_id                   = element(var.subnets, count.index)
  ebs_optimized               = var.ebs_optimized
  monitoring                  = var.monitoring
  associate_public_ip_address = var.associate_public_ip_address
  source_dest_check           = var.source_dest_check
  iam_instance_profile        = var.iamrole

  # user_data                   = "${file("files/bootstrap.sh")}"
  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = var.delete_on_termination
  }

  tags = merge(
    {
      "Name" = var.instance_count > 1 ? format("%s-%d", var.instance_name, count.index + 1) : var.instance_name
    },
    var.tags,
  )
}
