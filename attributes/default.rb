#
# Author:: Shawn Neal (<sneal@sneal.net>)
# Cookbook:: beyondcompare
# Attribute:: default
#
# Copyright:: 2016, Shawn Neal
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['beyondcompare']['version'] = '4.2.9.23626'
default['beyondcompare']['source'] = 'http://www.scootersoftware.com/'

default['beyondcompare']['package_name'] = 'Beyond Compare 4.2.9'
default['beyondcompare']['checksum'] = '366e78cb7ffd536fbc4a42dbecb094a41a008f30439c95e760710f0ec7b1f300'

default['beyondcompare']['bcompare_exe'] =
  ::File.join(ENV['ProgramFiles'] || 'C:\Program Files', 'Beyond Compare 4', 'BCompare.exe')

default['beyondcompare']['git_exe'] =
  ::File.join(ENV['ProgramFiles'] || 'C:\Program Files', 'Git', 'bin', 'git.exe')
