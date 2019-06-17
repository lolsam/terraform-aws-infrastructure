#Outputs so it can be used outside of this module

output "instance_ids" {
  value = aws_instance.generic-instance.*.id
}

output "private_ip" {
  value = aws_instance.generic-instance.*.private_ip
}

output "primary_network_interface_id" {
  value = aws_instance.generic-instance.*.primary_network_interface_id
}

output "private_dns" {
  value = aws_instance.generic-instance.*.private_dns
}

output "subnet_id" {
  value = aws_instance.generic-instance.*.subnet_id
}
