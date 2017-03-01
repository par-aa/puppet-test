# Garantie sur le package zsh/bash

case $osfamily {
	'Debian': { $shell_user = 'zsh' }
	'Suse': { $shell_user = 'bash' }
}

package { 'shell_utilisateur':
	name => $shell_user,
	ensure => 'present',
}

# Utilisateur gilles, avec un shell non présent par défaut
user { 'gilles':
	ensure => 'present',
	comment => 'Gilles Pietri',
	shell => "/bin/${shell_user}",
	home => '/home/gilles',
	# Dépendance entre les 2 ressources
	require => Package['shell_utilisateur'],
}
