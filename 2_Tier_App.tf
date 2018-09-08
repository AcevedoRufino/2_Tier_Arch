
resource "aws_instance" "Tier2_App" {
  ami = "${var.Server_OS_AMI}"
  instance_type = "${var.Server_Size}"
  key_name = "Terraform_West2_KP"
  security_groups = ["${aws_security_group.Tier2_App_SG.name}"]

  tags {
    Name = "tier2_app_server"
  }
}

resource "aws_eip" "tier2_app_eip" {
  instance = "${aws_instance.Tier2_App.id}"
#  vpc      = true
}
