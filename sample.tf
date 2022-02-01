data "template_file" "init-sample" {
  template = "${file("${path.cwd}/sample.sh")}"

  vars = {
    ztnetwork   = "XXXXXXXXX"
  }
}

module "vapp_sample" {
  source = "../ehc-module-vcd/vapp/"

  VAPP_NAME    = "vapp_sample"
  NETWORK_NAME = [ "XXXXXXXXX" ]
}

module "sample" {
  source = "../ehc-module-vcd/vapp_vm/"

  VM_NUMBERS    = 2
  VAPP_NAME     = "vapp_sample"
  NETWORK_NAME  = [ "XXXXXXXXX" ]
  VAPP_VM_NAME  = "sample"
  CATALOG_NAME  = "EHC-IMAGES"
  TEMPLATE_NAME = "Ubuntu Server 20.04 LTS"
  MEMORY        = 4096
  CPUS          = 2
  CPU_CORES     = 1
  METADATA      = {
      env = "test"
      role = "sample"
    }
  INITSCRIPT    = "${data.template_file.init-sample.rendered}"

  depends_on = [ module.vapp_sample ]
}