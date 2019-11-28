# Azure AWS AKS Workshop

This quick workshop will walk you through configuring AKS with RBAC using Terraform and Helm.

Feel free to open Issues with requests for new topics or challenges.

## Prerequisits

Install prerequisits

```
brew bundle
```

## Azure credentials

Please follow the [tutorial](https://github.com/sorah/envchain#saving-variables) on how to set Azure secrets.

There are multiple ways to create Azure Service principal and generate credentials

- [Terraform Docs](https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html)
- [Azure Docs](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure?/azure/terraform/toc.json&bc=/azure/bread/toc.json)

Make sure the credentials stored securely on dev machine.

All the Azure secrets are set with `envchain` and stored in MacOS keychain.

```
$ envchain --set az ARM_CLIENT_ID ARM_CLIENT_SECRET  ARM_SUBSCRIPTION_ID ARM_TENANT_ID
> az.ARM_CLIENT_ID: XXXX
> az.ARM_CLIENT_SECRET: XXXX # pragma: allowlist secret
> az.ARM_SUBSCRIPTION_ID: XXXX
> az.ARM_TENANT_ID: XXXX
```

Please follow the [tutorial](https://github.com/sorah/envchain#saving-variables) on how to use `envchain`

## Terraform Prerequisits



## Awailable Commands

<!-- START makefile-doc -->
```
$ make help 
setup                          Setup dependencies
hooks                          install pre commit.
validate                       Validate files with pre-commit hooks
changelog                      Update changelog
release                        Create release version
tfm-platform                   Step 1. Deploy base. Networking & Kubernetes 
```
<!-- END makefile-doc -->