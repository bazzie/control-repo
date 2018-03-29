class profile::dev_tools {

  package {'pdk':
    ensure => latest,
  }

  package {'vim':
    ensure => latest,
  }


}
