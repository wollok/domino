

object pozo {

	var fichas = []
	
	method initialize() {		
		self.crearFichas()
	}
	
	method crearFichas() {
		
		// (0..6) construye un rango que va desde 0 a 6. 
		// Un rango no es exactamente una colección, porque
		// no se puede agregar y quitar elementos de ahi
		// Pero es polimórfico para todas las cosas que impliquen 
		// iterar sin modificar. 
		// El primer rango, junto con el map va a crear una colección
		// donde cada elemento es otra colección con la familia de 
		// fichas correspondiente a un número particular.
		// El segundo rango con el map sirve para la construccion de cada familia en particular
		// Que el rango vaya hasta x evita la duplicación de fuchas, ya que 3->4 y 4->3 
		// es lo mismo para este dominio
		// Al finalizar los maps se arma algo asi: [[0->0], [1->0, 1->1], [2->0, 2->1, 2->3], ... ] 
		// El flatten lo que hace es aplanar una coleccion de colecciones
		// devolviendo una única colecciones con los elementos internos de las collecciones
		// Por jemeplo: [ 0->0, 1->0, 1->1, 2->0, 2->1, 2->3, ... ] 
		
		fichas = (0..6).map({x =>
			(0..x).map({y=>
				x->y
			})
		}).flatten() 
	}
	
	method fichas() {
		return fichas
	}
	
	method tomar() {
		const ficha = fichas.anyOne()
		fichas.remove(ficha)
		return ficha
	}
}
