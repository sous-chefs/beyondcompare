# Limitations

## Package Availability

### Windows

- Beyond Compare is officially distributed by Scooter Software for Windows as downloadable installers rather than a native package repository.
- Current Windows release on April 21, 2026: Beyond Compare `5.2.1.32035`.
- Current supported Beyond Compare 4 release on April 21, 2026: Beyond Compare `4.4.7.28397`.
- This cookbook defaults to Beyond Compare `4.4.7.28397` so the resource model stays compatible with the supported Beyond Compare 4 line while remaining upgradeable through resource properties.

## Architecture Limitations

- Scooter Software lists Beyond Compare 5 as supported on Windows 10 32-bit and 64-bit and on current Windows Server releases.
- Windows 11 on ARM is supported through emulation, with a documented Explorer shell-extension limitation and possible performance impact.
- Beyond Compare 4 provides alternate 32-bit and 64-bit MSI installers; Beyond Compare 5 removed MSI installers and relies on the EXE installer.

## Installer Constraints

- The Windows installer uses Inno Setup.
- Silent install options differ by major version:
  - Beyond Compare 4: `/SP- /VERYSILENT /NORESTART`
  - Beyond Compare 5: `/VERYSILENT /NORESTART /ALLUSERS /DISABLEUPDATES /SUPPRESSMSGBOXES`
- The uninstaller also supports silent removal flags such as `/VERYSILENT /NORESTART`.

## Supported Windows Platforms

- Beyond Compare 5 is supported by Scooter Software on Windows 10, Windows 11, Windows Server 2016, Windows Server 2019, Windows Server 2022, and Windows Server 2025.
- Beyond Compare 4.4.7 remains supported on the same platforms and additionally on Windows Server 2012 and Windows Server 2012 R2.

## Known Issues

- Git integration depends on Git for Windows already being installed. The `beyondcompare_git_config` resource safely no-ops when the configured `git_exe` path does not exist.
- Scooter Software does not publish a Windows package repository or installer checksums on its download pages, so this cookbook exposes `source` and `checksum` as resource properties instead of hardcoding a rapidly stale checksum.
