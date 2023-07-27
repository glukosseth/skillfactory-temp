## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_compute_instance.vm](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) | resource |
| [yandex_compute_image.my_image](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_family_image"></a> [instance\_family\_image](#input\_instance\_family\_image) | Instance image | `string` | `"lamp"` | no |
| <a name="input_vpc_subnet_id"></a> [vpc\_subnet\_id](#input\_vpc\_subnet\_id) | VPC subnet network id | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | zone instance | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_address_vm"></a> [external\_ip\_address\_vm](#output\_external\_ip\_address\_vm) | n/a |
| <a name="output_internal_ip_address_vm"></a> [internal\_ip\_address\_vm](#output\_internal\_ip\_address\_vm) | n/a |
