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
            path    => regsubst($title, "^/", "/home/vagrant/."),
            target  => regsubst($title, "^/", "/home/vagrant/.zprezto/runcoms/"),
        }
    }

    # copy .zprezto folder and setup symlinks
    file { "/home/vagrant/.zprezto":
        ensure  => directory,
        owner   => "vagrant",
        group   => "vagrant",
        recurse => true,
        source  => "puppet:///modules/zsh/zprezto",
    }
    ->
    sym_link {['/zlogin','/zlogout','/zprofile','/zpreztorc','/zshenv', '/zshrc']:}


    # Set the shell
    exec { "chsh -s /usr/bin/zsh vagrant":
        unless  => "grep -E '^vagrant.+:/usr/bin/zsh$' /etc/passwd",
        require => Package['zsh']
    }
}