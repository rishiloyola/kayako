provider "digitalocean" {
    token = "XXXX"
}

resource "digitalocean_ssh_key" "default" {
    name = "Kayako test"
    public_key = "${file("id_rsa.pub")}"
}

resource "digitalocean_droplet" "master" {
    image = "centos-7-0-x64"
    name = "master"
    region = "nyc2"
    size = "512mb"

    ssh_keys = ["XXXX"]

    depends_on = [ "digitalocean_ssh_key.default" ]
}

resource "digitalocean_droplet" "master" {

    connection {
      type = "ssh"
      host = "${digitalocean_droplet.master.ipv4_address}"
      port = 22
      timeout = "5m"
      user = "root"
      key_file = "id_rsa"
    }

    provisioner "file" {
        source = "master/srv"
        destination = "/"
    }


    provisioner "file" {
        source = "start.sh"
        destination = "/tmp/start.sh"
    }

    provisioner "file" {
        source = "start-salt.sh"
        destination = "/tmp/start-salt.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "curl -L https://bootstrap.saltstack.com | sh -s -- -M -X -A localhost",
            "cat /tmp/start.sh | sh -s"
          ]
    }

    provisioner "remote-exec" {
        inline = [
            "cat /tmp/start-salt.sh | sh -s"
          ]
    }

}