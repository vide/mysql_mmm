define mysql_mmm::common::config::host (
    $host   = undef,
    $ip     = undef,
    $mode   = "slave",
    $peer   = undef
    
) {
    # $host = $name in the parameters passing works only with 
    # Puppet > $debian_squeeze_version, so we work around it
    # if !defined($host) { $host = $title }
    
    file { "/etc/mysql-mmm/mmm_host-${host}.conf":
            owner   => "root",
            group   => "root",
            mode    => "0600",            
            content => template("mysql_mmm/etc/mysql-mmm/mmm_host.conf.erb"),
            require => File ["/etc/mysql-mmm/mmm_common.conf"]
         }
}
