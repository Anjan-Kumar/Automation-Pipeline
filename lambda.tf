################################################################
#Sample Lambda Function
################################################################

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "us-east-2"
}

resource "aws_iam_role" "Demo" {
  name = "Pipeline-Stages"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "demo_lambda" {
    function_name = "basic-pipeline-hello-world-stages"
    handler = "index.handler"
    runtime = "nodejs6.10"
    filename = "function.zip"
    source_code_hash = "${base64sha256(file("function.zip"))}"
    role = "${aws_iam_role.Demo.arn}"
}
