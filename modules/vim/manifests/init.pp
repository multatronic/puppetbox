class vim {
    # Install vim
    package { 'vim':
        ensure => latest,
        require => Exec['apt-get update']
    }

    # copy vim plugins and whatnot
    file { "/home/sabot/.vim": 
        ensure => directory,
        recurse => true,
        source => "puppet:///modules/vim/vim-config",
        require => Package['vim'], 
    }
    ->
    file {"/home/sabot/.vimrc":
        ensure => link,
        target => "/home/sabot/.vim/.vimrc", 
    }
}
