require 'minitest/spec'

# BeyondCompare test class
class TestBeyondCompareInstall < MiniTest::Chef::Spec
  describe 'installer' do
    it 'should install Beyond Compare' do
      assert File.exist?(node['beyondcompare']['bcompare_exe'])
    end
  end
end
