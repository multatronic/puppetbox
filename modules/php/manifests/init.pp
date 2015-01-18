class php {
    # Install PHP packages
    $phpPackages = ["php5", "php5-cli", "php5-mysql", "php-pear", "php5-dev", "php-apc", "php5-mcrypt", "php5-gd", "php5-sqlite", "php5-curl", "php5-intl", "php5-xdebug", "php5-memcache", "php5-imagick", "libapache2-mod-php5"]
    package { $phpPackages:
        ensure => latest,
        require => [Exec['apt-get update'], Package['apache2']],
    }

    # Ensure session folder is writable by Vagrant user (under which apache runs)
    file { "/var/lib/php5/session" :
        owner  => "root",
        group  => "vagrant",
        mode   => 0770,
        require => Package["php5"],
    }

    # Define commands for installing pear packages maybe later?
    exec { "pear upgrade":
        command => "pear upgrade",
        require => [Package['php5-cli'], Package['php-pear']],
    }
    exec { "pear auto-discover":
        command => "pear config-set auto_discover 1 system",
        unless => "pear config-get auto_discover system | grep 1",
        require => Exec['pear upgrade'],
    }
}