# frozen_string_literal: true

module Beyondcompare
  module Helpers
    def display_version(version)
      version.to_s.split('.')[0, 3].join('.')
    end

    def major_version(version)
      version.to_s.split('.').first
    end

    def program_files_dir
      ENV['ProgramFiles'] || 'C:\\Program Files'
    end

    def windows_path(*parts)
      parts.join('\\').gsub(/\\+/, '\\')
    end

    def default_install_dir(version)
      windows_path(program_files_dir, "Beyond Compare #{major_version(version)}")
    end

    def default_bcompare_exe(version)
      windows_path(default_install_dir(version), 'BCompare.exe')
    end

    def default_package_name(version)
      "Beyond Compare #{display_version(version)}"
    end

    def default_source(version)
      "https://www.scootersoftware.com/files/BCompare-#{version}.exe"
    end

    def default_install_options(version)
      if major_version(version).to_i >= 5
        %w(/VERYSILENT /NORESTART /ALLUSERS /DISABLEUPDATES /SUPPRESSMSGBOXES)
      else
        %w(/SP- /VERYSILENT /NORESTART /SUPPRESSMSGBOXES)
      end
    end

    def default_git_exe
      candidates = [
        windows_path(program_files_dir, 'Git', 'cmd', 'git.exe'),
        windows_path(program_files_dir, 'Git', 'bin', 'git.exe'),
      ]

      candidates.find { |path| ::File.exist?(path) } || candidates.first
    end

    def git_scope_flag(scope)
      "--#{scope}"
    end

    def quote_for_shell(value)
      %("#{value}")
    end

    def git_config_command(git_exe, scope, key, value)
      [
        quote_for_shell(git_exe),
        'config',
        git_scope_flag(scope),
        key,
        quote_for_shell(value),
      ].join(' ')
    end

    def git_config_get_command(git_exe, scope, key)
      [
        quote_for_shell(git_exe),
        'config',
        git_scope_flag(scope),
        '--get-all',
        key,
      ].join(' ')
    end

    def git_config_unset_command(git_exe, scope, key)
      [
        quote_for_shell(git_exe),
        'config',
        git_scope_flag(scope),
        '--unset-all',
        key,
      ].join(' ')
    end
  end
end
