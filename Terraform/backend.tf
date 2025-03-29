terraform {
  backend "s3" {
    bucket         = "jenkins123-terraform-state"
    key            = "jenkins/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    //dynamodb_table = "terraform-state-lock"
  }
}