#
# Cookbook:: filebeat_cookbook_v2
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'chefspec'
describe 'filebeat_cookbook_v2::default' do
	  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

	it 'create a directory with default action' do
		expect(chef_run).to create_directory('/filebeat')
	end
			
	it 'install a dpkg_package with the default action' do
		expect(chef_run).to install_dpkg_package('filebeat')
	end

	it 'create remote file with default action' do 
		expect(chef_run).to create_remote_file('/filebeat/filebeat-5.4.3-amd64.deb')
	end

	it 'restart a service with an explicit action' do
		expect(chef_run).to restart_service('filebeat')
	end


end
