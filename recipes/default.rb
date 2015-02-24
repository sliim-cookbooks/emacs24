# -*- coding: utf-8 -*-
#
# Cookbook Name:: emacs24
# Recipe:: default
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'ohai'

installed = Gem::Version.new(node['emacs_version']) >=
            Gem::Version.new(node['emacs24']['version'])
include_recipe 'emacs24::compile' if !installed || node['emacs24']['force']
