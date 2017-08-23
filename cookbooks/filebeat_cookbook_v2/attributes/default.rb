default['filebeat_cookbook_v2']['filebeat_directory'] = '/filebeat'
default['filebeat_cookbook_v2']['remote_directory'] = "#{default['filebeat_cookbook_v2']['filebeat_directory']}/filebeat-5.4.3-amd64.deb"
default['filebeat_cookbook_v2']['download_url'] = 'https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.4.3-amd64.deb'
default['filebeat_cookbook_v2']['filebeat_source_directory'] = "#{default['filebeat_cookbook_v2']['filebeat_directory']}/filebeat-5.4.3-amd64.deb"
default['filebeat_cookbook_v2']['template_replace_directory'] = '/etc/filebeat/filebeat.yml'
default['filebeat_cookbook_v2']['template_source'] = 'filebeat.yml.erb'

default['filebeat_cookbook_v2']['source_log_directory'] = '/root/.chef/local-mode-cache/cache/*.out'
default['filebeat_cookbook_v2']['elasticsearch_endpoint_url'] = 'http://dev-elasticsearch.oski.tavisca.com:9200'
default['filebeat_cookbook_v2']['elasticsearch_index'] = 'kitchen_filebeat-logs'
