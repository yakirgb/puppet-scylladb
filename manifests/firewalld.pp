# Class scylla::firewalld
#
# Uses crayfishx/puppet-firewalld module to open scylla listen port
#
class scylla::firewalld {

  if $::scylla::manage_firewall {
    firewalld::custom_service{'scylla':
      short => 'scylla',
      port  => [
        {
          'port'     => $::scylla::native_transport_port,
          'protocol' => 'tcp',
        },
        {
          'port'     => $::scylla::rpc_port,
          'protocol' => 'tcp',
        },
        {
          'port'     => $::scylla::api_port,
          'protocol' => 'tcp',
        },
        {
          'port'     => $::scylla::jmx_port,
          'protocol' => 'tcp',
        },
        {
          'port'     => $::scylla::prometheus_port,
          'protocol' => 'tcp',
        },
        {
          'port'     => $::scylla::storage_port,
          'protocol' => 'tcp',
        },
        {
          'port'     => $::scylla::ssl_storage_port,
          'protocol' => 'tcp',
        },
        {
          'port'     => $::scylla::node_exporter_port,
          'protocol' => 'tcp',
        },
      ]
    }

    -> firewalld_service{ 'Allow scylla access from the internal zone':
      ensure  => 'present',
      service => 'scylla',
      zone    => 'internal'
    }
  }
}
