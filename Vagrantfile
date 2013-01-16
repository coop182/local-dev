require 'erb'

Vagrant::Config.run do |config|

  config.vm.box = "devbox"
  config.vm.box_url = "https://github.com/downloads/roderik/VagrantQuantal64Box/quantal64.box"

  config.vm.network :hostonly, "192.168.33.10"

  #config.vm.network :bridged

  #config.vm.boot_mode = :gui

  config.vm.forward_port 80, 8080
  config.vm.forward_port 3000, 3000

  #config.vm.customize ["modifyvm", :id, "--memory", 1024]

  # Enable provisioning through a shell script.
  config.vm.provision :shell do |shell|
    relative     = ''
    script       = 'provision.sh'
    shell.inline = ERB.new("<% def import(file); File.read('#{relative}' + file); end %>" + File.read("#{relative}#{script}")).result
  end

end
