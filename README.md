emacs24 Cookbook
================
Download and install GNU Emacs 24.4 from source.  
[![Cookbook Version](https://img.shields.io/cookbook/v/emacs24.svg)](https://community.opscode.com/cookbooks/emacs24) [![Build Status](https://travis-ci.org/sliim-cookbooks/emacs24.svg?branch=master)](https://travis-ci.org/sliim-cookbooks/emacs24) 

Requirements
------------
#### Cookbooks
- `apt` - `https://supermarket.chef.io/cookbooks/apt`
- `build-essential` - `https://supermarket.chef.io/cookbooks/build-essential`
- `ohai` - `https://supermarket.chef.io/cookbooks/ohai`

#### Platforms
The following platforms and versions are tested and supported using Opscode's test-kitchen.
- Debian 7
- Ubuntu 12.04
- Ubuntu 14.04

Attributes
----------
#### emacs24::compile
<table>
<tr>
<th>Key</th>
<th>Type</th>
<th>Description</th>
<th>Default</th>
</tr>
<tr>
<td><tt>['emacs24']['build_dir']</tt></td>
<td>String</td>
<td>Where emacs archive will be extracted and builded</td>
<td><tt>/opt/emacs24</tt></td>
</tr>
<tr>
<td><tt>['emacs24']['flags']</tt></td>
<td>Array</td>
<td>List of flags passed to configure script</td>
<td><tt>[]</tt></td>
</tr>
<tr>
<td><tt>['emacs24']['version']</tt></td>
<td>String</td>
<td>Emacs version to install</td>
<td><tt>24.4</tt></td>
</tr>
<tr>
<td><tt>['emacs24']['packages']</tt></td>
<td>Array</td>
<td>Packages to install</td>
<td><tt><i>Platform-dependent</i></tt></td>
</tr>
<tr>
<td><tt>['emacs24']['force']</tt></td>
<td>Boolean</td>
<td>Force reinstall if build directory exists</td>
<td><tt>false</tt></td>
</tr>
</table>

Usage
-----
#### emacs24::default
Just include `emacs24` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[emacs24]"
  ]
}
```

#### emacs24::compile
You can also use the `emacs24::compile` recipe instead the default.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[emacs24::compile]"
  ]
}
```
This is equivalent to use `emacs24::default` with `force` attribute.

#### Tests

- First, install dependencies:  
`bundle install`

- Run Checkstyle and ChefSpec:  
`bundle exec rake`

- Run Kitchen tests:  
`bundle exec rake kitchen`  

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Sliim <sliim@mailoo.org> 

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
