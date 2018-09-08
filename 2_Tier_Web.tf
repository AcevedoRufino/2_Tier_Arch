

resource "aws_instance" "Tier2_Web" {
  ami = "${var.Server_OS_AMI}"
  instance_type = "${var.Server_Size}"
  key_name = "Terraform_West2_KP"
  security_groups = ["${aws_security_group.Tier2_SG.name}"]

  tags {
    Name = "tier2_web_server"
  }

/*provisioner "remote-exec" {
  inline = [
      "sudo yum -y install epel-release",
      "sudo yum -y install nginx",
       "sudo service nginx start"
     ]
    connection {
      type = "ssh"
      user = "ec2-user"
      #private_key = "${file("C:\Rufino\KP\Terraform_West2_KP.pem")}"
      key_file = "C:\Rufino\KP\Terraform_West2_KP.pem"
    }
  }*/
}

resource "aws_eip" "tier2_web_eip" {
  instance = "${aws_instance.Tier2_Web.id}"
#  vpc      = true
}
