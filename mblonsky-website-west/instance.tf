resource "aws_instance" "mblonsky-west1" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

# the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair2.key_name}"

  # user data
  user_data = "${data.template_cloudinit_config.cloudinit-example1.rendered}"

  provisioner "local-exec" {

     command = "echo ${aws_instance.mblonsky-west1.private_ip} > mblonsky-west1.private_ips.txt"
  }
  tags = {
    Name = "MyWestInstance1"
  } 
}
output "ip_west1" {
    value = "${aws_instance.mblonsky-west1.public_ip}"
}


resource "aws_instance" "mblonsky-west2" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

# the VPC subnet
  subnet_id = "${aws_subnet.main-public-2.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair2.key_name}"

  # user data
  user_data = "${data.template_cloudinit_config.cloudinit-example2.rendered}"

  provisioner "local-exec" {
     command = "echo ${aws_instance.mblonsky-west2.private_ip} > mblonsky-west2.private_ips.txt"
  }
  tags = {
    Name = "MyWestInstance2"
  } 
}
output "ip_west2" {
    value = "${aws_instance.mblonsky-west2.public_ip}"
}

