

provider "aws" {
  region="eu-central-1"
}


module "lambda" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "my-lambda1"
  description   = "My awesome lambda function"
  handler       = "main.handler"
  runtime       = "nodejs16.x"
  
  create_package = false
   s3_existing_package = {
    bucket = "zipped-lambda-artifacts-441772730001"
    key    = "NPellet/terraform-lambda-aws-test/879060db2eaa437ed18d06e016a3918cb9f72cd7.zip"
  }
  
}

