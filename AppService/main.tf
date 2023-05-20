module "rg" {
    source = "./module/RG"
    name = var.rg_name
    location = var.location
}
module "webapp" {
  source = "./module/webapp"
  name = var.webapp_name
  location = var.location
  sku_name = var.sku_name
  os_type = var.os_type
  ASP_name = var.ASP_name
  rg_name = var.rg_name
  depends_on = [
    module.rg
  ]
}