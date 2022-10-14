module "aks" {
  source = "./modules/aks"
  postfix = var.postfix
}
