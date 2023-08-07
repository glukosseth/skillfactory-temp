output "internal_ip_address_vm_1" {
  value = module.ya_instance_1.internal_ip_address_vm
}

output "external_ip_address_vm_1" {
  value = module.ya_instance_1.external_ip_address_vm
}

output "internal_ip_address_vm_2" {
  value = module.ya_instance_2.internal_ip_address_vm
}

output "external_ip_address_vm_2" {
  value = module.ya_instance_2.external_ip_address_vm
}

output "external_ip_address_balancer" {
  value = yandex_lb_network_load_balancer.net-balancer.listener[*].external_address_spec[*].address
}
# output "external_ip_address_balancer" { description = "Public IP address of load balancer" value = yandex_lb_network_load_balancer.net-balancer.listener.*.external_address_spec[0].*.address }
