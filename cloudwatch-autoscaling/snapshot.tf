# Creating snapshot for ami

resource "aws_ebs_snapshot" "Snapshot-1" {
  
  volume_id = "${aws_instance.EC2-1.root_block_device.0.volume_id}"
  tags = {
    Name = "Snapshot-1"
  }

}

resource "aws_ebs_snapshot" "Snapshot-2" {

  volume_id = "${aws_instance.EC2-2.root_block_device.0.volume_id}"
  tags = {
    Name = "Snapshot-2"
  }

}

