resource "aws_dynamodb_table" "site" {
  count = var.dynamodb ? 1 : 0

  name = var.domain

  hash_key  = "pk"
  range_key = "sk"

  attribute {
    name = "pk"
    type = "S"
  }

  attribute {
    name = "sk"
    type = "S"
  }

  billing_mode = "PAY_PER_REQUEST"

  lifecycle {
    prevent_destroy = true
  }
}
