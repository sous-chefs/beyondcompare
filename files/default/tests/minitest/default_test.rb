require 'minitest/spec'

# BeyondCompare test class
class TestBeyondCompareInstall < MiniTest::Chef::Spec
  describe 'install BC3' do
    it 'should install bc3.exe' do
      assert File.exist?(node['beyondcompare']['bcompare_exe'])
    end
  end
end
