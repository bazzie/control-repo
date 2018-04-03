class profile::puppetdb {

  class {'puppetdb':}  
  class {'puppetdb::master::config':}  

  file {'/etc/consul/service_puppetdb.json':
    ensure  => present,
    content => '{"service":{"name":"puppetdb","port":8081}}',
  }

} 
