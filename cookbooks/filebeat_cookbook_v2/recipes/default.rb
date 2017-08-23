# #created by nikhil chabukswar
# Cookbook:: filebeat_cookbook_v2
# Recipe:: default
# this is recipe to download and run filebeat
# Copyright:: 2017, The Authors, All Rights Reserved.

directory node['filebeat_cookbook_v2']['filebeat_directory'] do
	action :create
end
remote_file node['filebeat_cookbook_v2']['remote_directory'] do
		source node['filebeat_cookbook_v2']['download_url']
		action :create
end

dpkg_package 'filebeat' do
		source  node['filebeat_cookbook_v2']['filebeat_source_directory']
		action :install
end

template node['filebeat_cookbook_v2']['template_replace_directory'] do
		source node['filebeat_cookbook_v2']['template_source']
		variables({
				source: node['filebeat_cookbook_v2']['source_log_directory'],
				sink: node['filebeat_cookbook_v2']['elasticsearch_endpoint_url'],
				index: node['filebeat_cookbook_v2']['elasticsearch_index']
			})
end

service 'filebeat' do
		start_command 'sudo /etc/init.d/./filebeat restart'	
		action :restart
end
