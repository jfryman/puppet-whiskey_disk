class whiskey_disk {
  include stdlib
  include git::client
  include whiskey_disk::params

  anchor { 'whiskey_disk::begin': }
  -> class { 'whiskey_disk::package': }
  -> class { 'whiskey_disk::config': }
  anchor { 'whiskey_disk::end': }
}
