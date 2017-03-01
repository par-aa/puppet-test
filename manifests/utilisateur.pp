# Garantie sur le package zsh
package { 'bash':
	ensure => 'present',
}

# Utilisateur gilles, avec un shell non présent par défaut
user { 'gilles':
	ensure => 'present',
	comment => 'Gilles Pietri',
	shell => '/bin/bash',
	home => '/home/gilles',
	# Dépendance entre les 2 ressources
	require => Package['bash'],
}
