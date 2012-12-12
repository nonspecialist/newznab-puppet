class newznab 
inherits newznab::defaults {
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
