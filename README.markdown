# Whiskey Disk Puppet Module

James Fryman <james@frymanet.com>

This module manages Whiskey Disk (wd) deployments within Puppet

Whiskey Disk
- http://github.com/flogic/whiskey_disk

# Quick Start

Install and bootstrap Whiskey Disk for Puppet

* Download Manifest
* Add whiskey_disk::deploy to customize
* Profit!

# Requirements

Puppet Labs Standard Library
- http://github.com/puppetlabs/puppetlabs-stdlib

Git Client
- http://github.com/jfryman/puppet-gitolite 

<pre>
 whiskey_disk::deploy { 'staging':
   domain     => [ 'local' ],
   deploy_to  => '/opt/www/staging',
   repository => 'https://github.com/flogic/larry.git',
   branch     => 'staging',
   rake_env   => { 'RAKE_ENV' => 'production' },
 } 
</pre>
