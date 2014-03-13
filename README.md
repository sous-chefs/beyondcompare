# beyondcompare cookbook

Installs BeyondCompare

# Requirements

Windows

# Usage

# Attributes

* `['beyondcompare']['version']` - The version of BC to install, defaults to '3.3.10.17762'. If you change this you should also change the package_name and checksum (SHA-256) attributes.
# Recipes

default
-------
Installs BeyondCompare from Scooter Software and configures git to use bc3 as the diff and merge tool.

install
-------
Installs BeyondCompare from Scooter Software

gitconfig
---------
Configures git to use BeyondCompare is the diff and merge tool. 

# Author

Author:: Shawn Neal
