# Notify : utile pour afficher des informations sur la sortie ou dans les logs
notify { 'Manifeste basique pour garantir la presence d\'un utilisateur ': }

# Garantie sur le package zsh
package { 'zsh':
	ensure => 'present',
}

# Utilisateur gilles, avec un shell non présent par défaut
user { 'gilles':
	ensure => 'present',
	comment => 'Gilles Pietri',
	shell => '/bin/zsh',
	home => '/home/gilles',
	# Dépendance entre les 2 ressources
	require => Package['zsh'],
}
