data "aws_iam_policy_document" "tfstate" {
  statement {
    sid       = "ListStateBucket"
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::${local.tfstate_bucket}"]
  }

  statement {
    sid    = "StateObjects"
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
    ]
    resources = ["arn:aws:s3:::${local.tfstate_bucket}/terraform-aws-secure-pipeline/*"]
  }
}
  
resource "aws_iam_policy" "tfstate" {
  name   = "gha-terraform-state-access"
  policy = data.aws_iam_policy_document.tfstate.json
}

resource "aws_iam_role_policy_attachment" "plan_state" {
  role       = aws_iam_role.plan.name
  policy_arn = aws_iam_policy.tfstate.arn
}

resource "aws_iam_role_policy_attachment" "apply_state" {
  role       = aws_iam_role.apply.name
  policy_arn = aws_iam_policy.tfstate.arn
}

output "plan_role_arn"  { value = aws_iam_role.plan.arn }

output "apply_role_arn" { value = aws_iam_role.apply.arn }