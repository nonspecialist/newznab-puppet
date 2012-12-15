# required packages to use newznab
class newznab::package {
  $newznab_pkgs = [
    "php",
    "php-gd",
    "php-pear",
    "openssl",
    "mysql",
    "mysql-server",
    "httpd",
    "unrar",
    "unzip",
    "ffmpeg",
    "cdw"     # for mediainfo
  ]

  package { $newznab_pkgs:
    ensure => installed
  }

  exec { "fetch newznab":
    command => "/usr/bin/curl -o /var/tmp/$newznab_dist http://www.newznab.com/$newznab_dist",
    creates => "/var/tmp/$newznab_dist"
  }

  # DON'T extract under /var/www/html -- you don't need to be able to serve
  # all the source
  exec { "extract newznab":
    command => "/usr/bin/unzip -d $newznab_base /var/tmp/$newznab_dist",
    creates => $newznab_root,
    require => [
      Exec['fetch newznab'],
      Package[$newznab_pkgs]
    ]
  }
}
