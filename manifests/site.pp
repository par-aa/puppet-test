# Déclaration de ma ressource, mais en passant un paramètre
include puppet


node /node[12]\.gilles/ {
	class { 'bootstrap': 
		message => 'Ce noeud est gere par Puppet, et des classes evoluees',
	}
	include confssh
}

node default {
}
