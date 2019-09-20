# Creating and Selecting ami for auto scaling

resource "aws_ami" "AMI-1" {

  name = "Public-AMI-1"
  virtualization_type = "hvm"
  root_device_name  = "/dev/xvda"

  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = "${aws_ebs_snapshot.Snapshot-1.id}"
    volume_size = 8
    volume_type = "gp2"
  }
  
}

resource "aws_ami" "AMI-2" {

  name = "Public-AMI-2"
  virtualization_type = "hvm"
  root_device_name  = "/dev/xvda"

  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = "${aws_ebs_snapshot.Snapshot-2.id}"
    volume_size = 8
    volume_type = "gp2"
  }
  
}

