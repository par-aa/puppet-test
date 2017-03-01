# Garantie sur le package zsh/bash
define utilisateur (String[2] $username = 'gilles') {
	$shell_user = $osfamily ? {
		'Debian' => 'zsh',
		'Suse' => 'bash',
	}

	if ! defined(Package[$shell_user]) {
		package { "$shell_user":
		}
	}

	# Utilisateur gilles, avec un shell non présent par défaut
	user { $username:
		ensure => 'present',
		comment => "Utilisateur Puppet ${username}",
		shell => "/bin/${shell_user}",
		home => "/home/${username}",
		# Dépendance entre les 2 ressources
		require => Package["$shell_user"],
	}
}
