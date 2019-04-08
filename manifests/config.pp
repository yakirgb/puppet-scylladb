# == Class scylla::config
#
# This class is called from scylla
#
class scylla::config inherits ::scylla {

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

  # make scylla logs go into dedicated log as well
  file{ '/var/log/scylla' :
    ensure => directory,
    owner  => 'scylla',
    group  => 'scylla',
    mode   => '0755',
  }

  file { '/etc/rsyslog.d/scylla.conf':
    content =>  "if \$programname == \"scylla\" then /var/log/scylla/output.log
& stop"
  }

  file_line { 'scylla_config':
    path  => '/usr/lib/systemd/system/scylla-server.service',
    line  => 'SyslogIdentifier=scylla',
    after => 'StandardOutput=syslog',
  }


}
