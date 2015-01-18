VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "vagrant-trusty64"
  config.vm.box_url = "file:///VM/trusty64.box"
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

