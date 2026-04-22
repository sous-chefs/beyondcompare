# beyondcompare Cookbook

The `beyondcompare` cookbook is a Windows-only custom-resource cookbook for installing Beyond Compare and wiring Git for Windows to use it as the diff and merge tool.

## Requirements

- Windows
- Chef 15.3+

## Resources

### beyondcompare_package

Installs or removes Beyond Compare from Scooter Software.

```ruby
beyondcompare_package 'default'
```

### beyondcompare_git_config

Configures Git for Windows to use Beyond Compare.

```ruby
beyondcompare_git_config 'default'
```

### Default workflow

```ruby
beyondcompare_package 'default'

beyondcompare_git_config 'default'
```

## Resource Documentation

- [beyondcompare_package](documentation/beyondcompare_package.md)
- [beyondcompare_git_config](documentation/beyondcompare_git_config.md)
- [migration guide](migration.md)

## Notes

- The cookbook defaults to Beyond Compare `4.4.7.28397`, the latest supported Beyond Compare 4 release published by Scooter Software as of April 21, 2026.
- Git integration is safe when Git for Windows is absent: `beyondcompare_git_config` does not run its `git config` commands unless `git.exe` exists.
- Vendor support and installer limitations are documented in [LIMITATIONS.md](LIMITATIONS.md).
