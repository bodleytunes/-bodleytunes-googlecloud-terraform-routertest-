// Configure the Google Cloud provider
provider "google" {
 credentials = file("~/.googlecloud_creds/CREDENTIALS_FILE_PFTEST.json")
 project     = "pftest-project"
 region      = "europe-west1"
}