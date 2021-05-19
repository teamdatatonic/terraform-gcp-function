<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| archive | n/a |
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_dir\_name | (Required) The directory name for the Cloud Function Application Code. | `string` | n/a | yes |
| available\_memory\_mb | (Optional) Memory (in MB), available to the cloud function. | `number` | `256` | no |
| cf\_project\_level\_roles | (Optional) The list of role(s) that should be applied to the Cloud Function ServiceAccount. | `list(any)` | `[]` | no |
| cf\_service\_account\_name | (Required) The account id that is used to generate the service account email address and a stable unique id for the Cloud Function. | `string` | n/a | yes |
| description | (Optional) Description of the cloud function. | `string` | `null` | no |
| egress\_settings | The egress settings for the connector, controlling what traffic is diverted through it. Allowed values are ALL\_TRAFFIC and PRIVATE\_RANGES\_ONLY. Defaults to PRIVATE\_RANGES\_ONLY. If unset, this field preserves the previously set value. | `string` | n/a | yes |
| entry\_point | (Optional) Name of the function that will be executed when the Google Cloud Function is triggered. | `string` | n/a | yes |
| environment | The GCP envioment where the cloud function will be created. | `string` | n/a | yes |
| environment\_variables | (Optional) A set of key/value environment variable pairs to assign to the function. | `map(string)` | n/a | yes |
| event\_trigger | value | <pre>object({<br>    event_type           = string<br>    resource             = string<br>    retry_policy_enabled = bool<br>  })</pre> | `null` | no |
| function\_name | (Required) A user-defined name of the function. Function names must be unique globally. | `string` | n/a | yes |
| ingress\_settings | String value that controls what traffic can reach the function. | `string` | n/a | yes |
| project\_id | (Required) The ID of the project where the cloud function will be deployed. | `string` | n/a | yes |
| project\_number | (Required) The NUMBER of the project where the cloud function will be deployed. | `string` | n/a | yes |
| region | (Required) Region of function. | `string` | n/a | yes |
| runtime | (Required) The runtime in which the function is going to run. | `string` | n/a | yes |
| source\_code\_bucket\_name | (Required) The GCS bucket to create for  containing the zip archive which contains the function. | `string` | n/a | yes |
| timeout | (Optional) Timeout (in seconds) for the function. Default value is 60 seconds. Cannot be more than 540 seconds. | `number` | `60` | no |
| trigger\_http | (Optional) Boolean variable. Any HTTP request (of a supported type) to the endpoint will trigger function execution. Supported HTTP request types are: POST, PUT, GET, DELETE, and OPTIONS. Endpoint is returned as https\_trigger\_url. Cannot be used with trigger\_bucket and trigger\_topic. | `bool` | `null` | no |
| vpc\_connector | The VPC Network Connector that this cloud function can connect to. It should be set up as fully-qualified URI. The format of this field is projects/\*/locations/\*/connectors/\* | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
