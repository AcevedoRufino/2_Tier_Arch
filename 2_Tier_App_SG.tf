
resource "aws_security_group" "Tier2_App_SG" {
    name = "tier2-app-sg"

    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.tier2_web_eip.public_ip}/32"]
  }

   ingress {
   from_port   = 443
   to_port     = 443
   protocol    = "tcp"
   cidr_blocks = ["${aws_eip.tier2_web_eip.public_ip}/32"]
}

  ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
 }
}
