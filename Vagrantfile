# number of master nodes
MASTERS = ENV.has_key?('OKD_MASTERS') ? ENV['OKD_MASTERS'].to_i - 1 : 2
# number of infrastructure nodes
INFRAS = ENV.has_key?('OKD_INFRAS') ? ENV['OKD_INFRAS'].to_i - 1 : 2
# number of compute nodes
NODES = ENV.has_key?('OKD_NODES') ? ENV['OKD_NODES'].to_i - 1 : 2
# number of 'data' disks for infrastructure nodes
DISKS_N = ENV.has_key?('OKD_EXTRA_DISKS_NUMBER') ? ENV['OKD_EXTRA_DISKS_NUMBER'].to_i : 3
# size of each disk
DISKS_S = ENV.has_key?('OKD_EXTRA_DISKS_SIZE') ? ENV['OKD_EXTRA_DISKS_SIZE'] : '150G'


Vagrant.configure("2") do |config|

  tld = 'okd.local'
  config.vm.box = 'fedora/29-cloud-base'
  config.vm.provision 'shell', path: 'provisioning/public-key.sh', privileged: false
  config.vm.provider :libvirt do |lv|
    lv.memory = 6144
  end

  config.vm.define 'deploy', primary: true do |box|
    box.vm.provider :libvirt do |lv|
      lv.memory = 2048
    end
    box.vm.hostname = 'deploy.' + tld
    box.vm.provision 'shell', path: 'provisioning/deploy/private-key.sh', privileged: false
    box.vm.provision 'shell', path: 'provisioning/deploy/packages.sh'
    box.vm.provision 'shell', path: 'provisioning/deploy/clone.sh', privileged: false
    box.vm.provision 'shell', path: 'provisioning/deploy/inventory.sh', privileged: false
  end

  config.vm.define 'proxy' do |box|
    box.vm.hostname = 'proxy.' + tld
    box.vm.provider :libvirt do |lv|
      lv.memory = 2048
    end
  end

  (0..MASTERS).each do |i|
    box_name = 'master-' + i.to_s
    config.vm.define box_name do |box|
      box.vm.hostname = box_name + '.' + tld
    end
  end

  (0..INFRAS).each do |i|
    box_name = 'infra-' + i.to_s
    config.vm.define box_name do |box|
      box.vm.hostname = box_name + '.' + tld
      box.vm.provider :libvirt do |lv|
        DISKS_N.to_i.times do
          lv.storage :file, :size => DISKS_S
        end
      end
    end
  end

  (0..NODES).each do |i|
    box_name = 'node-' + i.to_s
    config.vm.define box_name do |box|
      box.vm.hostname = box_name + '.' + tld
    end
  end

end
