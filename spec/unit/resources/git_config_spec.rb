# frozen_string_literal: true

require 'spec_helper'

describe 'beyondcompare_git_config' do
  step_into :beyondcompare_git_config
  platform 'windows', '2019'

  let(:git_exe) { 'C:\\Program Files\\Git\\cmd\\git.exe' }
  let(:bcompare_exe) { 'C:\\Program Files\\Beyond Compare 4\\BCompare.exe' }

  before do
    allow(::File).to receive(:exist?).and_call_original
    allow(::File).to receive(:exist?).with(git_exe).and_return(true)
    allow(::File).to receive(:exist?).with('C:\\Program Files\\Git\\bin\\git.exe').and_return(false)
  end

  context 'with default properties' do
    recipe do
      beyondcompare_git_config 'default'
    end

    it 'configures push.default' do
      expect(chef_run.execute('configure default push.default').command).to eq(
        "\"#{git_exe}\" config --global push.default \"simple\""
      )
    end

    it 'configures core.autocrlf' do
      expect(chef_run.execute('configure default core.autocrlf').command).to eq(
        "\"#{git_exe}\" config --global core.autocrlf \"true\""
      )
    end

    it 'configures merge.tool' do
      expect(chef_run.execute('configure default merge.tool').command).to eq(
        "\"#{git_exe}\" config --global merge.tool \"bc\""
      )
    end

    it 'configures mergetool.bc.path' do
      expect(chef_run.execute('configure default mergetool.bc.path').command).to eq(
        "\"#{git_exe}\" config --global mergetool.bc.path \"#{bcompare_exe}\""
      )
    end

    it 'configures diff.tool' do
      expect(chef_run.execute('configure default diff.tool').command).to eq(
        "\"#{git_exe}\" config --global diff.tool \"bc\""
      )
    end

    it 'configures difftool.bc.path' do
      expect(chef_run.execute('configure default difftool.bc.path').command).to eq(
        "\"#{git_exe}\" config --global difftool.bc.path \"#{bcompare_exe}\""
      )
    end
  end

  context 'with action :remove' do
    before do
      %w(
        push.default
        core.autocrlf
        difftool.prompt
        merge.tool
        mergetool.bc.path
        diff.tool
        difftool.bc.path
      ).each do |key|
        stub_command("\"#{git_exe}\" config --global --get-all #{key}").and_return(true)
      end
    end

    recipe do
      beyondcompare_git_config 'default' do
        action :remove
      end
    end

    it 'removes difftool.bc.path' do
      expect(chef_run.execute('remove default difftool.bc.path').command).to eq(
        "\"#{git_exe}\" config --global --unset-all difftool.bc.path"
      )
    end

    it 'removes merge.tool' do
      expect(chef_run.execute('remove default merge.tool').command).to eq(
        "\"#{git_exe}\" config --global --unset-all merge.tool"
      )
    end

    it 'removes push.default' do
      expect(chef_run.execute('remove default push.default').command).to eq(
        "\"#{git_exe}\" config --global --unset-all push.default"
      )
    end
  end

  context 'when legacy defaults are disabled' do
    recipe do
      beyondcompare_git_config 'default' do
        manage_legacy_defaults false
      end
    end

    it 'does not manage push.default' do
      expect(chef_run.resource_collection).to_not include('execute[configure default push.default]')
    end

    it 'does not manage core.autocrlf' do
      expect(chef_run.resource_collection).to_not include('execute[configure default core.autocrlf]')
    end

    it 'still manages merge.tool' do
      expect(chef_run.execute('configure default merge.tool').command).to eq(
        "\"#{git_exe}\" config --global merge.tool \"bc\""
      )
    end
  end
end
