locals {
  aksName = "aks-${var.postfix}"
}

resource "azurerm_resource_group" "aksRg" {
  name     = "rg-aks"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = local.aksName
  location            = azurerm_resource_group.aksRg.location
  resource_group_name = azurerm_resource_group.aksRg.name
  dns_prefix          = var.postfix

  identity {
    type = "SystemAssigned"
  }

  node_resource_group = "rg-aks-nodes"
  default_node_pool {
    name                = "default"
    vm_size             = "Standard_B2S"
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = true
    max_count           = 2
    min_count           = 1
    pod_subnet_id       = var.podSubnetId
    vnet_subnet_id      = var.nodeSubnetId
    //os_disk_type        = "Ephemeral"

  }

  azure_active_directory_role_based_access_control {
    azure_rbac_enabled     = true
    admin_group_object_ids = [var.aksAdminGroupObjectId]
    managed                = true
  }

  api_server_authorized_ip_ranges = var.apiServerAuthorizedIpRanges

  azure_policy_enabled = true

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  oms_agent {
    log_analytics_workspace_id = var.logAnalyticsWorkspaceId
  }

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

}
