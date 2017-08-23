# # encoding: utf-8

# Inspec test for recipe filebeat_cookbook_v3::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('filebeat') do
	it { should be_installed }
end
