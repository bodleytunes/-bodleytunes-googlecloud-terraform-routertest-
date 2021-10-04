resource "google_compute_router" "router" {
  name    = "my-router"
  region  = google_compute_subnetwork.subnetwork1.region
  network = google_compute_network.vpc-network.id

  #bgp {
  #  asn = 65412
  #}
}

resource "google_compute_route" "corp1" {
  name        = "corp1"
  dest_range  = "10.100.0.0/16"
  network     = google_compute_network.vpc-network.name
  #next_hop_ip = "10.132.1.5"
  #next_hop_type = "INSTANCE"
  next_hop_instance = google_compute_instance.router1.self_link
  priority    = 1000
}
resource "google_compute_route" "corp2" {
  name        = "corp2"
  dest_range  = "10.100.0.0/16"
  network     = google_compute_network.vpc-network.name
  #next_hop_ip = "10.132.1.5"
  #next_hop_type = "INSTANCE"
  next_hop_instance = google_compute_instance.router2.self_link
  priority    = 1000
}
#
## nat gateway
#resource "google_compute_router_nat" "nat" {
#  name                               = "my-router-nat"
#  router                             = google_compute_router.router.name
#  region                             = google_compute_router.router.region
#  nat_ip_allocate_option             = "AUTO_ONLY"
#  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
#
#  log_config {
#    enable = true
#    filter = "ERRORS_ONLY"
#  }
#}