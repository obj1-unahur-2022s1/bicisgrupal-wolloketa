class Deposito {
	const bicisAlmacenadas = []
	
	method bicisRapidas() = bicisAlmacenadas.filter{ b => b.velocidadDeCrucero() > 25}
	method marcas() = bicisAlmacenadas.map{ b => b.marca() }.asSet()
	method esNocturno() = bicisAlmacenadas.all{ b => b.tieneLuz() }
	method tieneBiciParaLlevar(kgs) = bicisAlmacenadas.any{ b => b.carga() > kgs }
	
	// 3. Más sobre el depósito
	method marcaDeBiciMasRapida() = bicisAlmacenadas.max({b => b.velocidadDeCrucero()}).marca()
	method cargaTotalBicisLargas() = self.bicisLargas().sum{ b => b.carga() }
	method bicisLargas() = bicisAlmacenadas.filter{ b => b.largo() > 170 }
	method cantSinAccesorios() = bicisAlmacenadas.count{ b => b.accesorios().size() == 0 }
	
	// 4. Bicis compañeras
	method bicisCompanierasDe(bici1) = self.todasBicisMenos(bici1).filter{
		b => b.marca() == bici1.marca() &&
		b.largo() - bici1.largo() <= 10
	}
	
	method todasBicisMenos(bici1) =
		if (bicisAlmacenadas.contains(bici1)) bicisAlmacenadas.remove(bici1)
		else bicisAlmacenadas 
}
