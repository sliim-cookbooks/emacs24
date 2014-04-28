# encoding: utf-8
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

require 'spec_helper'

describe file('/opt/emacs') do
  it { should be_directory }
end

describe file('/opt/emacs/README') do
  it { should be_file }
end

describe file('/opt/emacs/src/emacs') do
  it { should be_file }
end

describe file('/usr/local/bin/emacs') do
  it { should be_file }
end
