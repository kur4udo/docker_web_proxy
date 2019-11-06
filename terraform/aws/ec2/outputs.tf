# Server info

output "server_id" {
    value = "${aws_instance.ubuntu_server.id}"
}

output "server_dns" {
    value = "${aws_instance.ubuntu_server.public_dns}"
}

output "server_public_ip" {
    value = "${aws_instance.ubuntu_server.public_ip}"
}