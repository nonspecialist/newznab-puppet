class newznab::config {
  file { '/etc/php.ini':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('newznab/php.ini.erb')
  }

  file { '/etc/my.cnf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('newznab/my.cnf.erb'),
    notify  => Exec['initialize mysql']
  }

  exec { 'initialize mysql':
    command => '/usr/bin/mysql_install_db --user=mysql --force --skip-name-resolve',
    require => File['/etc/my.cnf'],
    refreshonly => true
  }

  file { '/etc/httpd/conf/httpd.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('newznab/httpd.conf.erb'),
    notify  => Service['httpd']
  }
}
