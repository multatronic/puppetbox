class vim {
    # Install vim
    package { 'vim':
        ensure => latest,
        require => Exec['apt-get update']
    }

    # copy vim plugins and whatnot
    file { "/home/vagrant/.vim": 
        ensure => directory,
        recurse => true,
        source => "puppet:///modules/vim/vim-config",
        require => Package['vim'], 
    }
    ->
    file {"/home/vagrant/.vimrc":
        ensure => link,
        target => "/home/vagrant/.vim/.vimrc", 
    }
}