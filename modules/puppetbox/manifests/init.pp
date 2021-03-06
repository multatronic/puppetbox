 class puppetbox ($gitUser, $gitEmail, $mysqlRootPass) {
    # Set paths
    Exec {
        path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
    }

    # set command to update repo list
    exec { "apt-get update":
        command => "apt-get update",
    }

    # Set up the packages we want
    include vim
    include zsh
    include apache
    include php
    include transmission
    include qtcreator
    include apt
    include dropbox
    include vlc
    include gnome-encfs-manager
    include sublime-text
    include build-essential
    include virtualbox
    include python
    include custom-commands

    class{ 'git' :
        gitUser     => $gitUser,
        gitEmail    => $gitEmail,
    }

    class{ 'mysql':
        mysqlRootPass => $mysqlRootPass,
    }
}