# -*- coding: utf-8 -*-
#
# Cookbook Name:: emacs24
# Recipe:: compile
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

include_recipe 'apt'
include_recipe 'build-essential'

node['emacs24']['packages'].each do |pkg|
  package pkg
end

remotefile = 'http://ftp.gnu.org/gnu/emacs/emacs-'\
             "#{node['emacs24']['version']}.tar.gz"
localfile = "#{Chef::Config[:file_cache_path]}/emacs.tar.gz"

remote_file localfile do
  source remotefile
end

directory node['emacs24']['build_dir'] do
  recursive true
end

execute 'untar' do
  cwd node['emacs24']['build_dir']
  command "tar --strip-components 1 -xzf #{localfile}"
end

execute 'configure and make' do
  cwd node['emacs24']['build_dir']
  command "./configure #{node['emacs24']['flags'].join(' ')}&& make"
end

execute 'make install' do
  cwd node['emacs24']['build_dir']
  command 'make install'
end
