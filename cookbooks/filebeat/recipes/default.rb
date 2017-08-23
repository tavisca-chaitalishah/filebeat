#
# Cookbook Name:: filebeat
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#install filebeat depending on platform
case node['platform']
when 'windows'
include_recipe 'filebeat::windows'
when 'ubuntu'
include_recipe 'filebeat::ubuntu'
end