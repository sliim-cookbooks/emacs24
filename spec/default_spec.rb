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
  context 'when build directory is not present' do
    let(:subject) do
      ChefSpec::Runner.new do |node|
        node.set['emacs24']['force'] = false
        node.set['emacs24']['build_dir'] = '/tmp/emacs'
      end.converge described_recipe
    end

    it 'does compile emacs24' do
      allow(File).to receive(:directory?).and_call_original
      allow(File).to receive(:directory?).with('/tmp/emacs')
        .and_return(false)
      expect(subject).to include_recipe('emacs24::compile')
    end
  end

  context 'with emacs already installed and don\'t force compilation' do
    let(:subject) do
      ChefSpec::Runner.new do |node|
        node.set['emacs24']['force'] = false
        node.set['emacs24']['build_dir'] = '/tmp/emacs'
      end.converge described_recipe
    end

    it 'does not compile emacs24' do
      allow(File).to receive(:directory?).and_call_original
      allow(File).to receive(:directory?).with('/tmp/emacs')
        .and_return(true)
      expect(subject).to_not include_recipe('emacs24::compile')
    end
  end

  context 'with emacs already installed and force compilation' do
    let(:subject) do
      ChefSpec::Runner.new do |node|
        node.set['emacs24']['force'] = true
        node.set['emacs24']['build_dir'] = '/tmp/emacs'
      end.converge described_recipe
    end

    it 'does compile emacs24' do
      allow(File).to receive(:directory?).and_call_original
      allow(File).to receive(:directory?).with('/tmp/emacs')
        .and_return(true)
      expect(subject).to include_recipe('emacs24::compile')
    end
  end
end
