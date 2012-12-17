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

  # make sure httpd can send email
  selboolean { "httpd_can_sendmail":
    value      => on,
    persistent => true
  }

  selboolean { "httpd_can_network_connect":
    value      => on,
    persistent => true
  }
}
