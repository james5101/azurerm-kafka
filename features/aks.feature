Feature: Feature
    Scenario: Reject if storage account is not set to private
        Given I have azurerm_storage_container defined
        Then it must contain container_access_type
        And its value must be private
        
    Scenario: Reject if there is no tags assigned
        Given I have azurerm_kubernetes_cluster defined
        Then it must contain tags