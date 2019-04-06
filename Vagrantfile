Vagrant.configure("2") do |config|

  config.landrush.enabled = true
  config.landrush.tld = 'okd.one'
  config.landrush.upstream '127.0.0.53'

  config.vm.box = 'fedora/29-atomic-host'
  config.vm.provision 'shell',
    inline: "echo search #{config.landrush.tld} >> /etc/resolv.conf"

  config.vm.define 'installer', primary: true do |installer|
    installer.vm.provider :libvirt do |lv|
      lv.memory = 1024
    end
    installer.vm.box = 'centos/7'
    installer.vm.hostname = 'installer.okd.one'
    installer.vm.provision 'shell', path: 'scripts/set-private-ssh-key.sh'
    installer.vm.provision 'shell', path: 'scripts/installer-origin.sh'
  end

  config.vm.define 'master', primary: true do |master|
    master.vm.hostname = 'master.okd.one'
    master.vm.provision 'shell',
      path: 'scripts/set-authorized-ssh-key.sh'
  end

[ 'infra', 'node' ].each do |box_type|
    (0..1).each do |box_index|
      box_name = box_type + '-' + box_index.to_s
      config.vm.define box_name do |box|
        box.vm.hostname = box_name + '.' + config.landrush.tld
        box.vm.provision 'shell',
          path: 'scripts/set-authorized-ssh-key.sh'
      end
    end
  end
end
