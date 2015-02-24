# -*- coding: utf-8 -*-
#
# Cookbook Name:: emacs24
# Ohai Plugin:: emacs
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

Ohai.plugin(:Emacs) do
  provides 'emacs_version'
  collect_data do
    installed = shell_out('emacs --version').stdout[/GNU Emacs ([0-9\.]*)\n/, 1]
    Chef::Log.info("Current Emacs version: #{installed}")
    emacs_version installed
  end
end
