class newznab::service {
  service { 'mysqld':
    ensure => running,
    enable => true
  }

  service { 'httpd':
    ensure => running,
    enable => true
  }
}
