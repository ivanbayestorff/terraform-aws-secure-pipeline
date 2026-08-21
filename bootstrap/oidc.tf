import {
  to = aws_iam_openid_connect_provider.github
  id = "arn:aws:iam::143037703701:oidc-provider/token.actions.githubusercontent.com"
}

resource "aws_iam_openid_connect_provider" "github" {
  client_id_list  = ["sts.amazonaws.com"]
  tags            = {}
  tags_all        = {}
  thumbprint_list = ["ab9d0263244dd0326eb67015705a667e79cfe998"]
  url             = "https://token.actions.githubusercontent.com"
}
