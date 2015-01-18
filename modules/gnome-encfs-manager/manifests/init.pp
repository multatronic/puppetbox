class gnome-encfs-manager {
        
        apt::ppa { 'ppa:gencfsm/ppa' :} 
        ->
        Exec['apt-get update']
        ->
        package { 'gnome-encfs-manager' :
		ensure => latest,
	}
}
