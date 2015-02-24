# -*- coding: utf-8 -*-
#
# Cookbook Name:: emacs24
# Spec:: compile
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

describe 'emacs24::compile' do
  context 'with default attributes' do
    let(:subject) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache')
        .converge described_recipe
    end

    it 'should includes recipes' do
      expect(subject).to include_recipe('apt')
      expect(subject).to include_recipe('build-essential')
    end

    it 'should create build directory' do
      expect(subject).to create_directory('/opt/emacs24')
        .with(recursive: true)
    end

    it 'should download emacs package' do
      expect(subject).to create_remote_file('/var/chef/cache/emacs.tar.gz')
        .with(source: 'http://ftp.gnu.org/gnu/emacs/emacs-24.4.tar.gz')
    end

    it 'should untar emacs package' do
      expect(subject).to run_execute('untar')
        .with(cwd: '/opt/emacs24',
              command: format('%s %s %s',
                              'tar',
                              '--strip-components 1 -xzf',
                              '/var/chef/cache/emacs.tar.gz'))
    end

    it 'should build emacs' do
      expect(subject).to run_execute('configure and make')
        .with(cwd: '/opt/emacs24',
              command: './configure && make')

      expect(subject).to run_execute('make install')
        .with(cwd: '/opt/emacs24',
              command: 'make install')
    end
  end

  context 'with overriden attributes' do
    let(:subject) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
        node.set['emacs24']['build_dir'] = '/opt/emacs-build'
        node.set['emacs24']['version'] = '24.4'
        node.set['emacs24']['packages'] = ['libtinfo-dev']
        node.set['emacs24']['flags'] = ['--with-x-toolkit=no', '--with-jpeg=no']
      end.converge described_recipe
    end

    it 'should install libtinfo-dev package' do
      expect(subject).to install_package('libtinfo-dev')
    end

    it 'should create correct build directory' do
      expect(subject).to create_directory('/opt/emacs-build')
        .with(recursive: true)
    end

    it 'should download emacs package with correct version' do
      expect(subject).to create_remote_file('/var/chef/cache/emacs.tar.gz')
        .with(source: 'http://ftp.gnu.org/gnu/emacs/emacs-24.4.tar.gz')
    end

    it 'should untar emacs package in correct build directory' do
      expect(subject).to run_execute('untar')
        .with(cwd: '/opt/emacs-build',
              command: format('%s %s %s',
                              'tar',
                              '--strip-components 1 -xzf',
                              '/var/chef/cache/emacs.tar.gz'))
    end

    it 'should build emacs in correct build directory' do
      expect(subject).to run_execute('configure and make')
        .with(cwd: '/opt/emacs-build',
              command: './configure --with-x-toolkit=no --with-jpeg=no&& make')

      expect(subject).to run_execute('make install')
        .with(cwd: '/opt/emacs-build',
              command: 'make install')
    end
  end
end
