resource "aws_instance" "my-instance"{
    ami = var.ami_id #ubuntu
    count = var.instance_count
    instance_type = var.instance_type # free tier
    tags = {
    Name = "${var.my-env}-terra-automate-instance" # Name
    }
    security_groups = [aws_security_group.my_sg.name]
}

# Security Group for EC2 Instances
resource "aws_security_group" "my_sg" {
  name        = "${var.my-env}-sg"
  description = "Security group for ${var.my-env} instances"
  
  # Ingress rules (allow inbound traffic)
  ingress {
    from_port   = 22   # SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80   # HTTP
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443  # HTTPS
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rules (allow outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}