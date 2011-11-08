# Class: whiskey_disk::params
#
# Description
#   This class is designed to carry default parameters for 
#   Class: whiskey_disk.  
#
# Parameters:
#   $wk_gem_packages - The $wk_gem_packages that should be installed via Ruby Gems
#   $wk_tmp_dir      - The $wk_tmp_dir where puppet generates real-time configuration files. 
#
# Actions:
#   This module does not perform any actions.
#
# Requires:
#   This module has no requirements.   
#
# Sample Usage:
#   This method should not be called directly.
class whiskey_disk::params {
  $wk_gem_packages = ['whiskey_disk']
  $wk_tmp_dir      = '/tmp/whiskey_disk.d'
}
