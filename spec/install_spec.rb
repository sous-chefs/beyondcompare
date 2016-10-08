describe 'beyondcompare::install' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
    end.converge(described_recipe)
  end
  it 'installs Beyond Compare' do
    expect(chef_run).to install_windows_package('Beyond Compare 4.1.9')
      .with(
        source: 'http://www.scootersoftware.com/BCompare-4.1.9.21719.exe',
        checksum: '7396aad00be94625ef1cbc638d197da066e95e80cedbb5661454a4cff3dcce40',
        installer_type: :inno
      )
  end
end
