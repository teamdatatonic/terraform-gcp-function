package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/gcp"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestExampleVpc(t *testing.T) {
	t.Parallel()

	network_name := "test-vpc"
	environment_prefix := "dev"

	project_id := gcp.GetGoogleProjectIDFromEnvVar(t)
	terraformDir := "../../examples/simple_network"

	terraformOptions := &terraform.Options{

		TerraformDir: terraformDir,

		Vars: map[string]interface{}{
			"network_name":       network_name,
			"project_id":         project_id,
			"environment_prefix": environment_prefix,
		},
		EnvVars: map[string]string{
			"GOOGLE_CLOUD_PROJECT": project_id,
		},
	}
	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
	vpc_output_name := terraform.Output(t, terraformOptions, "network_name")
	vpc_name_expected := fmt.Sprintf("%s-%s-%s", project_id, network_name, environment_prefix)
	assert.Equal(t, vpc_name_expected, vpc_output_name)
}
