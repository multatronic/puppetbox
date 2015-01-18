 class puppetbox {
    # Set paths
    Exec {
        path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
    }

    # Ensure we are up to date
    exec { "apt-get update":
        command => "apt-get update",
    }

    include vim
    include zsh
}