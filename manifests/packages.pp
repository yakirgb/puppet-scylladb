# == Class scylla::config
#
# Installs the Scylla packages
#
class scylla::packages {

  #ABRT conflict with Scylla coredump configuration
  package { 'abrt':
    ensure => absent,
  }

  ->  package { 'epel-release': }

  ->  package { "scylla-${scylla::major_version}.${scylla::minor_version}": }
}
