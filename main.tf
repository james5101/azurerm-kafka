provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "kafkarg" {
  name     = var.resource_group_name
  location = "EastUS"
}

resource "azurerm_resource_group" "akscluster" {
  name     = "aks-cluster-james-rg"
  location = "EastUS"
}

# module "kafka_cluster" {
#     source              = "./kafka"
#     resource_group_name = azurerm_resource_group.kafkarg.name
#     kafka_cluster_name  = "kafka-test-cluster-james"
#     storage_acct_name   = "kafkateststorage123"
#     vm_size             = "Standard_D3_V2"
#     kafka_username      = "kafkausr"
#     kafka_password      = var.kafka_password
# }

module "aks_cluster" {
    source              = "./aks"
    resource_group_name = azurerm_resource_group.akscluster.name
    aks_cluster_name    = "aks-test-cluster-james"
    vm_size             = "Standard_D3_V2"
  
}