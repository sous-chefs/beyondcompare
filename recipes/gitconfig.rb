#
# Author:: Shawn Neal (<sneal@daptiv.com>)
# Cookbook Name:: beyondcompare
# Recipe:: gitconfig
#
# Copyright:: Copyright (c) 2013 Daptiv Solutions LLC.
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

git_exe = node['beyondcompare']['git_exe']
bc3_exe = node['beyondcompare']['bcompare_exe']

git_config_cmds = [
  "\"#{git_exe}\" config --global push.default simple",
  "\"#{git_exe}\" config --global core.autocrlf true",
  "\"#{git_exe}\" config --global difftool.prompt false",
  "\"#{git_exe}\" config --global merge.tool bc3",
  "\"#{git_exe}\" config --global mergetool.bc3.path \"#{bc3_exe}\"",
  "\"#{git_exe}\" config --global diff.tool bc3",
  "\"#{git_exe}\" config --global difftool.bc3.path \"#{bc3_exe}\""
]

git_config_cmds.each do |cmd|
  execute "configure_git_#{cmd}" do
    command cmd
    only_if { File.exist?(git_exe) }
  end
end
