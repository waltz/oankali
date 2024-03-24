resource "null_resource" "bootstrap" {
  connection {
    type = "ssh"
    user = local.user
    private_key = file("~/.ssh/id_rsa")
    host = "${local.hostname}.local"
  }

  provisioner "remote-exec" {
    inline = [
      "ping -c 5 google.com",
    ]
  }
}

