class custom-commands {
	file { '/usr/bin/haste' :
		ensure 	=> file,
		source 	=> 'puppet:///modules/custom-commands/haste/haste.py',
		mode 	=> 755,
		require => Package['xsel'],
	}
	->
	file { '/bin/haste' :
		ensure 	=> link,
		target 	=> '/usr/bin/haste',
		require => Class['python'],
	}
}