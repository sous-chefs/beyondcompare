# Migration Guide

This cookbook no longer exposes recipe or attribute entry points.

The legacy interface:

* `beyondcompare::default`
* `beyondcompare::install`
* `beyondcompare::gitconfig`
* `node['beyondcompare'][...]`

has been replaced by custom resources:

* `beyondcompare_package`
* `beyondcompare_git_config`

## What Changed

### Recipes were removed

The root `recipes/` directory is gone. Consumers should declare resources directly in their own recipes instead of including `beyondcompare::default`, `beyondcompare::install`, or `beyondcompare::gitconfig`.

### Attributes were removed

The root `attributes/` directory is gone. Configuration now lives on resource properties instead of node attributes.

### Test usage moved into the test cookbook

Examples that used to be implicit in cookbook recipes now live in `test/cookbooks/test/recipes/default.rb`.

## Old to New Mapping

### Install Beyond Compare

Old:

```ruby
include_recipe 'beyondcompare::install'
```

New:

```ruby
beyondcompare_package 'default'
```

### Configure Git to use Beyond Compare

Old:

```ruby
include_recipe 'beyondcompare::gitconfig'
```

New:

```ruby
beyondcompare_git_config 'default'
```

### Legacy default recipe behavior

Old:

```ruby
include_recipe 'beyondcompare::default'
```

New:

```ruby
beyondcompare_package 'default'

beyondcompare_git_config 'default'
```

## Attribute Migration

### Version

Old:

```ruby
node.default['beyondcompare']['version'] = '4.2.9.23626'
```

New:

```ruby
beyondcompare_package 'default' do
  version '4.4.7.28397'
end
```

### Installer source

Old:

```ruby
node.default['beyondcompare']['source'] = 'http://www.scootersoftware.com/'
```

New:

```ruby
beyondcompare_package 'default' do
  source 'https://www.scootersoftware.com/files/BCompare-4.4.7.28397.exe'
end
```

### Installer checksum

Old:

```ruby
node.default['beyondcompare']['checksum'] = '...'
```

New:

```ruby
beyondcompare_package 'default' do
  checksum '...'
end
```

### Git executable path

Old:

```ruby
node.default['beyondcompare']['git_exe'] = 'C:\\Program Files\\Git\\cmd\\git.exe'
```

New:

```ruby
beyondcompare_git_config 'default' do
  git_exe 'C:\\Program Files\\Git\\cmd\\git.exe'
end
```

### Beyond Compare executable path

Old:

```ruby
node.default['beyondcompare']['bcompare_exe'] = 'C:\\Program Files\\Beyond Compare 4\\BCompare.exe'
```

New:

```ruby
beyondcompare_git_config 'default' do
  bcompare_exe 'C:\\Program Files\\Beyond Compare 4\\BCompare.exe'
end
```

## Removal Behavior

If you need to undo the old create/install behavior, use the resource removal actions explicitly.

Remove Beyond Compare:

```ruby
beyondcompare_package 'default' do
  action :remove
end
```

Remove the managed Git settings:

```ruby
beyondcompare_git_config 'default' do
  action :remove
end
```

## Recommended Replacement

For most users, the direct replacement for the old default recipe is:

```ruby
beyondcompare_package 'default'

beyondcompare_git_config 'default'
```
