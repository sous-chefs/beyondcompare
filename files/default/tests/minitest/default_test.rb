require 'minitest/spec'

class TestBeyondCompareInstall < MiniTest::Chef::Spec
  describe 'install BC3' do
    it 'should install bc3.exe' do
      assert File.exists?(node['beyondcompare']['bcompare_exe'])
    end
  end
end
