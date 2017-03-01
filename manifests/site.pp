# Déclaration de ma ressource, mais en passant un paramètre
class { 'bootstrap': 
	message => 'Ce noeud est gere par Puppet, et des classes evoluees',
}
include confssh
include puppet

class { 'utilisateur':
	username => 'toto',
}
