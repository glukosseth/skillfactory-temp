#!/usr/bin/env python

import json

# Указываем путь к файлу состояния Terraform (локальный путь)
tf_state_file = "./terraform.tfstate"

# Загружаем данные из файла состояния
with open(tf_state_file, "r") as f:
    state_data = json.load(f)

# Парсим JSON и получаем публичный IP
public_ips = []
for resource in state_data["resources"]:
    if resource["type"] == "yandex_compute_instance" and resource["name"] == "vm":
        public_ip = resource["instances"][0]["attributes"]["network_interface"][0]["nat_ip_address"]
        public_ips.append(public_ip)

# Формируем строку с инвентарем Ansible
inventory_content = "[all]\n" + "\n".join(public_ips)

# Сохраняем инвентарь в текстовый файл
with open("ansible_inventory.txt", "w") as inv_file:
    inv_file.write(inventory_content)
