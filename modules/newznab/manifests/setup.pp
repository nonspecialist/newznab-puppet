class newznab::setup {
  exec { "create mysql db":
    command => "/usr/bin/mysqladmin create newznab",
    creates => "/var/lib/mysql/newznab"
  }

  define create_grant ($fromhost = $name) {
    exec { "newznab@$fromhost grant":
      command => "/usr/bin/mysql -e \"GRANT ALL on newznab.* TO \'newznab\'@\'$fromhost\' IDENTIFIED BY \'$newznab_password\'\"",
      unless  => "/usr/bin/mysql -e \"SELECT \'FOUND\' from user where User = \'newznab\' and Host = \'$fromhost\'\" mysql | grep -q FOUND"
    }
  }

  $from_hostnames = [
    "localhost",
    "localhost.localdomain",
    "127.0.0.1",
    $fqdn,
    $hostname
  ]

  create_grant { $from_hostnames: }

}
