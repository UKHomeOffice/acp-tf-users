<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.72.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_users_self_serve_access_keys"></a> [users\_self\_serve\_access\_keys](#module\_users\_self\_serve\_access\_keys) | git::https://github.com/UKHomeOffice/acp-tf-self-serve-access-keys | v0.1.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.peering](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.tenants_admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.tenants_readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.tokens](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_membership.peering](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_membership.readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_membership.tenants_admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_membership.tenants_readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_membership.tokens](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy_attachment.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.admin_restrict](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.peering](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.peering_restrict](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.readonly_restrict](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.readonly_terraform_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.tenants_admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.tenants_admin_restrict](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.tenants_readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.tenants_readonly_restrict](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.tenants_readonly_terraform_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.tokens](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.access_restriction](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.peering](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.readonly_terraform_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.tenants_readonly_terraform_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.tokens](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user.peering](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user.readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user.tenants_admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user.tenants_readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user.tokens](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.admin_ip_restriction](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.peering](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.readonly_terraform_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.tenants_readonly_terraform_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.tokens](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_restriction"></a> [access\_restriction](#input\_access\_restriction) | An array of ip networks which are permitted to use group permissions | `list(string)` | `[]` | no |
| <a name="input_bucket_name_override"></a> [bucket\_name\_override](#input\_bucket\_name\_override) | An override used to override the bucket name | `string` | `""` | no |
| <a name="input_create_admin_user"></a> [create\_admin\_user](#input\_create\_admin\_user) | Create a CI admin user | `bool` | `false` | no |
| <a name="input_create_peering_user"></a> [create\_peering\_user](#input\_create\_peering\_user) | Create a user for acp peering permissions | `bool` | `false` | no |
| <a name="input_create_readonly_user"></a> [create\_readonly\_user](#input\_create\_readonly\_user) | Create a CI readonly user | `bool` | `false` | no |
| <a name="input_create_tenants_admin_user"></a> [create\_tenants\_admin\_user](#input\_create\_tenants\_admin\_user) | Create a CI admin user for tenants pipelines | `bool` | `false` | no |
| <a name="input_create_tenants_readonly_user"></a> [create\_tenants\_readonly\_user](#input\_create\_tenants\_readonly\_user) | Create a CI readonly user for tenants pipelines | `bool` | `false` | no |
| <a name="input_create_tokens_user"></a> [create\_tokens\_user](#input\_create\_tokens\_user) | Create a user with access to manage a K8s tokens file in S3 | `bool` | `false` | no |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | The Route53 hosting zone for this cluster | `string` | `""` | no |
| <a name="input_email_addresses"></a> [email\_addresses](#input\_email\_addresses) | A list of email addresses for key rotation notifications | `list(string)` | `[]` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The unique environment being created e.g. dev, production etc | `any` | n/a | yes |
| <a name="input_key_rotation"></a> [key\_rotation](#input\_key\_rotation) | Enable email notificaiton for old IAM keys | `string` | `"true"` | no |
| <a name="input_kops_state_bucket"></a> [kops\_state\_bucket](#input\_kops\_state\_bucket) | The name of the kops state bucket (required for S3 tokens access) | `string` | `""` | no |
| <a name="input_terraform_lock_table"></a> [terraform\_lock\_table](#input\_terraform\_lock\_table) | The terraform bucket name used for state, required for terraform plan permissions | `string` | `""` | no |
| <a name="input_terraform_tenants_lock_tables"></a> [terraform\_tenants\_lock\_tables](#input\_terraform\_tenants\_lock\_tables) | A glob for the terraform bucket names used for state, required for terraform plan permissions in tenants pipeline | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_zone"></a> [dns\_zone](#output\_dns\_zone) | The DNS zone for the cluster |
| <a name="output_environment"></a> [environment](#output\_environment) | The environment name for the cluster |
| <a name="output_user_admin"></a> [user\_admin](#output\_user\_admin) | The user with admin access |
| <a name="output_user_peering"></a> [user\_peering](#output\_user\_peering) | The user with peering access |
| <a name="output_user_readonly"></a> [user\_readonly](#output\_user\_readonly) | The user with readonly access |
| <a name="output_user_tenants_admin"></a> [user\_tenants\_admin](#output\_user\_tenants\_admin) | The user with admin access (used in tenant pipelines) |
| <a name="output_user_tenants_readonly"></a> [user\_tenants\_readonly](#output\_user\_tenants\_readonly) | The user with readonly access (used in tenant pipelines) |
| <a name="output_user_tokens"></a> [user\_tokens](#output\_user\_tokens) | The user with S3 tokens access |
<!-- END_TF_DOCS -->