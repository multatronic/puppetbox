class qtcreator {
	
	package { 'build-essential' :
		ensure => latest,
	}

	package { 'qtcreator' :
		ensure  => latest,
		require => Package['build-essential'],
	}
}
