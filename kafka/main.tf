
resource "azurerm_storage_account" "kafkastorage" {
  name                     = var.storage_acct_name
  resource_group_name      = var.resource_group_name
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "kafkastoragecontainer" {
  name                  = "kafkatestcontainer"
  storage_account_name  = azurerm_storage_account.kafkastorage.name
  container_access_type = "private"
}

resource "azurerm_hdinsight_kafka_cluster" "kafkacluster" {
  name                      = var.kafka_cluster_name
  resource_group_name       = var.resource_group_name
  location                  = "eastus"
  cluster_version           = "4.0"
  tier                      = "Standard"

  component_version {
    kafka = "2.1"
  }

  gateway {
    username = var.kafka_username
    password = var.kafka_password
  }

  storage_account {
    storage_container_id = azurerm_storage_container.kafkastoragecontainer.id
    storage_account_key  = azurerm_storage_account.kafkastorage.primary_access_key
    is_default           = true
  }

  roles {
    head_node {
      vm_size  = var.vm_size
      username = var.kafka_username
      password = var.kafka_password
    }

    worker_node {
      vm_size                  = var.vm_size
      username                 = var.kafka_username
      password                 = var.kafka_password
      number_of_disks_per_node = 1
      target_instance_count    = 3
    }

    zookeeper_node {
      vm_size  = var.vm_size
      username = var.kafka_username
      password = var.kafka_password
    }
  }
}