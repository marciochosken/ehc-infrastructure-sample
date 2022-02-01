terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.4.0"
    }
  }
}

provider "vcd" {
  user                 = "XXXXXXXXX"
  password             = "XXXXXXXXX"
  org                  = "XXXXXXXXX"
  vdc                  = "XXXXXXXXX"
  url                  = "XXXXXXXXX"
  allow_unverified_ssl = true
}