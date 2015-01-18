class vim {
    # Install vim
    package { 'vim':
        ensure => latest,
        require => Exec['apt-get update']
    }

    # Set the configuration
    file { "/home/vagrant/.vimrc":
        ensure => present,
        owner => "vagrant",
        group => "vagrant",
        source => "puppet:///modules/vim/vimrc",
        require => Package['vim'],
    }

    file { "/home/vagrant/.vim": 
        ensure => directory,
        recurse => true,
        source => "puppet:///modules/vim/vim-config",
        require => Package['vim'], 
    }
}