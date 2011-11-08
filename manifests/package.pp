class whiskey_disk::package {
  package { $whiskey_disk::params::wk_gem_packages:
    ensure   => 'present',
    provider => 'gem',
  }
}
