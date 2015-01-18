#invoke puppetbox class, which will include all the stuff we want
class { "puppetbox": 
	gitUser 	=> "YOUR GIT USER HERE",
	gitEmail 	=> "YOUR GIT EMAIL HERE"
}
