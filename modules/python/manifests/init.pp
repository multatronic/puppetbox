class python {
	exec { 'install_click' : 
		command => "pip3 install click",
	}

	$python_package = ["python3", "python3-pip"]
	package { $python_package:
		ensure => latest,
	}
	->
	Exec['install_click']

}