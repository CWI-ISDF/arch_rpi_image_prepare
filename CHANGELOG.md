# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [1.1.5]
Initial release of PentestBox

### Added
* Added a user-friendly build script.
* Added a user-friendly post-installation configuration script.

### Changed
* Graphics and text have been rebranded to be more professional when used on a penetration testing site.
* Instead of pulling the Piratebox webserver scripts in from a separate Git repository, everything now exists in one repository.
* The dialog package is now marked as required during the build process (for the post-install script).

### Improved
* Corrected various typos.


## [Unreleased]

## [1.0.7]
### Added
* CHANGELOG.md file
* alarm user is now member of sudo group
* Retrieve staging packages during build process
* Make targets to install dependencies and PirateBox via chroot
* Testing checklist
* Support for RPi 2
* Support for RPi Zero
* Set TIMESAVE_FORMAT
* Build from specific piratebox webserver branch

### Changed
* No need to start qemu manually - everything is now done via chroot
* Automated installation of dependencies
* Automated installation of PirateBox
* root user is not allowed to log in via ssh
* README converted to MarkDown

### Improved
* initial package selection
* only install/update new packages, do not reinstall packages that are available
* qemu start scripts
* permissions for minidlna
* Fixed permission issue with Droopy
