name 'beyondcompare'
maintainer 'Daptiv Solutions, LLC'
maintainer_email 'sneal@daptiv.com'
license 'All rights reserved'
description 'Installs/Configures Beyond Compare'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
ver_path = File.join(File.dirname(__FILE__), 'version.txt')
version File.exist?(ver_path) ? IO.read(ver_path).chomp : '0.0.1'
supports 'windows'
depends 'windows', '>= 1.2.6'
