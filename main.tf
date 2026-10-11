resource "google_kms_crypto_key_iam_binding" "kms_crypto_key_iam_bindings" {
  for_each = var.kms_crypto_key_iam_bindings

  crypto_key_id = each.value.crypto_key_id
  members       = each.value.members
  role          = each.value.role

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

