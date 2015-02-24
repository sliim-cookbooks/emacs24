# -*- coding: utf-8 -*-
#
# Cookbook Name:: emacs24
# Spec:: default
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

require_relative 'spec_helper'

describe 'emacs24::default' do
  context 'when emacs is not installed' do
    let(:subject) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
        node.set['emacs24']['force'] = false
        node.set['emacs24']['version'] = '24.4'
        node.set['emacs_version'] = ''
      end.converge described_recipe
    end

    it 'should compile emacs24' do
      expect(subject).to include_recipe('emacs24::compile')
    end
  end

  context 'when emacs is installed but not up to date' do
    let(:subject) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
        node.set['emacs24']['force'] = false
        node.set['emacs24']['version'] = '24.4'
        node.set['emacs_version'] = '24.3.1'
      end.converge described_recipe
    end

    it 'should compile emacs24' do
      expect(subject).to include_recipe('emacs24::compile')
    end
  end

  context 'when emacs is installed and up to date' do
    let(:subject) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
        node.set['emacs24']['force'] = false
        node.set['emacs24']['version'] = '24.4'
        node.set['emacs_version'] = '24.4.1'
      end.converge described_recipe
    end

    it 'should not compile emacs24' do
      expect(subject).to_not include_recipe('emacs24::compile')
    end
  end

  context 'when emacs is installed, up to date, and force option is enabled' do
    let(:subject) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
        node.set['emacs24']['force'] = true
        node.set['emacs24']['version'] = '24.4'
        node.set['emacs_version'] = '24.4.1'
      end.converge described_recipe
    end

    it 'should not compile emacs24' do
      expect(subject).to include_recipe('emacs24::compile')
    end
  end
end
