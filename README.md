<<<<<<< HEAD
# terraform-gcp-function

=======
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


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


### Contributing 
When committing code, use [Commitizen](https://github.com/commitizen/cz-cli).
This then allows us to setup semantic versioning using [Semantic Release](https://github.com/semantic-release/semantic-release) in CICD pipeline.

To install commitizen:
```bash
npm install -g commitizen
```
From now on, when commiting code, instead of `git commit`, run `cz -s`
>>>>>>> 66f27ec (feat(initial project setup): initial setup Google Cloud Functions)
