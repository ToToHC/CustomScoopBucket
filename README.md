# CustomScoopBucket

This is a custom [Scoop](https://scoop.sh) bucket containing installers for the following software:
- Native Instruments Native Access
- iZotope Product Portal
- Arturia Software Center
- Surge XT Synthesizer
- X2Go Client


---

## Usage

### Add the bucket:
```powershell
scoop bucket add custom https://github.com/ToToHC/CustomScoopBucket.git
```

### Install individual packages:
```powershell
scoop install custom/<app-name>
```

### Install all packages at once:

This bucket contains an `all.json` meta-package that allows you to install all apps with one command:
```powershell
scoop install custom/all
```

---

## Hash Update Tool

To automatically calculate and update SHA256 hashes for your manifests, use the provided `update-hash.ps1` script:

### Usage:
```powershell
..\update-hash.ps1 -manifest .ucket\<manifest-name>.json
```

Example:
```powershell
..\update-hash.ps1 -manifest .ucket
ativeaccess.json
```

### Purpose:
- Downloads the installer from the manifest URL.
- Calculates the correct SHA256 hash.
- Updates the manifest file with the new hash.
- Ensures consistency and integrity for Scoop installations.

---

## Legal Note

All installers are linked directly from official vendor URLs. This bucket contains no binaries and only public metadata references. Use at your own risk.
