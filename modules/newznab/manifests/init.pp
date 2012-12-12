class newznab (
  $execution_timeout = $newznab::defaults::execution_timeout
) inherits newznab::defaults {
  class { 'newznab::repos': }

  class { 'newznab::package': 
    require => Class['newznab::repos']
  }

  class { 'newznab::config': 
    require => Class['newznab::package']
  }

  class { 'newznab::service': 
    require => Class['newznab::config']
  }
}
