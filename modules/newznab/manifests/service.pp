class newznab::service {
  service { 'mysqld':
    ensure  => running,
    enable  => true,
    require => Exec['initialize mysql']
  }

  service { 'httpd':
    ensure => running,
    enable => true
  }
}
