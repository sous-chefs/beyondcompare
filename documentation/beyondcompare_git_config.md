# beyondcompare_git_config

Configures or removes Git for Windows settings so Git uses Beyond Compare as its diff and merge tool.

## Actions

| Action       | Description                                       |
|--------------|---------------------------------------------------|
| `:configure` | Configures Git to use Beyond Compare (default)    |
| `:remove`    | Removes the Git settings managed by this resource |

## Properties

| Property                 | Type        | Default                                          | Description                                            |
|--------------------------|-------------|--------------------------------------------------|--------------------------------------------------------|
| `version`                | String      | `'4.4.7.28397'`                                  | Beyond Compare version used to derive the default path |
| `install_dir`            | String      | `C:\Program Files\Beyond Compare 4`              | Installation directory for Beyond Compare              |
| `bcompare_exe`           | String      | `C:\Program Files\Beyond Compare 4\BCompare.exe` | Full path to `BCompare.exe`                            |
| `git_exe`                | String      | `C:\Program Files\Git\cmd\git.exe`               | Full path to `git.exe`                                 |
| `scope`                  | Symbol      | `:global`                                        | Git configuration scope, either `:global` or `:system` |
| `manage_legacy_defaults` | true, false | `true`                                           | Also manages `push.default` and `core.autocrlf`        |

## Examples

### Basic usage

```ruby
beyondcompare_git_config 'default'
```

### Configure only the Beyond Compare tool bindings

```ruby
beyondcompare_git_config 'default' do
  manage_legacy_defaults false
end
```

### Remove managed Git settings

```ruby
beyondcompare_git_config 'default' do
  action :remove
end
```
