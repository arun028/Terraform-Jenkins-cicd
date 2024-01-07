provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "fo" {
  ami           = "ami-079db87dc4c10ac91"
  instance_type = "t2.micro"
  tags = {
      Name = "test-int"
  }
}
resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1"
  size = 1
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.fo.id
}
