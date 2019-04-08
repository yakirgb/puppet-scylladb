# = Class: scylla::repo::yum
#
# Adds the Scylla YUM repo support
#
class scylla::repo::yum {

yumrepo { 'scylla':
    baseurl  =>  "https://repositories.scylladb.com/scylla/downloads/scylladb/ad39e17f-731b-4ca3-ad4c-e66adff0696e/scylla/rpm/centos/scylladb-3.0/\$releasever/\$basearch/",
    descr    =>  'Scylla for Centos $releasever - $basearch',
    enabled  =>  1,
    gpgcheck =>  0,
  }

  yumrepo { 'scylla-generic':
    baseurl  =>  "https://repositories.scylladb.com/scylla/downloads/scylladb/ad39e17f-731b-4ca3-ad4c-e66adff0696e/scylla/rpm/centos/scylladb-3.0/\$releasever/noarch/",
    descr    =>  'Scylla for centos $releasever',
    enabled  =>  1,
    gpgcheck =>  0,
  }

yumrepo { 'scylladb-scylla-3rdparty':
    baseurl  =>  'https://copr-be.cloud.fedoraproject.org/results/scylladb/scylla-3rdparty/epel-7-x86_64/',
    descr    =>  'Scylla for Centos $releasever - $basearch',
    enabled  =>  1,
    gpgcheck =>  0,
  }


}
