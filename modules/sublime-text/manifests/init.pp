class sublime-text {

        apt::ppa { 'ppa:webupd8team/sublime-text-3' :} 
        ->
        Exec['apt-get update']
        ->
        package { 'sublime-text-installer' :
			ensure => latest,
		}
}
