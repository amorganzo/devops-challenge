variable "AWS_ACCESS_KEY" {
  default = "AKIAIZNMGROUDJGTYGZA"
}

variable "AWS_SECRET_KEY" {
  default = "vhxKBmygxLWnWlksdfsTWrViAZWFyBu4o/3GDrGZ"
}

variable "AWS_REGION" {
  default = "us-west-2"
}

variable "AMIS" {
#ubuntu  default = "ami-32e7464a"
  default = "ami-a042f4d8"
}

variable "INSTANCE_NAME" {
  default = "TB-webserver"
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "/devops-challenge/ansible/tbkey.pem"
}
