# required packages to use newznab
class newznab::package {
  $newznab_pkgs = [
    "php",
    "php-gd",
    "php-pear",
    "mysql",
    "httpd",
    "unrar",
    "ffmpeg",
    "cdw"     # for mediainfo
  ]

  package { $newznab_pkgs:
    ensure => installed
  }
}
