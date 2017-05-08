# == Class scylla::config
#
# Installs the Scylla packages
#
class scylla::packages {

  if $caller_module_name != $module_name {
  fail("Use of private class ${name} by ${caller_module_name}")
  }

  #ABRT conflict with Scylla coredump configuration
  package { 'abrt':
    ensure => absent,
  }

  ->  package { 'epel-release': }

  ->  package { "scylla-${scylla::major_version}.${scylla::minor_version}": }
}
