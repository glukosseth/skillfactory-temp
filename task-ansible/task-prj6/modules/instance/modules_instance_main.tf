
terraform {
  required_version = ">=1.5.0"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.95.0"
    }
  }
}

data "yandex_compute_image" "master_image" {
  family = var.instance_master_image
}

data "yandex_compute_image" "app_image" {
  family = var.instance_app_image
}

data "yandex_compute_image" "srv_image" {
  family = var.instance_srv_image
}

resource "yandex_compute_instance" "vm-master" {
  count                     = var.master
  name                      = "vm-master-${count.index + 1}"
  hostname                  = "master-${count.index + 1}"
  allow_stopping_for_update = true
  zone                      = var.zone

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      size     = 20
      image_id = data.yandex_compute_image.master_image.id
    }
  }

  network_interface {
    subnet_id = var.vpc_subnet_id
    nat       = true
  }

  metadata = {
    user-data = "${file("~/.praktikum/ans-3vm/terraf/files/master-init.yaml")}"
  }

  scheduling_policy {
    preemptible = true
  }
}

resource "yandex_compute_instance" "vm-app" {
  count                     = var.app
  name                      = "vm-app-${count.index + 1}"
  hostname                  = "app-${count.index + 1}"
  allow_stopping_for_update = true
  zone                      = var.zone

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      size     = 20
      image_id = data.yandex_compute_image.app_image.id
    }
  }

  network_interface {
    subnet_id = var.vpc_subnet_id
    nat       = true
  }

  metadata = {
    user-data = "${file("~/.praktikum/ans-3vm/terraf/files/user-init.yaml")}"
  }

  scheduling_policy {
    preemptible = true
  }
}

resource "yandex_compute_instance" "vm-srv" {
  count                     = var.srv
  name                      = "vm-srv-${count.index + 1}"
  hostname                  = "srv-${count.index + 1}"
  allow_stopping_for_update = true
  zone                      = var.zone

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      size     = 20
      image_id = data.yandex_compute_image.srv_image.id
    }
  }

  network_interface {
    subnet_id = var.vpc_subnet_id
    nat       = true
  }

  metadata = {
    user-data = "${file("~/.praktikum/ans-3vm/terraf/files/user-init.yaml")}"
  }

  scheduling_policy {
    preemptible = true
  }
}
