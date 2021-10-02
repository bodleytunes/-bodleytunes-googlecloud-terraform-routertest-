resource "google_compute_firewall" "vpc-firewall" {
    name    = "ssh"
    network = "${google_compute_network.vpc-network.self_link}"

    allow {
      protocol = "tcp"
      ports    = ["22"]
    }

    allow {
      protocol = "icmp"
    }
    
    allow {
      protocol = "udp"
      ports    = ["9993"]
    }

    target_tags = ["routers"]

}