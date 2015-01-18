class mysql($mysqlRootPass) {
    # Install mysql
    package { "mysql-server":
        ensure => latest,
        require => Exec['apt-get update']
    }

    # Enable the MySQL service
    service { "mysql":
        enable => true,
        ensure => running,
        require => Package["mysql-server"],
    }

    # Set MySQL password to "root"
    exec { "set-mysql-password":
        unless => "mysqladmin -uroot -p${mysqlRootPass} status",
        command => "mysqladmin -uroot password ${mysqlRootPass}",
        require => Service["mysql"],
    }
}