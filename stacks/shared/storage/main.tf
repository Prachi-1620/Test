provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.bucket_name}"
  acl    = "${var.main_bucket_acl}"
  region = "${var.region}"
   
 tags{
		Name = "Infra_Automation"
		Environment = "${var.environment}"
	}
}
