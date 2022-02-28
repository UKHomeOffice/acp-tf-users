## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_restriction | An array of ip networks which are permitted to use group permissions | `list` | `[]` | no |
| bucket\_name\_override | An override used to override the bucket name | `string` | `""` | no |
| create\_admin\_user | Create a CI admin user | `bool` | `false` | no |
| create\_peering\_user | Create a user for acp peering permissions | `bool` | `false` | no |
| create\_readonly\_user | Create a CI readonly user | `bool` | `false` | no |
| create\_tenants\_admin\_user | Create a CI admin user for tenants pipelines | `bool` | `false` | no |
| create\_tenants\_readonly\_user | Create a CI readonly user for tenants pipelines | `bool` | `false` | no |
| create\_tokens\_user | Create a user with access to manage a K8s tokens file in S3 | `bool` | `false` | no |
| dns\_zone | The Route53 hosting zone for this cluster | `string` | `""` | no |
| email\_addresses | A list of email addresses for key rotation notifications | `list(string)` | `[]` | no |
| environment | The unique environment being created e.g. dev, production etc | `any` | n/a | yes |
| key\_rotation | Enable email notificaiton for old IAM keys | `string` | `"true"` | no |
| kops\_state\_bucket | The name of the kops state bucket (required for S3 tokens access) | `string` | `""` | no |
| terraform\_lock\_table | The terraform bucket name used for state, required for terraform plan permissions | `string` | `""` | no |
| terraform\_tenants\_lock\_tables | A glob for the terraform bucket names used for state, required for terraform plan permissions in tenants pipeline | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| dns\_zone | The DNS zone for the cluster |
| environment | The environment name for the cluster |
| user\_admin | The user with admin access |
| user\_peering | The user with peering access |
| user\_readonly | The user with readonly access |
| user\_tenants\_admin | The user with admin access (used in tenant pipelines) |
| user\_tenants\_readonly | The user with readonly access (used in tenant pipelines) |
| user\_tokens | The user with S3 tokens access |

