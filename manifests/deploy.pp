define whiskey_disk::deploy(
  $deploy_config_to,
  $deploy_to,
  $domain,
  $repository, 
  $project,
  $branch             = 'master',
  $config_repository  = '',
  $config_branch      = 'master',
  $config_target      = '',
  $post_deploy_script = '',
  $post_setup_script  = '',
  $path               = "${whiskey_disk::params::wk_tmp_dir}/${name}",
  $role               = '',
  $staleness_check    = 'false',
  $ssh_options        = { },
  $rake_env           = { 'RAILS_ENV' => 'production' }
) {
  include whiskey_disk

  File { 
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  # Variable Init
  $REAL_staleness_check = $staleness_check ? {
    'true'  => '-c',
    default => '',
  }

  $wd_args = "--to=<%= name %> --path=${path} ${REAL_staleness_check}" 

  # Safety Checks
  if $config_repository != '' and $config_target == '' { 
    fail('Must define $config_target when defining $config_repository') 
  }

  # Logic
  file { "${whiskey_disk::params::wk_tmp_dir}/${name}.yml":
    ensure => 'file',
    content => template('whiskey_disk/deploy.yml.erb'),
  }
  exec { "whiskey_disk-setup-${name}":
    command => "wd setup ${wd_args}",
    require => File["${whiskey_disk::params::wk_tmp_dir}/${name}.yml"],
    before  => Exec["whiskey_disk-install-${name}"],
  }
  exec { "whiskey_disk-install-${name}":
    command => "wd deploy ${wd_args}",
  }
}
