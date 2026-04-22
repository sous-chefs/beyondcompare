# frozen_string_literal: true

require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.log_level = :error
  ENV['ProgramFiles(x86)'] = 'C:\Program Files (x86)' # assume 64bit OS
  ENV['ProgramFiles'] = 'C:\Program Files'
  ENV['WINDIR'] = 'C:\Windows'
end
