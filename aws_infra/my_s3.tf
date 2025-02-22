resource "aws_s3_bucket" "my-bucket" {
    bucket = "${var.my-env}-terraform-devops-project"
    tags = {
        Name = "${var.my-env}-terraform-devops-project"
        environment = var.my-env
    }   
}