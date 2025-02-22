module "dev-app" {
    source = "./aws_infra"
    my-env = "dev"
    instance_type = "t2.micro"
    ami_id = "ami-04b4f1a9cf54c11d0"
    instance_count = 1
}

module "stg-app" {
    source = "./aws_infra"
    my-env = "stg"
    instance_type = "t2.medium"
    ami_id = "ami-04b4f1a9cf54c11d0"
    instance_count = 2 
}

module "prd-app" {
    source = "./aws_infra"
    my-env = "prd"
    instance_type = "t2.large"
    ami_id = "ami-04b4f1a9cf54c11d0"
    instance_count = 3
}