class newznab::repos {
  # the yum provider for package doesn't do localinstall, so we have to
  # fetch the RPMs for rpmfusion first. The other option is to specify the
  # repos explicitly using the 'yumrepo' type

  $rpmfusion_free_pkg = 'rpmfusion-free-release-6-1.noarch.rpm'
  $rpmfusion_nonfree_pkg = 'rpmfusion-nonfree-release-6-1.noarch.rpm'

  exec { 'fetch-rpmfusion-free-rpm':
    creates => "/var/tmp/$rpmfusion_free_pkg",
    command => "/usr/bin/curl -o /var/tmp/$rpmfusion_free_pkg http://download1.rpmfusion.org/free/el/updates/6/$architecture/$rpmfusion_free_pkg"
  }

  package { 'rpmfusion-free-release':
    ensure      => installed,
    source      => "/var/tmp/$rpmfusion_free_pkg",
    require     => Exec['fetch-rpmfusion-free-rpm']
  }

  exec { 'fetch-rpmfusion-nonfree-rpm':
    creates => "/var/tmp/$rpmfusion_nonfree_pkg",
    command => "/usr/bin/curl -o /var/tmp/$rpmfusion_nonfree_pkg http://download1.rpmfusion.org/nonfree/el/updates/6/$architecture/$rpmfusion_nonfree_pkg"
  }

  package { 'rpmfusion-nonfree-release':
    ensure      => installed,
    source      => "/var/tmp/$rpmfusion_nonfree_pkg",
    require     => Exec['fetch-rpmfusion-nonfree-rpm']
  }

}
