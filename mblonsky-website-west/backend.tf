terraform {
  Backend "s3" {
    bucket ="terraform-state-mb"
    key = "terraform/demo4"
  }
}
