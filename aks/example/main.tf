resource "azurerm_resource_group" "akscluster" {
  name     = "aks-cluster-james-rg"
  location = "EastUS"
}

module "aks_cluster" {
    source              = "./"
    resource_group_name = azurerm_resource_group.akscluster.name
    aks_cluster_name    = "aks-test-cluster-james"
    vm_size             = "Standard_D3_V2"
  
}