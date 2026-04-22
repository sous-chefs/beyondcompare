# beyondcompare_package

Installs or removes Beyond Compare on Windows by managing Scooter Software's Inno Setup installer.

## Actions

| Action     | Description                       |
|------------|-----------------------------------|
| `:install` | Installs Beyond Compare (default) |
| `:remove`  | Removes Beyond Compare            |

## Properties

| Property            | Type          | Default                                                            | Description                                   |
|---------------------|---------------|--------------------------------------------------------------------|-----------------------------------------------|
| `version`           | String        | `'4.4.7.28397'`                                                    | Beyond Compare version including build number |
| `install_dir`       | String        | `C:\Program Files\Beyond Compare 4`                                | Installation directory                        |
| `bcompare_exe`      | String        | `C:\Program Files\Beyond Compare 4\BCompare.exe`                   | Full path to `BCompare.exe`                   |
| `package_name`      | String        | `'Beyond Compare 4.4.7'`                                           | Display name used by Windows Installer        |
| `source`            | String        | `'https://www.scootersoftware.com/files/BCompare-4.4.7.28397.exe'` | Installer URL                                 |
| `checksum`          | String        | none                                                               | Optional SHA256 checksum for the installer    |
| `install_options`   | String, Array | `['/SP-', '/VERYSILENT', '/NORESTART', '/SUPPRESSMSGBOXES']`       | Silent install options                        |
| `uninstall_options` | String, Array | `['/VERYSILENT', '/NORESTART', '/SUPPRESSMSGBOXES']`               | Silent uninstall options                      |

## Examples

### Basic usage

```ruby
beyondcompare_package 'default'
```

### Install Beyond Compare 5

```ruby
beyondcompare_package 'default' do
  version '5.2.1.32035'
end
```

### Remove Beyond Compare

```ruby
beyondcompare_package 'default' do
  action :remove
end
```
