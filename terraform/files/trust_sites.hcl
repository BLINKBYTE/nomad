job "trust" {
    type = "sysbatch"
    datacenters = ["*"]

    task "trust" {
        driver = "raw_exec"

        config {
            command = "sh"
            args =  ["local/setup.sh"]
        }
        template {
            destination = "local/setup.sh"
            data = <<EOH
            ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
            EOH
        }
    }
}