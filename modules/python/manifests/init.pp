class python {

	$pip_libs = ['click', 'xsel']

	exec { 'install_libs' : 
		command => "pip3 install $pip_libs",
	}

	$python_package = ['python3', 'python3-pip']
	package { $python_package:
		ensure => latest,
	}
	->
	Exec['install_libs']

}