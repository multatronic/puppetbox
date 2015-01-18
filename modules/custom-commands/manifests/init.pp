class custom-commands {

	file { '/usr/bin/haste.py' :
		ensure => file,
		source => 'puppet:///modules/custom-commands/haste/haste.py',
	}
	->
	file { '/usr/bin/haste' :
		ensure 	=> link,
		target 	=> '/usr/opt/haste',
		require => Package['python'],
	}
}