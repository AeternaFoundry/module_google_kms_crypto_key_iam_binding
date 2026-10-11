variable "kms_crypto_key_iam_bindings" {
  description = <<EOT
Map of kms_crypto_key_iam_bindings, attributes below
Required:
    - crypto_key_id
    - members
    - role
Optional:
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    crypto_key_id = string
    members       = set(string)
    role          = string
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

