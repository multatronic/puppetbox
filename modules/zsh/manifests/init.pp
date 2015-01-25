class zsh {
    # Install ZSH
    package { 'zsh':
        ensure => latest,
        require => Exec['apt-get update']
    }

    # define function for setting symlinks from array
    define sym_link {
        file { $title:
            ensure  => link,
            path    => regsubst($title, "^/", "/home/sabot/."),
            target  => regsubst($title, "^/", "/home/sabot/.zprezto/runcoms/"),
        }
    }

    # copy .zprezto folder and setup symlinks
    file { "/home/sabot/.zprezto":
        ensure  => directory,
        owner   => "sabot",
        group   => "sabot",
        recurse => true,
        source  => "puppet:///modules/zsh/zprezto",
    }
    ->
    sym_link {['/zlogin','/zlogout','/zprofile','/zpreztorc','/zshenv', '/zshrc']:}


    # Set the shell
    exec { "chsh -s /usr/bin/zsh sabot":
        unless  => "grep -E '^sabot.+:/usr/bin/zsh$' /etc/passwd",
        require => Package['zsh']
    }
}
