data "aws_ip_ranges" "Tokyo_ec2" {
    regions = [ "ap-northeast-1" ]
    services  = [ "ec2" ]
}

resource "aws_security_group" "from_Tokyo" {
    name = "from_Tokyo"

    ingress {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = "${data.aws_ip_ranges.Tokyo_ec2.cidr_blocks}"
    }

    tags = {
        CreateDate = "${data.aws_ip_ranges.Tokyo_ec2.create_date}"
        SyncToken = "${data.aws_ip_ranges.Tokyo_ec2.sync_token}"
    }
}

output "cidr-blocks" {
    value = "${data.aws_ip_ranges.Tokyo_ec2.cidr_blocks}"
}

output "createdate" {
    value = "${data.aws_ip_ranges.Tokyo_ec2.create_date}"
}

output "SyncToken" {
    value = "${data.aws_ip_ranges.Tokyo_ec2.sync_token}"
}