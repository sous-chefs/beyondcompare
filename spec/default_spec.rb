describe 'beyondcompare::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
    end.converge(described_recipe)
  end

  it 'includes beyondcompare::install recipe' do
    expect(chef_run).to include_recipe 'beyondcompare::install'
  end

  it 'includes beyondcompre::gitconfig recipe' do
    expect(chef_run).to include_recipe 'beyondcompare::gitconfig'
  end
end
