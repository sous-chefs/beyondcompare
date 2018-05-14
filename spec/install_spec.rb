describe 'beyondcompare::install' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
    end.converge(described_recipe)
  end
  it 'installs Beyond Compare' do
    expect(chef_run).to install_windows_package('Beyond Compare 4.2.4')
      .with(
        source: 'http://www.scootersoftware.com/BCompare-4.2.4.22795.exe',
        checksum: 'b4b2bed8e5fe16a8680ffb4f3827a892cbfecc58803cc59c70bc66e60a92e291',
        installer_type: :inno
      )
  end
end
