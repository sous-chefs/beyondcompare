default['beyondcompare']['version'] = '3.3.9.17611'
default['beyondcompare']['base_url'] = 'http://www.scootersoftware.com'

default['beyondcompare']['3.3.9.17611']['package_name'] = 'Beyond Compare 3.3.9'
default['beyondcompare']['3.3.9.17611']['checksum'] =
  'f22f6845a09124c5eb7e3c0cf995324757e6f0eac251a97ab5027bad020d342b'

# Assume 64bit Windows
default['beyondcompare']['bcompare_exe'] =
  ::File.join('c:', 'Program Files (x86)', 'Beyond Compare 3', 'BCompare.exe')

default['beyondcompare']['git_exe'] =
  ::File.join('c:', 'Program Files (x86)', 'Git', 'bin', 'git.exe')
