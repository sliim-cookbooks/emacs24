# Cookbook:: emacs24
# Attributes:: compile
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

default['emacs24']['build_dir'] = '/opt/emacs24'
default['emacs24']['flags'] = []
default['emacs24']['version'] = '24.4'
default['emacs24']['force'] = false
default['emacs24']['packages'] = value_for_platform_family(
  'debian' => %w(libtinfo-dev),
  'default' => %w())
