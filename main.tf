

provider "aws" {
  region = "eu-central-1"
}

variable "lambda_name" {
  type        = string
  description = "The name of the lambda image"
}

variable "lambda_ref" {
  type        = string
  description = "The reference (tag or branch) of the lambda"
}

variable "handler" {
  type        = string
  description = "The handler function (path/to/main.functioname)"
}

variable "name" {
  type        = string
  description = "The name of your lambda"
}

variable "description" {
  type    = string
  default = ""
}

module "lambda" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = vars.name
  description   = vars.description
  handler       = vars.handler
  runtime       = "nodejs16.x"

  create_package = false

  s3_existing_package = {
    bucket = "zipped-lambda-artifacts-441772730001"
    key    = "${var.lambda_name}.${var.lambda_ref}.zip"
  }
}

