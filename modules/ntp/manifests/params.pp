class ntp::params {
  # Common
  $package = 'ntp'
  $config_file = '/etc/ntp.conf'
  $server_list = [
   '0.pool.ntp.org',
   '1.pool.ntp.org',
   '2.pool.ntp.org',
   '3.pool.ntp.org',
  ]

   case $::osfamily {
    'Debian': {
      $service_name = 'ntp'
      $driftfile = '/var/lib/ntp/ntp.drift'
      $config_file_owner = 'root'
      $config_file_group = 'root'
      $config_file_mode  = '0644'
    }
    'RedHat': {
      $service_name = 'ntpd'
      $driftfile = '/var/lib/ntp/drift'
      $config_file_owner = 'root'
      $config_file_group = 'root'
      $config_file_mode  = '0644'
    }
    'Suse': {
      $service_name = 'ntp'
      $driftfile = '/var/lib/ntp/drift/ntp.drift'
      $config_file_owner = 'root'
      $config_file_group = 'ntp'
      $config_file_mode  = '0640'
    }
    default: {
      fail("Unsupported platform: ${::osfamily}")
    }
  }
}
