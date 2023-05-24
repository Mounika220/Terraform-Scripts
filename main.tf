module "rg" {
  source = "./Scripts/ResourceGroup"
  rg_location = var.rg_location
  rg_name = var.rg_name
}