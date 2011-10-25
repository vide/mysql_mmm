#### mysql-mmm class
#
#
# Parameters:
# 
# $ip - IP othe monitor
# $pid_path - self explanatory
# $bin_path - self explanatory
# $status_path - self explanatory
# $mode - possible values "active" or "manual". "manual" will just inform
#         you of the actions that would be performed  


define mysql_mmm::monitor::config (
    $ip                 = "127.0.0.1",
    $mon_pid_path       = "/var/run/mmm_mond.pid",
    $mon_bin_path       = "/usr/lib/mysql-mmm/",
    $status_path        = "/var/lib/misc/mmm_mond.status",
    $mode               = "manual",
    # IPs present in default mysql-mmm-monitor config file
    $ping_ips           = "192.168.0.1, 192.168.0.2, 192.168.0.3",
    # default monitor user
    $monitor_user       = "mmm_monitor",
    # I strongly suggest you to use some external data provider like
    # extlookup or others for your passwords
    $monitor_password   = undef,
    $check_period       = 5,
    $trap_period        = 10,
    $mon_timeout            = 2,
    $mon_debug              = 0

) {
    
    file { "/etc/mysql-mmm/mmm_mon.conf":
            owner   => "root",
            group   => "root",
            mode    => "0600",
            content => template("mysql_mmm/etc/mysql-mmm/mmm_mon.conf.erb"),
            require => Package["mysql-mmm-monitor"]       
        }
}
