# Class: whiskey_disk::config
#
# Description
#  This class is designed to configure the system to use Whiskey Disk
#  after packages have been deployed. 
#
# Parameters:
#  This module takes no parameters
# 
# Actions:
#  Creates the storage location for programatically generated config files.
#
# Requires:
#  This module has no requirements
#
# Sample Usage:
#  This module should not be called directly.
class whiskey_disk::config {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { $whiskey_disk::params::wk_tmp_dir: 
    ensure  => 'directory',
    purge   => 'true',
    recurse => 'true',
  }
}
