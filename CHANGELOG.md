emacs24 CHANGELOG
=================

This file is used to list changes made in each version of the emacs24 cookbook.

0.5.0
-----

- New requirement: [ohai](https://supermarket.chef.io/cookbooks/ohai) cookbook
- Best way to determine if the `compile` recipe should be included in `default` recipe
Check for version installed instead of build directory present.
Use a simple Ohai custom plugin to retrieve current version installed on the system.
- Use Rake instead of Strainer
- Code style improvements

0.4.1
-----
- Don't use `sudo` command for `make install`

0.4.0
-----
- Build emacs only if not built
- Added `force` attribute

0.3.0
-----
- Emacs 24.4 as default installed version
- Added `flags` attribute to set a list of flags for configure script
- Added Ubuntu 14.04 as compatible platform

0.2.1
-----
- Spec improvements, code style

0.2.0
-----
- Fixed packages attribute for non debian platform
- Added Ubuntu 12.04 support
- Added ChefSpec specs for unit testing

0.1.1
-----
- Use official opscode box for test-kitchen

0.1.0
-----
- Initial release of emacs24
