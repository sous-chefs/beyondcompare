#
# Author:: Shawn Neal (<sneal@sneal.net>)
# Cookbook:: beyondcompare
# Recipe:: install
#
# Copyright:: Copyright (c) 2013 Daptiv Solutions LLC.
# Copyright:: Copyright (c) 2016 Shawn Neal
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

url = ::File.join(node['beyondcompare']['source'], "BCompare-#{node['beyondcompare']['version']}.exe")
windows_package node['beyondcompare']['package_name'] do
  source url
  checksum node['beyondcompare']['checksum']
  installer_type :inno
  action :install
end
