resource "aws_instance" "web" {
    count = 4
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type

    tags = {
        Name = lower(var.instance_name)
    }
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

resource "aws_eip" "lb" {
    count = 4
    instance = aws_instance.web[count.index].id
    vpc = true
}
