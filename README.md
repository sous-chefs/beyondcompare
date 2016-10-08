[![Cookbook Version](http://img.shields.io/cookbook/v/beyondcompare.svg)](https://supermarket.chef.io/cookbooks/beyondcompare)
[![Build status](https://ci.appveyor.com/api/projects/status/2apr5hmr7oq7uurk/branch/master?svg=true)](https://ci.appveyor.com/project/ChefWindowsCookbooks65871/beyondcompare/branch/master)

# Beyond Compare Cookbook

Installs BeyondCompare and optionally configures Beyond Compare as your diff tool and merge tool for git.

## Requirements

Windows

# Usage

Include the `beyondcompare::default` recipe in your run list.

# Attributes

## Optional

* `['beyondcompare']['version']` - The version of BC to install, defaults to '4.1.9'. If you change this you should also change the package_name and checksum attributes.
* `['beyondcompare']['package_name']` - The package name as displayed in Add/Remove programs. Defaults to 'Beyond Compare 4.1.9'.
* `['beyondcompare']['checksum']` - The installer SHA256 checksum.

# Recipes

## default
Installs BeyondCompare from Scooter Software and configures git to use Beyond Compare as the diff and merge tool.

## install
Installs BeyondCompare from Scooter Software

## gitconfig
If you have git installed, this recipe configures git to use BeyondCompare is the diff and merge tool.

# Author

Author:: Shawn Neal
