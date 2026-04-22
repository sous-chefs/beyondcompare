# frozen_string_literal: true

require 'spec_helper'

describe 'beyondcompare_package' do
  step_into :beyondcompare_package
  platform 'windows', '2019'

  context 'with default properties' do
    recipe do
      beyondcompare_package 'default'
    end

    it do
      is_expected.to install_windows_package('Beyond Compare 4.4.7').with(
        source: 'https://www.scootersoftware.com/files/BCompare-4.4.7.28397.exe',
        installer_type: :inno,
        options: '/SP- /VERYSILENT /NORESTART /SUPPRESSMSGBOXES'
      )
    end
  end

  context 'with a Beyond Compare 5 install' do
    recipe do
      beyondcompare_package 'default' do
        version '5.2.1.32035'
      end
    end

    it do
      is_expected.to install_windows_package('Beyond Compare 5.2.1').with(
        source: 'https://www.scootersoftware.com/files/BCompare-5.2.1.32035.exe',
        installer_type: :inno,
        options: '/VERYSILENT /NORESTART /ALLUSERS /DISABLEUPDATES /SUPPRESSMSGBOXES'
      )
    end
  end

  context 'with action :remove' do
    recipe do
      beyondcompare_package 'default' do
        action :remove
      end
    end

    it do
      is_expected.to remove_windows_package('Beyond Compare 4.4.7').with(
        installer_type: :inno,
        options: '/VERYSILENT /NORESTART /SUPPRESSMSGBOXES'
      )
    end
  end
end
