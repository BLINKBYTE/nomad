variable Boundary_Cluster_ID {
  default = "9d812908-eb0f-4aed-b639-5b013af8d478"
}

resource "nomad_job" "boundary" {
  jobspec = templatefile("${path.module}/files/boundary.hcl", {
    Boundary_Cluster_ID = var.Boundary_Cluster_ID
  })
}
