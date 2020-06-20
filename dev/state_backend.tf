terraform {
  backend "s3" {
    bucket = "demonexus999"
    key    = "awsdevremotestatefile_hanu"
    region = "us-east-1"
    profile = "dev-hanu"
  }
}
