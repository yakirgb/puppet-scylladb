# == Class scylla::params
#
# This class is meant to be called from scylla
# It sets variables according to platform
#
class scylla::params {

  # ScyllaDB version
  $major_version                       = '1.6'
  $minor_version                       = '4'

  # scylla.yaml
  $cluster_name                        = 'ScyllaCluster'
  $seeds                               = $::ipaddress
  $listen_address                      = $::ipaddress
  $broadcast_rpc_address               = $::ipaddress
  $rpc_address                         = '0.0.0.0'
  $num_tokens                          = 256
  $data_file_directories               = '/var/lib/scylla/data'
  $commitlog_directory                 = '/var/lib/scylla/data/commitlog'
  $commitlog_sync                      = 'periodic'
  $commitlog_sync_period_in_ms         = 10000
  $commitlog_segment_size_in_mb        = 32
  $native_transport_port               = 9042
  $read_request_timeout_in_ms          = 5000
  $write_request_timeout_in_ms         = 2000
  $endpoint_snitch                     = 'GossipingPropertyFileSnitch'
  $rpc_port                            = 9160
  $api_port                            = 10000
  $api_address                         = '127.0.0.1'
  $batch_size_warn_threshold_in_kb     = 5
  $partitioner                         = 'org.apache.cassandra.dht.Murmur3Partitioner'
  $commitlog_total_space_in_mb         = '-1'
  $prometheus_port                     = 9180
  $storage_port                        = 7000
  $ssl_storage_port                    = 7001

  # cassandra-rackdc.properties
  $dc                                  = 'ScyllaDC'
  $rack                                = 'ScyllaRack'

  # Scylla_setup parameters
  $scylla_setup_skip_options           = '--no-ntp-setup --no-raid-setup'
  $scylla_setup_nic_options            = '--setup-nic --nic bond0'

  # Scylla-JMX
  $jmx_port                            = 7199

  # node_exporter
  $node_exporter_port                  = 9100

}
