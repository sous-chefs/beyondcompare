# frozen_string_literal: true

require_relative '../../spec_helper'

control 'beyondcompare-package-01' do
  impact 1.0
  title 'Beyond Compare is installed'

  describe file(beyondcompare_exe) do
    it { should exist }
  end
end

control 'beyondcompare-git-config-01' do
  impact 1.0
  title 'Git is configured to use Beyond Compare'

  describe file(git_exe) do
    it { should exist }
  end

  describe git_config('push.default') do
    its('stdout.strip') { should eq 'simple' }
  end

  describe git_config('core.autocrlf') do
    its('stdout.strip') { should eq 'true' }
  end

  describe git_config('merge.tool') do
    its('stdout.strip') { should eq 'bc' }
  end

  describe git_config('diff.tool') do
    its('stdout.strip') { should eq 'bc' }
  end

  describe git_config('mergetool.bc.path') do
    its('stdout.strip') { should eq beyondcompare_exe }
  end

  describe git_config('difftool.bc.path') do
    its('stdout.strip') { should eq beyondcompare_exe }
  end
end
