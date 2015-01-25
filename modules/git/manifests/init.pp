class git ($gitUser, $gitEmail) {
    # Install git
    package { "git":
        ensure => latest,
        require => Exec['apt-get update']
    }

    # Install tig
    package { 'tig':
        ensure => latest,
        require => Exec['apt-get update']
    }
    
    # Set the configuration
    file { "/home/sabot/.gitconfig":
        ensure => file,
        replace => false,
        owner => "sabot",
        group => "sabot",
        source => "puppet:///modules/git/gitconfig"
    }

    # Set the username and password
    exec { "git.username":
        command => "sed -i 's/name = __NAME__/name = $gitUser/' /home/sabot/.gitconfig",
        onlyif => "grep \"name = __NAME__\" /home/sabot/.gitconfig",
        require => File['/home/sabot/.gitconfig']
    }
    exec { "git.email":
        command => "sed -i 's/email = __EMAIL__/email = $gitEmail/' /home/sabot/.gitconfig",
        onlyif => "grep \"email = __EMAIL__\" /home/sabot/.gitconfig",
        require => File['/home/sabot/.gitconfig']
    }

    # Set ignores
    file { "/home/sabot/.gitignore":
        ensure => file,
        replace => false,
        owner => "sabot",
        group => "sabot",
        source => "puppet:///modules/git/gitignore"
    }
}
