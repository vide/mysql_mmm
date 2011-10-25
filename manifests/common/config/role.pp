define mysql_mmm::common::config::role (
    $hosts  = undef,
    $ips    = undef,
    $mode   = undef,
    $prefer = undef
) {
    file { "/etc/mysql-mmm/mmm_role-${name}.conf":
            owner   => "root",
            group   => "root",
            mode    => "0600",            
            content => template("mysql_mmm/etc/mysql-mmm/mmm_role.conf.erb"),
            require => File ["/etc/mysql-mmm/mmm_common.conf"]
         }
}    
