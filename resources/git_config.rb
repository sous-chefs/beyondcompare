# frozen_string_literal: true

provides :beyondcompare_git_config
unified_mode true

include Beyondcompare::Helpers

use '_partial/_bcompare_paths'

property :git_exe,
         String,
         default: lazy { default_git_exe },
         desired_state: false,
         description: 'Full path to git.exe.'

property :scope,
         Symbol,
         equal_to: %i(global system),
         default: :global,
         desired_state: false,
         description: 'Git configuration scope.'

property :manage_legacy_defaults,
         [true, false],
         default: true,
         desired_state: false,
         description: 'Whether to manage the legacy push.default and core.autocrlf settings.'

default_action :configure

action_class do
  include Beyondcompare::Helpers

  def git_settings
    settings = []

    if new_resource.manage_legacy_defaults
      settings << ['push.default', 'simple']
      settings << ['core.autocrlf', 'true']
    end

    settings << ['difftool.prompt', 'false']
    settings << ['merge.tool', 'bc']
    settings << ['mergetool.bc.path', new_resource.bcompare_exe]
    settings << ['diff.tool', 'bc']
    settings << ['difftool.bc.path', new_resource.bcompare_exe]
    settings
  end
end

action :configure do
  git_settings.each do |key, value|
    execute "configure #{new_resource.name} #{key}" do
      command git_config_command(new_resource.git_exe, new_resource.scope, key, value)
      only_if { ::File.exist?(new_resource.git_exe) }
    end
  end
end

action :remove do
  git_settings.reverse_each do |key, _value|
    execute "remove #{new_resource.name} #{key}" do
      command git_config_unset_command(new_resource.git_exe, new_resource.scope, key)
      only_if { ::File.exist?(new_resource.git_exe) }
      only_if git_config_get_command(new_resource.git_exe, new_resource.scope, key)
    end
  end
end
