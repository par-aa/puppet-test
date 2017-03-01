# _Définition_ des ressources dans la classe
# Paramètre de classe : message : message à inclure à la fin du motd
class bootstrap (String $message = 'Ce noeud est gere par Puppet, pas touche.') {
	# Liste de paquets à installer
	# On pourra jouer sur Suse quand on aura des licences...
	if $osfamily == 'Debian' {
		$package_list =  [ 'bash-completion', 'tmux', 'atop', 'tree' ]
		# Si je passe un tableau en titre, toutes les ressources listées
		# sont réalisées, avec les mêmes attributs
		package { $package_list:
			ensure => 'present',
		}
	}

	
	file { '/etc/motd':
		ensure => 'present',
		content => "Bonjour, vous etes sur ${fqdn}, qui tourne sur ${os['name']} (${osfamily}), noyau version ${kernelrelease}\n${message}\n",
		mode => '0644',
		owner => 'root',
		group => 'root',
	}

	bootstrap::utilisateur { 'gilles': }
	bootstrap::utilisateur { 'toto': 
		ensure => 'absent',
	}

}
