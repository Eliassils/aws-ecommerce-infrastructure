variable "region" {
  type = string
  default = "us-east-1"
}
variable "assume_role" {
  type = object({
    role_arn = string
  })
  default = {
    role_arn = "arn:aws:iam::846863293650:role/terraform-role"
  }

}
variable "tags" {
  type = map(string)
  default = {
    Project = "not-so-simple-ecommerce"
    Environment ="production"
  }
}
variable "remote_backend" {
    type=object({
      bucket = string
      state_locking = object({
        dynamodb_table_name = string
        dynamodb_table_billing_mode = string
        dynamodb_table_hash_key = string
        dynamodb_table_hash_key_type = string
      })
    })
  default = {
    bucket = "devops-projeto-ecommerce-elias"
    state_locking = {
      dynamodb_table_name = "nsse-terraform-state-locking"
      dynamodb_table_billing_mode ="PAY_PER_REQUEST"
      dynamodb_table_hash_key ="LockID"
      dynamodb_table_hash_key_type="S"
    }
  }
}