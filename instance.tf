resource "aws_instance" "test" {
    ami = "${lookup(var.AMIS, var.AWS_REGION)}" 
    instance_type = "t2.micro"
}

output "public-ip" {
    value = "${aws_instance.test.public_ip}"
}

output "private-ip" {
    value = "${aws_instance.test.private_ip}"
}
