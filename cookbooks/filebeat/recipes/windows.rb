#
# Cookbook Name:: filebeat
# Recipe:: install_filebeat_for_windows
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#creates a directory filebeat to download zip file 
directory node['filebeat']['windows']['download_package_dir'] do
action :create
not_if {::File.exist?(node['filebeat']['windows']['download_package_dir'])}
end

download_filebeat_package = "#{node['filebeat']['windows']['download_package_dir']}\\filebeat.zip"
#download Remote File of filebeat
remote_file download_filebeat_package do
source node['filebeat']['windows']['source_url']
action :create
not_if {::File.exist?(download_filebeat_package)}
end

#unzip the file 
zipfile download_filebeat_package do
into node['filebeat']['windows']['source_dir']
not_if {::File.exist?("#{node['filebeat']['windows']['source_dir']}\\filebeat-#{node['filebeat']['version']}-windows-x86_64")}
end

#install filebeat Service
powershell_script 'install-service-filebeat' do
command "#{node['filebeat']['windows']['source_dir']}\\filebeat-#{node['filebeat']['version']}-windows-x86_64\\install-service-filebeat.ps1"
end

#Template to Replace
template "#{node['filebeat']['windows']['source_dir']}\\filebeat-#{node['filebeat']['version']}-windows-x86_64\\filebeat.yml" do
source 'filebeat.yml.erb'
variables ({
	source: node['filebeat']['windows']['log_file_source']
})
force_unlink true
end

#Start Service
service 'filebeat' do  
  action :start
end
