#
# Cookbook Name:: filebeat
# Recipe:: install_filebeat_for_ubuntu
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#Creates Directory
directory  node['filebeat']['ubuntu']['base_dir'] do
action :create
not_if {::File.exist?(node['filebeat']['ubuntu']['base_dir'])}
end

#download Filebeat from Source
remote_file node['filebeat']['ubuntu']['download_package'] do
source node['filebeat']['ubuntu']['source_url']
action :create
not_if {::File.exist?(node['filebeat']['ubuntu']['download_package'])}
end

#installs filebeat
dpkg_package 'filebeat' do
source node['filebeat']['ubuntu']['download_package']
action :install
not_if {::File.exist?(node['filebeat']['ubuntu']['source_dir'])}
end

#replace filebeat.yml file
template node['filebeat']['ubuntu']['source_dir']+'/filebeat.yml' do
source 'filebeat.yml.erb'
variables({
	source : node['filebeat']['ubuntu']['log_file_source']
})
end

#Starts Filebeat Service
service 'filebeat' do
start_command 'sudo /etc/init.d/ ./filebeat start'
action :start
end
