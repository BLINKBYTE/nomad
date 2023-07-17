resource "nomad_job" "docker" {
  jobspec = file("${path.module}/files/docker.hcl")
}
