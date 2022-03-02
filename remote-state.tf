# Using a single workspace:
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "medeiros-erika-labs"

    workspaces {
      name = "medeiros-erika-labs"
    }
  }
}