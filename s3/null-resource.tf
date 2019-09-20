resource "null_resource" "User-1-Password" {

  provisioner "local-exec" {

    command = "aws iam create-login-profile --user-name ${var.iam_user[0]} --password redhat"

  }

}

resource "null_resource" "User-2-Password" {

  provisioner "local-exec" {

    command = "aws iam create-login-profile --user-name ${var.iam_user[1]} --password redhat"

  }

}

resource "null_resource" "User-3-Password" {

  provisioner "local-exec" {

    command = "aws iam create-login-profile --user-name ${var.iam_user[2]} --password redhat"

  }

}

