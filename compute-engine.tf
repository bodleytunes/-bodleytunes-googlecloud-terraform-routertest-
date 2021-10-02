// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

// A single Compute Engine instance
resource "google_compute_instance" "router1" {
 name         = "router1"
 machine_type = var.machine_type
 zone         = "${var.region}-b"


network_interface {
    subnetwork = "${google_compute_subnetwork.subnetwork1.self_link}"
    access_config {
      // Include this section to give the VM an external ip address
    }
  }
// Apply the firewall rule to allow external IPs to access this instance
    tags = ["routers", "router2"]
    metadata = {
        ssh-keys = var.ssh-key
        user-data = file("cloud-init")
    }

 boot_disk {
   initialize_params {
     image = var.machine_image
   }
 }
}

// A single Compute Engine instance
resource "google_compute_instance" "router2" {
 name         = "router2"
 machine_type = var.machine_type
 zone         = "${var.region}-c"


 network_interface {
    subnetwork = "${google_compute_subnetwork.subnetwork2.self_link}"
    access_config {
      // Include this section to give the VM an external ip address
    }

  }
// Apply the firewall rule to allow external IPs to access this instance
    tags = ["routers", "router2"]

 boot_disk {
   initialize_params {
     image = var.machine_image
   }
 }

 metadata = {
        ssh-keys = var.ssh-key
        user-data = file("cloud-init")
    }

}
