Feature: AKS Features
    Scenario: Reject if storage account is not set to private
        Given I have azurerm_storage_container defined
        Then it must contain container_access_type
        And its value must be private
        
    Scenario: Reject if there is no tags assigned
        Given I have azurerm_kubernetes_cluster defined
        Then it must contain tags
        And its value must not be null

    Scenario: Reject if there is no identity type assigned
        Given I have azurerm_kubernetes_cluster defined
        When it contains identity
        Then it must contain type
        And its value must be SystemAssigned