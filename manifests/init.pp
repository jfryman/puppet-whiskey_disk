# Class: whiskey_disk
#
# Description
#   This module is designed to install and manage whiskey_disk
#   A very opinionated deployment tool, designed to be as fast as 
#   technologically possible.
#
#   This module has been built and tested on RHEL systems.
#
# Parameters:
#   This class takes no parameters. Refer to Whiskey_Disk::Deploy for more info. 
#   
# Actions:
#   This module will install Git and/or Whiskey Disk, and configure
#   the system to programatically build Whiskey Disk deployment
#   configurations
#
# Requires:
#  - Class[stdlib]. This is Puppet Labs standard library to include additional methods for use within Puppet. [https://github.com/puppetlabs/puppetlabs-stdlib]
#  - Class[gitolite::client]. Ensures GIT is installed and ready-to-go. [https://github.com/jfryman/puppet-gitolite]
#
# Sample Usage:
#  whiskey_disk::deploy { 'staging':
#    domain     => [ 'local' ],
#    deploy_to  => '/opt/www/staging',
#    repository => 'https://github.com/flogic/larry.git',
#    branch     => 'staging',
#  }
class whiskey_disk {
  include stdlib
  include gitolite::client
  include whiskey_disk::params

  anchor { 'whiskey_disk::begin': }
  -> class { 'whiskey_disk::package': }
  -> class { 'whiskey_disk::config': }
  anchor { 'whiskey_disk::end': }
}
