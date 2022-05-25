import bicis.*
import accesorios.*

class Deposito {
	const property bicisAlmacenadas = [] 
	
	method bicisRapidas() = bicisAlmacenadas.filter{ b => b.velocidadDeCrucero() > 25}
	method marcas() = bicisAlmacenadas.map({ b => b.marca() }).asSet()
	method esNocturno() = bicisAlmacenadas.all{ b => b.tieneLuz() }
	method tieneBiciParaLlevar(kgs) = bicisAlmacenadas.any{ b => b.carga() > kgs }
	
	// 3. Más sobre el depósito
	method marcaDeBiciMasRapida() = bicisAlmacenadas.max({b => b.velocidadDeCrucero()}).marca()
	method cargaTotalBicisLargas() = self.bicisLargas().sum{ b => b.carga() }
	method bicisLargas() = bicisAlmacenadas.filter{ b => b.largo() > 170 }
	method cantSinAccesorios() = bicisAlmacenadas.count{ b => b.accesorios().isEmpty() } 
	
	// 4. Bicis compañeras
	method bicisCompanierasDe(unaBici) = bicisAlmacenadas.filter{ b => b.esCompanieraDe(unaBici) }


	// 6. Desafíos
	
	method hayCompanieras() = bicisAlmacenadas.any{ b => !self.bicisCompanierasDe(b).isEmpty() }
	
	// Devuelve una lista con parejas de bicis compañeras, sin repetirse ninguna.
	// Ejemplo [bici1, bici2] y [bici2,bici1] sería una pareja repetida.
	method parejasDeCompanieras() = bicisAlmacenadas.map({ b => self.paresConSiguientesDe(b)}).flatten()
	
	// Devuelve una lista cuyos elementos son los pares que arma una bici + cada una de las siguientes de la lista que sea su compañera (lista con sublistas).
	method paresConSiguientesDe(unaBici) = self.bicisSiguientesCompanierasDe(unaBici).map{ b => new ParDeBicis(primeraBici= unaBici, segundaBici= b) }
	
	// Devuelve una lista cuyos elementos son las bicis que le siguen a una bici, que son sus compañeras.
	method bicisSiguientesCompanierasDe(unaBici) = self.elementosSiguientesDeEnLista(unaBici, bicisAlmacenadas).filter{ b => b.esCompanieraDe(unaBici) }
	
	// Devuelve una lista con los elementos siguientes del argumentado, segun el orden en la lista argumentada.
	method elementosSiguientesDeEnLista(elemento, lista) = lista.drop(self.indiceDeElementoEnLista(elemento, lista) +1)
	
	// Devuelve el índice de la lista argumentada, que le corresponde al elemento argumentado.
	method indiceDeElementoEnLista(elemento,lista) = (0..lista.size()-1).find{ i => lista.get(i) == elemento }


	method seHizoLaLuz() = self.elementosSiguientesDeEnLista(self.laPrimeraBiciConLuz(), bicisAlmacenadas).all{ b => b.tieneLuz() }
	
	method laPrimeraBiciConLuz() = bicisAlmacenadas.find{ b => b.tieneLuz() }
}


