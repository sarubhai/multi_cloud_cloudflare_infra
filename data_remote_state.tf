# Name: data_remote_state.tf
# Owner: Saurav Mitra
# Description: This terraform config will retrieve the AWS, Azure, DO & GCP Infra module output values
# https://www.terraform.io/docs/language/state/remote-state-data.html

data "terraform_remote_state" "aws" {
  backend = "remote"
  config = {
    organization = "multi-cloud-tf"

    workspaces = {
      name = "aws_infra"
    }
  }
}

data "terraform_remote_state" "azure" {
  backend = "remote"
  config = {
    organization = "multi-cloud-tf"

    workspaces = {
      name = "azure_infra"
    }
  }
}

data "terraform_remote_state" "do" {
  backend = "remote"
  config = {
    organization = "multi-cloud-tf"

    workspaces = {
      name = "do_infra"
    }
  }
}

data "terraform_remote_state" "gcp" {
  backend = "remote"
  config = {
    organization = "multi-cloud-tf"

    workspaces = {
      name = "gcp_infra"
    }
  }
}
