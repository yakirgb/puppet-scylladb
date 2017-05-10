# == Class scylla::config
#
# This class is called from scylla
#
class scylla::config inherits ::scylla {

  #Fix https://github.com/scylladb/scylla/issues/2269
  file { '/usr/lib/scylla/posix_net_conf.sh':
    ensure => present,
    source => "puppet:///modules/${module_name}/posix_net_conf.sh",
    mode   => '0775',
    before => Exec['scylla_setup']
  }

  exec { 'scylla_setup':
    command => "/usr/sbin/scylla_setup ${scylla::scylla_setup_skip_options} ${scylla::scylla_setup_nic_options}",
    creates => '/var/lib/scylla/.scylla_setup_done',
    before  => File['/var/lib/scylla/.scylla_setup_done'],
    timeout =>  1800,
  }

  file { '/var/lib/scylla/.scylla_setup_done':
    ensure => present,
  }

  file{ $scylla::commitlog_directory :
    ensure => directory,
    owner  => 'scylla',
    group  => 'scylla',
    mode   => '0755',
  }

  file { '/etc/scylla/scylla.yaml':
    content =>  template("${module_name}/scylla.yaml.erb")
  }

  file { '/etc/scylla/cassandra-rackdc.properties':
    content =>  template("${module_name}/cassandra-rackdc.properties.erb")
  }

}
