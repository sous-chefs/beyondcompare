[![Cookbook Version](http://img.shields.io/cookbook/v/beyondcompare.svg)](https://supermarket.chef.io/cookbooks/beyondcompare)
[![Build status](https://ci.appveyor.com/api/projects/status/2apr5hmr7oq7uurk/branch/master?svg=true)](https://ci.appveyor.com/project/ChefWindowsCookbooks65871/beyondcompare/branch/master)

# Beyond Compare Cookbook

Installs BeyondCompare

## Requirements

Windows

# Usage

Include `beyondcompare::default` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[beyondcompare::default]"
  ]
}
```

# Attributes

## Optional

* `['beyondcompare']['version']` - The version of BC to install, defaults to '4.1.9'. If you change this you should also change the package_name and checksum attributes.
* `['beyondcompare']['package_name']` - The package name as displayed in Add/Remove programs. Defaults to `Beyond Compare 4.1.9`.
* `['beyondcompare']['checksum']` - The installer SHA256 checksum.

# Recipes

## default
Installs BeyondCompare from Scooter Software and configures git to use Beyond Compare as the diff and merge tool.

## install
Installs BeyondCompare from Scooter Software

## gitconfig
Configures git to use BeyondCompare is the diff and merge tool.

# Author

Author:: Shawn Neal
