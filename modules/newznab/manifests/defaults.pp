class newznab::defaults {
  $execution_timeout  = 90
  $newznab_version    = "plus"
  $newznab_dir        = "newznab-$newznab_version"
  $newznab_base       = "/var/www"
  $newznab_root       = "$newznab_base/$newznab_dir"
  $newznab_dist       = "newznab-$newznab_version.zip"
  $newznab_password   = "Vp3,Z9x%r2"
  $newznab_admin_usr  = "admin"
  $newznab_admin_pass = "florply#"
  $newznab_timezone   = "Australia/Melbourne"

  # -----------------------------------------
  # Sphinx defaults
  $sphinx_rpm         = "sphinx-2.0.6-1.rhel6.i386.rpm"
  $sphinx_url         = "http://sphinxsearch.com/files/$sphinx_rpm"
}
