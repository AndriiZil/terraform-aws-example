module "backend_dev" {
    source = "../resources"
    instance_type = "t2.micro"
    instance_name = "lowercase_instance"
}

module "backend_test" {
    source = "../resources"
    instance_type = "t2.micro"
    instance_name = "UPPERCASE_INSTANCE"
}

module "backend_prod" {
    source = "../resources"
    instance_name = "MIXED_CaSe_InstanCe"
}

terraform {
    backend "s3" {
        bucket = "ebucket-tf-state"
        key = "tfstate/ec2.tfstate"
        region = "eu-central-1"
    }
}