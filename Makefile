login:
	az login
	
plan:
	terraform plan -out=plan

azure_compliance:
	terraform-compliance.exe -p .\plan -f git:https://github.com/james5101/terraform-compliance-azure.git