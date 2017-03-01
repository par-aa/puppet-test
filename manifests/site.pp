# Déclaration de ma ressource, mais en passant un paramètre
class { 'bootstrap': 
	message => 'Ce noeud est gere par Puppet, et des classes evoluees',
}
include confssh
include puppet

utilisateur { 'utilisateur_gilles':
	username => 'gilles',
}

utilisateur { 'utilisateur_toto':
	username => 'toto',
}


