resource "aws_instance" "test" {
    ami = "ami-01c36f3329957b16a"
    instance_type = "t2.micro"
}

output "public-ip" {
    value = "${aws_instance.test.public_ip}"
}

output "private-ip" {
    value = "${aws_instance.test.private_ip}"
}
