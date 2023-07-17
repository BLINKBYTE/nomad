job "boundary" {
  datacenters = ["*"]
  
  group "boundary"{


    task "boundary" {
        driver = "exec"

          config {
            command = "local/boundary"
            args    = ["server", "-config=local/config.hcl"]
        }
        artifact {
          source      = "https://releases.hashicorp.com/boundary/0.13.0+ent/boundary_0.13.0+ent_linux_amd64.zip"
          destination = "local"
        }
        template {
            destination = "local/config.hcl"
            data = <<EOH
hcp_boundary_cluster_id = "${Boundary_Cluster_ID}"

listener "tcp" {
  address = "0.0.0.0:9202"
  purpose = "proxy"
}
        
worker {
  auth_storage_path = "local/worker1"
  tags {
    location = ["home"]
  }
}
            EOH
        }
    } 
  }
}