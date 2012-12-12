class newznab::repos {
  # We can install rpmfusion repos via yum directly from the repo itself
  package { 'rpmfusion-free-release':
    ensure => installed,
    source => "http://download1.rpmfusion.org/free/el/updates/6/$architecture/rpmfusion-free-release-6-1.noarch.rpm",
  }

  package { 'rpmfusion-nonfree-release':
    ensure => installed,
    source => "http://download1.rpmfusion.org/nonfree/el/updates/6/$architecture/rpmfusion-nonfree-release-6-1.noarch.rpm"
  }
}
