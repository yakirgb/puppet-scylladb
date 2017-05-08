# Puppet ScyllaDB

Tested with Travis CI

[![Build Status](https://travis-ci.org/yakirgb/puppet-scylladb.svg?branch=master)](https://travis-ci.org/yakirgb/puppet-scylladb)

This role installs and configures ScyllaDB cluster.

## Requirements

Platform requirements are listed in the metadata file.

## Documentation

[ScyllaDB documentation](http://docs.scylladb.com/)

## Simple setup

```puppet
class{ 'scylla':
  dc    =>  'ScyllaIL',
}
```
## License

See LICENSE file.

## Author Information

Yakir Gibraltar / yakirgb
