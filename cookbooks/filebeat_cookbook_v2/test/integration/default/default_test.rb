# # encoding: utf-8

# Inspec test for recipe filebeat_cookbook_v2::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

title 'filebeat should be installed'
describe package('filebeat') do
	it { should be_installed }
end

title 'filebeat should up and running'
describe service('filebeat') do	
	it { should be_running }
end
