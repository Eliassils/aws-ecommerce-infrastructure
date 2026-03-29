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