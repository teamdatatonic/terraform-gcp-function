<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | =0.14.9 |
| google | 3.66.1 |
| google-beta | 3.66.1 |

## Providers

| Name | Version |
|------|---------|
| google | 3.66.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| api\_service\_list | (Optional) The service to enable. | `list(any)` | `[]` | no |
| cf\_network\_name | (Required) The VPC Name to create for the Cloud Function. | `string` | n/a | yes |
| cloud\_function\_configs | (Required) Map of objects to configure Cloud Function. | `any` | n/a | yes |
| cloud\_router\_nat\_config | (Required) Map of objects to config cloud nat & router. | `map(any)` | `{}` | no |
| description | (Optional) An optional description of the VPC Network. The resource must be recreated to modify this field. | `string` | `null` | no |
| environment | The GCP envioment where the Cloud Function will be created. | `string` | `"dev"` | no |
| project\_id | The ID of the project where the Cloud Function will be created. | `string` | n/a | yes |
| project\_number | The Number of the project where the Cloud Function will be created. | `string` | n/a | yes |
| region | The region in  which the Cloud Function will be created. | `string` | `"europe-west2"` | no |
| routing\_mode | The network routing mode (default 'REGIONAL'). | `string` | `"REGIONAL"` | no |
| secure\_subnet | (Required) The list of subnet(s) to be created for the Cloud Function Network. | `list(map(string))` | n/a | yes |
| vpc\_connector\_config | (Required) Map of objects to configure VPC Access Connector. | `map(any)` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
