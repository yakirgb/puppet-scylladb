# Puppet ScyllaDB

This role installs and configures ScyllaDB cluster.

## Tested with Travis CI

[![Build Status](https://travis-ci.org/yakirgb/puppet-scylladb.svg?branch=master)](https://travis-ci.org/yakirgb/puppet-scylladb)

## Requirements

CentOS/RHEL	7.2 and above

## Documentation

[ScyllaDB documentation](http://docs.scylladb.com/)

## Simple setup

```puppet
class{ 'scylla':
  cluster_name              =>  'ScyllaTest'
  dc                        =>  'ScyllaUS',
  rack                      =>  'ScyllaTestRack',
  seeds                     =>  ['192.30.253.113','192.30.253.112'],
  manage_firewall           =>  false
  scylla_setup_skip_options =>  '--no-raid-setup',
  scylla_setup_nic_options  =>  '--setup-nic --nic bond0'.
}
```
## License

See LICENSE file.

## Author Information

Yakir Gibraltar / yakirgb
