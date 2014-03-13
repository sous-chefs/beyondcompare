default['beyondcompare']['version'] = '3.3.10.17762'
default['beyondcompare']['base_url'] = 'http://www.scootersoftware.com'

default['beyondcompare']['3.3.10.17762']['package_name'] = 'Beyond Compare 3.3.10'
default['beyondcompare']['3.3.10.17762']['checksum'] =
  'b085ec43aabc042c1420872e7f5d8074167ede465814bd816dc9c5c64a332602'

# Assume 64bit Windows
default['beyondcompare']['bcompare_exe'] =
  ::File.join('c:', 'Program Files (x86)', 'Beyond Compare 3', 'BCompare.exe')

default['beyondcompare']['git_exe'] =
  ::File.join('c:', 'Program Files (x86)', 'Git', 'bin', 'git.exe')

