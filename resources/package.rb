# frozen_string_literal: true

provides :beyondcompare_package
unified_mode true

include Beyondcompare::Helpers

use '_partial/_bcompare_paths'

property :package_name,
         String,
         default: lazy { default_package_name(version) },
         description: 'Display name used by Windows Installer.'

property :source,
         String,
         default: lazy { default_source(version) },
         desired_state: false,
         description: 'Installer URL for the Beyond Compare EXE.'

property :checksum,
         String,
         desired_state: false,
         description: 'Optional SHA256 checksum for the installer.'

property :install_options,
         [String, Array],
         default: lazy { default_install_options(version) },
         coerce: proc { |value| Array(value) },
         desired_state: false,
         description: 'Silent install options passed to the Inno Setup installer.'

property :uninstall_options,
         [String, Array],
         default: %w(/VERYSILENT /NORESTART /SUPPRESSMSGBOXES),
         coerce: proc { |value| Array(value) },
         desired_state: false,
         description: 'Silent uninstall options passed to the Inno Setup uninstaller.'

default_action :install

action_class do
  include Beyondcompare::Helpers
end

action :install do
  windows_package new_resource.package_name do
    source new_resource.source
    checksum new_resource.checksum if new_resource.checksum
    installer_type :inno
    options new_resource.install_options.join(' ')
    action :install
  end
end

action :remove do
  windows_package new_resource.package_name do
    installer_type :inno
    options new_resource.uninstall_options.join(' ')
    action :remove
  end
end
