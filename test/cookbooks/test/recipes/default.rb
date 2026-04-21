# frozen_string_literal: true

test_version = node['beyondcompare_test']['version'] || '4.4.7.28397'

beyondcompare_package 'default' do
  version test_version
end

beyondcompare_git_config 'default' do
  version test_version
end
