#!/usr/bin/env python

import json

# Указываем путь к файлу состояния Terraform (локальный путь)
tf_state_file = "./terraform.tfstate"

# Загружаем данные из файла состояния
with open(tf_state_file, "r") as f:
    state_data = json.load(f)

# Парсим JSON и получаем публичный IP
public_ips_m = []
public_ips_a = []
public_ips_s = []

for resource in state_data["resources"]:
    if resource["type"] == "yandex_compute_instance":
        if resource["name"] == "vm-master":
            public_ip_m = resource["instances"][0]["attributes"]["network_interface"][0]["nat_ip_address"]
            public_ips_m.append(public_ip_m)
        elif resource["name"] == "vm-app":
            public_ip_a = resource["instances"][0]["attributes"]["network_interface"][0]["nat_ip_address"]
            public_ips_a.append(public_ip_a)
        elif resource["name"] == "vm-srv":
            public_ip_s = resource["instances"][0]["attributes"]["network_interface"][0]["nat_ip_address"]
            public_ips_s.append(public_ip_s)

# Формируем строку с инвентарем Ansible
inventory_content = (
    "[app]\n" + "\n".join(public_ips_a + public_ips_s) + "\n" +
    "[web]\n" + "\n".join(public_ips_m) + "\n" +
    "[database]\n" + "\n".join(public_ips_m) + "\n"
)

# Сохраняем инвентарь в текстовый файл
with open("hosts.txt", "w") as inv_file:
    inv_file.write(inventory_content)
