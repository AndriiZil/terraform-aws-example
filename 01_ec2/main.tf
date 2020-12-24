resource "aws_instance" "web" {
    ami = "ami-0502e817a62226e03"
    instance_type = "t2.micro"
}