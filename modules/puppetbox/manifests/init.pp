 class puppetbox {
    # Set paths
    Exec {
        path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
    }

    # set command to update repo list
    exec { "apt-get update":
        command => "apt-get update",
    }

    include vim
    include zsh
}