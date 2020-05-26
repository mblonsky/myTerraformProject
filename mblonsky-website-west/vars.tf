variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-west-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-0cc96feef8c6bbff3"
    us-west-1 = "ami-0245d318c6788de52"
    us-west-2 = "ami-08f21f7b6d9013a08"
    eu-west-1 = "ami-036e0cf3021d778d1"
  }
}
