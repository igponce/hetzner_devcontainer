
// main.tf
resource "hcloud_ssh_key" "default" {
  count      = 0 // pon 1 si quieres que Terraform cree la clave en Hetzner
  name       = var.ssh_key_name
  public_key = file("~/.ssh/id_rsa.pub")
}

data "hcloud_ssh_key" "selected" {
  name = var.ssh_key_name
}

resource "hcloud_server" "code_server" {
  name        = var.server_name
  image       = "ubuntu-22.04"
  server_type = var.server_type
  location    = var.server_location

  ssh_keys = [data.hcloud_ssh_key.selected.id]

  // Cloud-init opcional para instalar Docker + code-server
  user_data = <<-EOF
    #cloud-config
    package_update: true
    packages:
      - docker.io
      - docker-compose
    runcmd:
      - systemctl enable docker
      - systemctl start docker
      # Aquí podrías hacer docker run de code-server montando el volumen en /home/coder
  EOF
}

resource "hcloud_volume" "data_volume" {
  name        = "${var.server_name}-data"
  size        = var.volume_size_gb
  format      = "ext4"
  location    = var.server_location
  server_id   = hcloud_server.code_server.id
  automount   = true
}

// Salidas útiles
output "server_ip" {
  value = hcloud_server.code_server.ipv4_address
}

output "volume_id" {
  value = hcloud_volume.data_volume.id
}
