resource "nomad_job" "vault" {
  jobspec = file("${path.module}/files/vault.hcl")
}
