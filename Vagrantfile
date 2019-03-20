Vagrant.configure("2") do |config|
  config.landrush.enabled = true
  config.landrush.tld = 'okd.one'
  config.vm.box = 'centos/atomic-host'
  config.vm.provision 'shell',
    inline: "echo search #{config.landrush.tld} >> /etc/resolv.conf"
  config.vm.define 'installer' do |installer|
    installer.vm.hostname = 'installer.okd.one'
  end
  [ 'master', 'node' ].each do |box_type|
    (0..2).each do |box_index|
      box_name = box_type + '-' + box_index.to_s
      config.vm.define box_name do |box|
        box.vm.hostname = box_name + '.' + config.landrush.tld
      end
    end
  end
end
