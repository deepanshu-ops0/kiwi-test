terraform {
  backend "s3" {
    bucket = "opszero-b63fbc68-f984-455e-8e8f-b9ac4fb3e1e5"
    key    = "b63fbc68-f984-455e-8e8f-b9ac4fb3e1e5/5d1a38e8-e15a-450e-903c-562255e51faf/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}