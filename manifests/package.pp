# Class: whiskey_disk::package
#
# Description
#   This class is designed to install Whiskey_Disk Packages via RubyGems
#
# Parameters:
#  This class takes no parameters
#
# Actions:
#   This class installs Whiskey Disk via Rubygems
#
# Requires:
#   This module has no requirements.   
#
# Sample Usage:
#   This method should not be called directly.
class whiskey_disk::package {
  package { $whiskey_disk::params::wk_gem_packages:
    ensure   => 'present',
    provider => 'gem',
  }
}
