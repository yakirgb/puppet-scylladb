# = Class: scylla::repo::yum
#
# Adds the Scylla YUM repo support
#
class scylla::repo::yum {
  yumrepo { 'scylla':
    baseurl  =>  "https://s3.amazonaws.com/downloads.scylladb.com/rpm/centos/scylladb-${scylla::major_version}/\$releasever/\$basearch/",
    descr    =>  'Scylla for Centos $releasever - $basearch',
    enabled  =>  1,
    gpgcheck =>  0,
  }

  yumrepo { 'scylla-generic':
    baseurl  =>  "https://s3.amazonaws.com/downloads.scylladb.com/rpm/centos/scylladb-${scylla::major_version}/\$releasever/noarch/",
    descr    =>  'Scylla for centos $releasever',
    enabled  =>  1,
    gpgcheck =>  0,
  }

  yumrepo { 'scylla-3rdparty':
    baseurl  =>  "https://s3.amazonaws.com/downloads.scylladb.com/rpm/centos/scylladb-${scylla::major_version}/\$releasever/\$basearch/",
    descr    =>  'Scylla 3rdParty for Centos $releasever - $basearch',
    enabled  =>  1,
    gpgcheck =>  0,
  }

  yumrepo { 'scylla-3rdparty-generic':
    baseurl  =>  "https://s3.amazonaws.com/downloads.scylladb.com/rpm/centos/scylladb-${scylla::major_version}/\$releasever/noarch/",
    descr    =>  'Scylla 3rdParty for Centos $releasever',
    enabled  =>  1,
    gpgcheck =>  0,
  }
}
