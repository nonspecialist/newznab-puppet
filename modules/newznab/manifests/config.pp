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
    notify  => Service['mysqld']
  }

  exec { 'initialize mysql':
    command => '/usr/bin/mysql_install_db --user=mysql --force --skip-name-resolve',
    require => File['/etc/my.cnf'],
    creates => '/var/lib/mysql/mysql',
  }

  file { '/etc/httpd/conf/httpd.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('newznab/httpd.conf.erb'),
    notify  => Service['httpd']
  }

  file { '/etc/httpd/conf.d/newznab.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('newznab/httpd_newznab.conf.erb'),
    notify  => Service['httpd']
  }

  file { "$newznab_root/www/lib/smarty/templates_c":
    ensure => directory,
    owner  => apache,
    group  => apache,
    mode => '0755'
  }
}
