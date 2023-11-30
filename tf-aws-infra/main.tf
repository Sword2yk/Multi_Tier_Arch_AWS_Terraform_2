terraform {

  cloud {
    organization = "TerraBootCamp"

    workspaces {
      name = "multi-tier-infra"
    }
  }

  backend "s3" {
    bucket = "three-tier-architecture-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}