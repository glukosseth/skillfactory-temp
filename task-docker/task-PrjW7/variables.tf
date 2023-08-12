variable "cloud_id" {
  description = "The cloud ID"
  type        = string
}

variable "folder_id" {
  description = "The folder ID"
  type        = string
}

variable "token" {
  description = "The token"
  type        = string
}

variable "zone" {
  description = "The zone"
  type        = string
  default     = "ru-central1-a"
}
