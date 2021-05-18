# Terraform Google Cloud Function  

This repo contains Terraform resource module for running an Event Triggered Function on Google Cloud Platform built in accordance to  [best practices for designing, implementing, testing, and deploying Cloud Functions doc by Google](https://cloud.google.com/functions/docs/bestpractices/tips#functions-tips-lazy-globals-go).

This module is available in [Datatonic Terraform Registry](https://registry.terraform.io/namespaces/teamdatatonic) 

## Prerequisites
- [Terraform](https://tfswitch.warrensbox.com/) 
- [Commitizen](https://github.com/commitizen/cz-cli)
- [precommit](https://pre-commit.com/)

### Local Setup 
- install pre-commit: `brew install pre-commit`.
- install the git hook scripts: `pre-commit install`.

## Usage
You can go to the examples folder for module usage, the usage of the resource modules could be like this in your own main.tf file:

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
| environment | The GCP envioment where the Cloud Function will be created. | `string` | `null` | no |
| project\_id | The ID of the project where the Cloud Function will be created. | `string` | n/a | yes |
| project\_number | The Number of the project where the Cloud Function will be created. | `string` | n/a | yes |
| region | The region in  which the Cloud Function will be created. | `string` | `"europe-west2"` | no |
| routing\_mode | The network routing mode (default 'REGIONAL'). | `string` | `"REGIONAL"` | no |
| secure\_subnet | (Required) The list of subnet(s) to be created for the Cloud Function Network. | `list(map(string))` | n/a | yes |
| vpc\_connector\_config | (Required) Map of objects to configure VPC Access Connector. | `map(any)` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


### Contributing 
When committing code, use [Commitizen](https://github.com/commitizen/cz-cli).
This then allows us to setup semantic versioning using [Semantic Release](https://github.com/semantic-release/semantic-release) in CICD pipeline.

To install commitizen:
```bash
npm install -g commitizen
```
From now on, when commiting code, instead of `git commit`, run `cz -s`
