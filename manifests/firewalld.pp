# Class scylla::firewalld
#
# Uses crayfishx/puppet-firewalld module to open scylla listen port
#
class scylla::firewalld {

  if $::scylla::manage_firewall {

    if $::scylla::create_firewall_zone {
      firewalld_zone{ $::scylla::firewall_zone_name:
        ensure           => present,
        target           => '%%REJECT%%',
        interfaces       => $::scylla::firewall_interface,
        purge_rich_rules => true,
        purge_services   => true,
        purge_ports      => true,
      }
    }
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

    -> firewalld_service{ "Allow scylla access from the ${::scylla::firewall_zone_name} zone":
      ensure  => 'present',
      service => 'scylla',
      zone    => $::scylla::firewall_zone_name,
    }
  }
}
