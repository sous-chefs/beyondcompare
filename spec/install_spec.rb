describe 'beyondcompare::install' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
    end.converge(described_recipe)
  end
  it 'installs Beyond Compare' do
    expect(chef_run).to install_windows_package('Beyond Compare 4.2.9')
      .with(
        source: 'http://www.scootersoftware.com/BCompare-4.2.9.23626.exe',
        checksum: '366e78cb7ffd536fbc4a42dbecb094a41a008f30439c95e760710f0ec7b1f300',
        installer_type: :inno
      )
  end
end
