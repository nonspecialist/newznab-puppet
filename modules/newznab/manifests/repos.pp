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

  exec { 'install rpmfusion-free-release':
    command => "/usr/bin/yum localinstall -y -d 0 -e 0 /var/tmp/$rpmfusion_free_pkg",
    unless  => "/bin/rpm -q --quiet rpmfusion-free-release",
    require => Exec['fetch-rpmfusion-free-rpm']
  }

  exec { 'fetch-rpmfusion-nonfree-rpm':
    creates => "/var/tmp/$rpmfusion_nonfree_pkg",
    command => "/usr/bin/curl -o /var/tmp/$rpmfusion_nonfree_pkg http://download1.rpmfusion.org/nonfree/el/updates/6/$architecture/$rpmfusion_nonfree_pkg"
  }

  exec { 'install rpmfusion-nonfree-release':
    command => "/usr/bin/yum localinstall -y -d 0 -e 0 /var/tmp/$rpmfusion_nonfree_pkg",
    unless  => "/bin/rpm -q --quiet rpmfusion-nonfree-release",
    require => Exec['fetch-rpmfusion-nonfree-rpm']
  }

}
