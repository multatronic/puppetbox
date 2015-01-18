#invoke puppetbox class, which will include all the stuff we want
class { "puppetbox": 
	gitUser 		=> "bytechomper",
	gitEmail 		=> "bytechomper@gmail.com"
}
