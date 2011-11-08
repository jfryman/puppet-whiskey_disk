define whiskey_disk::deploy(
  $deploy_to,
  $domain,
  $repository, 
  $branch             = 'master',
  $config_branch      = 'master',
  $config_repository  = '',
  $config_target      = '',
  $deploy_config_to   = '',
  $yaml_path          = '',
  $post_deploy_script = '',
  $post_setup_script  = '',
  $project            = '',
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
  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin:/opt/ruby/bin',
  }

  # Variable Init
  $REAL_staleness_check = $staleness_check ? {
    'true'  => '-c',
    default => '',
  }

  $REAL_yaml_path = $yaml_path ? {
    ''      => "${whiskey_disk::params::wk_tmp_dir}/${name}.yml",
    default => $yaml_path,
  }

  $wd_args = "--to=${name} --path=${REAL_yaml_path} ${REAL_staleness_check}" 

  # Safety Checks
  if $config_repository != '' and 
    ($config_target == '' or $deploy_config_to == '' or $project == '') { 
    fail('Must define $config_target/$deploy_config_to/$project when defining $config_repository') 
  }

  # Logic
  file { "${whiskey_disk::params::wk_tmp_dir}/${name}.yml":
    ensure  => 'file',
    content => template('whiskey_disk/deploy.yml.erb'),
    require => Package[$whiskey_disk::params::wk_gem_packages],
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
