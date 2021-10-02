resource "google_compute_network" "vpc-network" {
    name = "vpc-network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork1" {
    name = "subnetwork1"
    ip_cidr_range = var.sub1-cidr
    network = "${google_compute_network.vpc-network.self_link}"
    region = "europe-west1"
}

resource "google_compute_subnetwork" "subnetwork2" {
    name = "subnetwork2"
    ip_cidr_range = var.sub2-cidr
    network = "${google_compute_network.vpc-network.self_link}"

    region = "europe-west1"
}

resource "google_compute_subnetwork" "subnetwork3" {
    name = "subnetwork3"
    ip_cidr_range = var.sub3-cidr
    network = "${google_compute_network.vpc-network.self_link}"
    region = "europe-west1"
}


