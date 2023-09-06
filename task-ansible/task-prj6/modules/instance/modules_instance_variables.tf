variable "instance_master_image" {
  description = "Instance image master"
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "instance_app_image" {
  description = "Instance image app"
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "instance_srv_image" {
  description = "Instance image srv"
  type        = string
  default     = "centos-7"
}

variable "vpc_subnet_id" {
  description = "VPC subnet network id"
  type        = string
}

variable "zone" {
  description = "zone instance"
  type        = string
  default     = "ru-central1-a"
}

variable "master" {
  description = "Count of app nodes"
  type        = number
  default     = 1
}

variable "app" {
  description = "Count of app nodes"
  type        = number
  default     = 1
}

variable "srv" {
  description = "Count of srv"
  type        = number
  default     = 1
}
