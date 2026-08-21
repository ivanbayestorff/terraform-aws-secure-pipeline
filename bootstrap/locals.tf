locals {
  github_owner    = "ivanbayestorff"
  github_owner_id = "257209814"
  github_repo     = "terraform-aws-secure-pipeline"
  github_repo_id  = "1335529678"

  tfstate_bucket = "pipeline-project-terraform-state"

  # Immutable subject format — repos created after 2026-07-15
  # repo:OWNER@OWNER_ID/REPO@REPO_ID:<qualifier>
  sub_prefix = "repo:${local.github_owner}@${local.github_owner_id}/${local.github_repo}@${local.github_repo_id}"

  sub_pull_request = "${local.sub_prefix}:pull_request"
  sub_environment  = "${local.sub_prefix}:environment:production"
}