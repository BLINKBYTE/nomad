resource "nomad_job" "app" {
  jobspec = file("${path.module}/files/coder.hcl")
}