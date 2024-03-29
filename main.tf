resource "aws_iam_user" "aws_user" {
  name          = "jyothikalakoti0207"
  path          = "/"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "aws_profile" {
  user    = "${aws_iam_user.aws_user.name}"
#  pgp_key = "keybase:ashokkalakoti1"
  pgp_key = filebase64("./mypublickey.pub")
}


resource "null_resource" "shell" {

  provisioner "local-exec" {
    command = "echo ${aws_iam_user_login_profile.aws_profile.encrypted_password} | base64 --decode -d -i | keybase pgp decrypt >> ./decrypted_password.txt"
  }
}
