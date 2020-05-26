data "template_file" "init-script1" {
  template = "${file("scripts/init.cfg")}"
  vars {
    REGION = "${var.AWS_REGION}"
  }
}
data "template_file" "shell-script1" {
  template = "${file("scripts/apache1.sh")}"
}

data "template_cloudinit_config" "cloudinit-example1" {

  gzip = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = "${data.template_file.init-script1.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.shell-script1.rendered}"
  }

}


data "template_file" "init-script2" {
  template = "${file("scripts/init.cfg")}"
  vars {
    REGION = "${var.AWS_REGION}"
  }
}
data "template_file" "shell-script2" {
  template = "${file("scripts/apache2.sh")}"
}

data "template_cloudinit_config" "cloudinit-example2" {

  gzip = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = "${data.template_file.init-script2.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.shell-script2.rendered}"
  }

}
