# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos6.5"

  config.vm.hostname = "wildfly"

  config.vm.network :forwarded_port, guest: 8080, host: 18080
  config.vm.network :forwarded_port, guest: 9990, host: 19990

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus",   "2"]
  end

  config.vm.provision "chef_solo" do |chef|
    chef.json = {
      :java => {
        # OpenJDK7
#        :install_flavor => "openjdk",
#        :jdk_version    => "7",

        # Oracle Java7
#        :install_flavor => "oracle",
#        :jdk_version    => "7",
#        :oracle         => {:accept_oracle_download_terms => true}

        # Oracle Java8
        :install_flavor => "oracle",
        :jdk_version    => "8",
        :oracle         => {:accept_oracle_download_terms => true}
      }
    }

    chef.run_list = [
                     "recipe[base]",
                     "recipe[java]",
                     "recipe[wildfly]"
                    ]
  end

  # vagrant-berkshelf
  config.berkshelf.enabled = true

  # vagrant-omnibus
  config.omnibus.chef_version = "11.12.8"
end
