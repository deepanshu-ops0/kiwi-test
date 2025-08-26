terraform {
  backend "s3" {
    bucket = "opszero-b63fbc68-f984-455e-8e8f-b9ac4fb3e1e5"
    key    = "b63fbc68-f984-455e-8e8f-b9ac4fb3e1e5/e235ae9a-8587-4d88-a0ee-c2d723c5f481/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}