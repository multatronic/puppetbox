Puppet configuration with all the stuff I want in it. This project is intended to make my life a little easier when migrating to a new computer.

Config
====================

The following software is installed through puppet:
* Build-essential
* ViM with a few plugins  (see repository vim-config)
* Zsh with prezto         (see repository prezto-config)
* Git and Tig
* Apache 
* PHP5
* MySQL
* Transmission bittorrent client
* QtCreator
* Dropbox (just downloads the installer for now)
* VLC
* Sublime text 3
* Some custom commands: 
  * Haste (type `haste [file]` in the CLI to post the contents of a file to hastebin)

It has been tested with a Ubuntu trusty64 box.

Requirements
------------

* Puppet
* Git
* Vagrant (for testing on VM)
* An ubuntu VM with puppet on it (for testing on VM )



Usage
-----

Clone this repository and run `git submodule init && git submodule update`, this will pull in the git submodules containing certain configurations (e.g. vimrc files). Run this command again in `/modules/zsh/files/zprezto` to pull in the prezto submodules.

Next, fill in the details for your configuration in manifests/site.pp, which should look something like this:

```
class { "puppetbox": 
  gitUser       => "Alan Smithee",
  gitEmail      => "Smithee@spam-me.com",
  mysqlRootPass => "niceTry",
}
```

If you want to check out the configuration in a VM first (recommended), get yourself an ubuntu box with puppet on it and create the following Vagrantfile in the root of your project (don't forget to put in your own box name and url - if you have the vm locally use `file://...` relative to the project root):

```
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = [box name]
  config.vm.box_url = [box url]
   config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = true
   end

   config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "site.pp"
     puppet.module_path = "modules"
   end
end
```
Omit the vb.gui line if you want to boot the box in headless mode. 

Then run `vagrant up` and keep your fingers crossed.
