# Liste de paquets à installer
$package_list =  [ 'bash-completion', 'tmux', 'atop', 'tree' ]

# Si je passe un tableau en titre, toutes les ressources listées
# sont réalisées, avec les mêmes attributs
package { $package_list:
	ensure => 'present',
}


file { '/etc/motd':
	ensure => 'present',
	content => "Bonjour, vous etes sur ${fqdn}, qui tourne sur ${os['name']} (${osfamily}), noyau version ${kernelrelease}\n",
	mode => '0644',
	owner => 'root',
	group => 'root',
}
