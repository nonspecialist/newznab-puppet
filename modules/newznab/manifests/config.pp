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

  $writable_dirs = [
    "$newznab_root/www/lib/smarty/templates_c",
    "$newznab_root/www/covers/movies",
    "$newznab_root/www/covers/music",
    "$newznab_root/www/covers/anime",
    "$newznab_root/www/install",
    "$newznab_root/nzbfiles"
  ]

  $writable_files = [
    "$newznab_root/www/config.php",
  ]

  file { $writable_dirs:
    ensure => directory,
    owner  => apache,
    group  => apache,
    mode => '0755'
  }

  file { $writable_files:
    ensure => present,
    owner  => apache,
    group  => apache,
    mode   => '0644'
  }
}
