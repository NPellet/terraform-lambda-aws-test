

provider "aws" {
  region="eu-central-1"
}


module "lambda" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "my-lambda1"
  description   = "My awesome lambda function"
  handler       = "index.lambda_handler"
  runtime       = "nodejs16.x"
  
  create_package = false
   s3_existing_package = {
    bucket = "zipped-lambda-artifacts-441772730001"
    key    = "NPellet/60faeeb0a60a7818342468ef0048b8f8cd3bdd85.zip"
  }
  
}

