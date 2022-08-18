

provider "aws" {
  region="us-east-1"
}


module "lambda" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "my-lambda1"
  description   = "My awesome lambda function"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"

  
   s3_existing_package = {
    bucket = "some_bucket"
    key    = "some_key"
  }
  
}

