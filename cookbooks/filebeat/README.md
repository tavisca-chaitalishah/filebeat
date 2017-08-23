filebeat Cookbook
================

This is a [Chef] cookbook to manage [Filebeat].

## Most Recent Release

```ruby
cookbook 'filebeat', '~> 0.1.0'
```

## Supported OS

This cookbook was tested on Windows & Ubuntu platforms.


## Cookbook Dependency

- zipfile


## Recipes

- `filebeat::attributes` - cookbook derived default attributes

- `filebeat::default` - default recipe (use to select platform)

- `filebeat::install_filebeat_for_ubuntu` - install filebeat package for ubuntu platform

- `filebeat::install__filebeat_for_windows` - install filebeat for windows platform


## How to Add Filebeat Node Attribute

```json
{
	"name": "Environment To Run",
	"override_attributes": {
		"filebeat": {
			"version": 5.4.3,
			"elasticsearch":{ 
			"endpoint": End Point Of elasticsearch,
			"index": filebeat_log
			}
			"windows":{
			"base_dir": "D:",
			"source_dir": 'C:\Program Files'
			"log_file_source": Log Files Source
			},
			"ubuntu":{
			"base_dir": "\filebeat",
			"source_dir": '/etc/filebeat'
			"log_file_source": Log Files Source
			}
		}
	},
	"description": "This file override the attributes  in Stage Environment"
}


## Copyright & License

Authors:: Tavisca Solutions Ltd

<pre>
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</pre>


[Chef]: https://www.chef.io/
