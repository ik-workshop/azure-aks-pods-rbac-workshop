<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| prefix | The project prefix. Must be unique per project or client | string | n/a | yes |
| region | The location where the resource group should be created. For a list of all Azure locations, please consult this link or run az account list-locations --output table | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| resource\_group\_id | The resource group ID. A container that holds related resources for an Azure solution. The resource group includes those resources that you want to manage as a group. You decide which resources belong in a resource group based on what makes the most sense for your organization. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->