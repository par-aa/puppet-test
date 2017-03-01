$package_list =  [ 'bash-completion', 'tmux', 'atop', 'tree' ]


package { $package_list:
	ensure => 'present',
}
