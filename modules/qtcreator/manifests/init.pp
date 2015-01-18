class qtcreator {
	
	package { 'qtcreator' :
		ensure  => latest,
		require => Package['build-essential'],
	}
}
