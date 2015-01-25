class apache {
    # Install apache
    package { "apache2":
        ensure => latest,
        require => Exec['apt-get update']
    }

    # Change user / group
    exec { "apache2-change-user" :
        command => "echo 'User sabot' >> /etc/apache2/httpd.conf",
        unless  => "grep -c 'User sabot' /etc/apache2/httpd.conf",
        require => Package["apache2"],
        notify  => Service['apache2'],
    }

    # Enable the apache service
    service { "apache2":
        enable      => true,
        ensure      => running,
        require     => Package["apache2"],
        subscribe   => File["/etc/apache2/mods-enabled/rewrite.load"],
    }

    # ensures that mod_rewrite is loaded and modifies the default configuration file
    file { "/etc/apache2/mods-enabled/rewrite.load":
        ensure => link,
        target => "/etc/apache2/mods-available/rewrite.load",
        require => Package['apache2'],
    }

    # Set the hostname and documentroot
    exec { "apache.hostname":
        command => "echo \"ServerName localhost\" >> /etc/apache2/httpd.conf",
        unless => "grep ServerName /etc/apache2/httpd.conf",
        require => Package['apache2'],
        notify  => Service["apache2"]
    }

    # Remove the default index file
    file { "/var/www/index.html":
        ensure => absent,
        require => Package['apache2']
    }
}
