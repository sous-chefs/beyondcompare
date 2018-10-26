describe 'beyondcompare::install' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
    end.converge(described_recipe)
  end
  it 'installs Beyond Compare' do
    expect(chef_run).to install_windows_package('Beyond Compare 4.2.7')
      .with(
        source: 'http://www.scootersoftware.com/BCompare-4.2.7.23425.exe',
        checksum: 'a3b45191a25505de429d25bd354a8fbd259693c6b0b0b778c898c0e1c1f685af',
        installer_type: :inno
      )
  end
end
