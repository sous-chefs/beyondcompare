Vagrant.configure('2') do |config|
  config.vm.box = 'daptiv/windows2012r2_chef11'
  config.vm.communicator = :winrm
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'beyondcompare'
    chef.add_recipe 'minitest-handler'
    chef.file_cache_path = 'c:/var/chef/cache' # Need leading drive letter
    chef.json = {
      "beyondcompare" => {
        "base_url" => 'http://vagrantboxes.hq.daptiv.com/installs/cookbookresources'
      }
    }
  end
end
