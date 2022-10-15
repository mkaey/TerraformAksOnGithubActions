module "adminGroup" {
  source = "./modules/aad"
}

module "statestore" {
  source  = "./modules/statestore"
  postfix = var.postfix
}

module "monitor" {
  source  = "./modules/monitor"
  postfix = var.postfix
}

module "vnet" {
  source  = "./modules/vnet"
  postfix = var.postfix
}

module "aks" {
  source                      = "./modules/aks"
  postfix                     = var.postfix
  aksAdminGroupObjectId       = module.adminGroup.aadAksAdminGroupId
  apiServerAuthorizedIpRanges = var.apiServerAuthorizedIpRanges
  logAnalyticsWorkspaceId     = module.monitor.logAnalyticsId
  nodeSubnetId                = module.vnet.nodeSubnetId
  podSubnetId                 = module.vnet.podSubnetId
}
