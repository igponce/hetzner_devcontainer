
// variables.tf
variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
  sensitive   = true
}

variable "server_name" {
  description = "Nombre del servidor"
  type        = string
  default     = "dev-code-server"
}

variable "server_type" {
  description = "Tipo de servidor (por ejemplo CX22, CX32, etc.)"
  type        = string
  default     = "cx22"
}

variable "server_location" {
  description = "Ubicación del servidor (nbg1, fsn1, hel1, etc.)"
  type        = string
  default     = "nbg1"
}

variable "volume_size_gb" {
  description = "Tamaño del volumen en GB"
  type        = number
  default     = 50
}

variable "ssh_key_name" {
  description = "Nombre de la clave SSH ya creada en Hetzner"
  type        = string
}
