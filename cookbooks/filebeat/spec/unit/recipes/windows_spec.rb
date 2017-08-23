# This File test's the chef recipe named install_filbeat_for_ubuntu
# Cookbook:: filebeat
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'chefspec'
describe 'filebeat::windows' do
	   let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'windows', version: 

'2012R2').converge(described_recipe) }

	it 'create a directory with default action' do
		expect(chef_run).to create_directory("#{ENV['SYSTEMDRIVE']}\\filebeat")
	end
	it 'create remote file with default action' do 
		expect(chef_run).to create_remote_file("#{ENV['SYSTEMDRIVE']}\\filebeat\\filebeat.zip")
	end
	
	it 'run powershell_script to install filebeat as service' do
      expect(chef_run).to run_powershell_script("#{ENV['SYSTEMDRIVE']}\\Program Files\\filebeat-5.4.3-windows-x86_64\\install-service-filebeat.ps1")
    end
	
	
	it 'creates a template with the default action' do
    	expect(chef_run).to create_template("#{ENV['SYSTEMDRIVE']}\\Program Files\\filebeat-5.4.3-windows-x86_64\\filebeat.yml")
	end
	
	 it 'starts a service when specifying the filebeat' do
    expect(chef_run).to start_service('filebeat')
  end
	 		
	it 'converges successfully' do
  	expect { chef_run }.to_not raise_error
	end
	end

