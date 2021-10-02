variable "project_id" {
    default = "pftest_project"
}

variable "ssh-key" {
    default = "jon:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJjM78UyIQWNbMsca2qafeshPflijH8HbbsKuTTZqB1F jon@DESKTOP-SNM4E2E"
} 

variable "machine_image" {
    default = "ubuntu-os-cloud/ubuntu-2004-lts"
}
variable "machine_type" {
    default = "f1-micro"
}

variable "region" {
    default = "europe-west1"
}

variable "sub1-cidr" {
    default = "172.16.0.0/24"
}
variable "sub2-cidr" {
    default = "172.16.8.0/24"
}
variable "sub3-cidr" {
    default = "172.16.16.0/24"
}

variable "startup_script_git" {
    default = "sudo apt-get update; sudo apt-get install;"
}

variable "startup_script_xsoar" {
    default = "sudo apt-get update; sudo apt-get install; curl -fsSL https://get.docker.com -o get-docker.sh; sudo sh get-docker.sh; wget -O demisto.sh 'https://download.demisto.works/download-params/?token=mFBVCqdXkmvU&email=sales@paloaltonetworks.com&eula=accept'; chmod 700 demisto.sh; ./demisto.sh -- -y"
}

variable "privatekeypath" {
    type = string
    default = "/root/.ssh/id_gcloud"
}

#variable "script_path" {
#    type        = string
#    description = "Where is the path to the script locally on the machine?"
#}