terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "DCR_POC"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_schema" "demo_schema" {
  database = "DEMO_DB"
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}
