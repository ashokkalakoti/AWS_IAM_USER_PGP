#terraform output password | base64 --decode -d -i | keybase pgp decrypt


output "password" {
  value = "${aws_iam_user_login_profile.aws_profile.encrypted_password}"
}