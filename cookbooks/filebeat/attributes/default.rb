current_dir = File.dirname(__FILE__)
CurrentDate =  DateTime.now
#Filebeat Default Version
default['filebeat']['version']= "5.4.3"
#Default windows filebeat source url 
default['filebeat']['windows']['source_url'] = "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-#{node['filebeat']['version']}-windows-x86_64.zip"
#Default windows base directory
default['filebeat']['windows']['base_dir'] = "#{ENV['SYSTEMDRIVE']}"
#default windows source directory 
default['filebeat']['windows']['source_dir'] = "#{node['filebeat']['windows']['base_dir']}\\Program Files"
#Default windows base directory to download filebeat 
default['filebeat']['windows']['download_package_dir'] = "#{node['filebeat']['windows']['base_dir']}\\filebeat"
#default directory log file path 
default['filebeat']['windows']['log_file_source']	= "#{current_dir}\\local-mode-cache\\cache\\chef-stacktrace.out"
#default ubuntu base directory
default['filebeat']['ubuntu']['base_dir'] = '\filebeat'
#Default ubuntu download package directory
default['filebeat']['ubuntu']['download_package'] = "#{node['filebeat']['ubuntu']['base_dir']}\\filebeat-#{node['filebeat']['version']}-amd64.deb"
#Default ubuntu source directory
default['filebeat']['ubuntu']['source_dir'] = '/etc/filebeat'
#Default ubuntu source url
default['filebeat']['ubuntu']['source_url'] = "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-#{node['filebeat']['version']}-amd64.deb"
#Default ubuntu log file source
default['filebeat']['ubuntu']['log_file_source'] = '/root/.chef/local-mode-cache/cache/*.out'
#Default Elastic Search endpoint
default['filebeat']['elasticsearch']['endpoint'] 	='http://dev-elasticsearch.oski.tavisca.com:9200'
#Default Elastic Search Index
default['filebeat']['elasticsearch']['index']  = "filebeat_logs[#{CurrentDate.year} - #{CurrentDate.month} - #{CurrentDate.day} ]"

