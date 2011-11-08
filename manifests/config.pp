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
