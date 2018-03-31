class role::puppetserver {

  include profile::puppetserver
  include profile::puppetdb
  include prometheus::node_exporter

}
