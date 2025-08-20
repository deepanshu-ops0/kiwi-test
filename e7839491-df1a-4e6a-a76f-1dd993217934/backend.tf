terraform {
  backend "s3" {
    bucket = "opszero-8e887215-6049-43ef-8ea5-46cf6f6dc180"
    key    = "8e887215-6049-43ef-8ea5-46cf6f6dc180/e7839491-df1a-4e6a-a76f-1dd993217934/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}