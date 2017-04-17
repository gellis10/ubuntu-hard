#
# Cookbook:: ubuntu-hard
# Recipe:: sshd
#
# Copyright:: 2017, The Authors, All Rights Reserved.

service 'ssh' do
  action :nothing
  supports :status => true, :start => true, :stop => true, :restart => true
end

template '/etc/ssh/sshd_config' do
  source 'sshd_config.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables({
    sshd_client_interval_seconds: node['sshd']['client_interval_seconds']
  })
  notifies :restart, 'service[ssh]'
end
