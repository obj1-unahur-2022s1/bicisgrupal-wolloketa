class Bicicleta {
	const property rodado
	const property largo
	const property marca
	const property accesorios = []
	
	//method agregarAccesorio(unAccesorio) { accesorios.add(unAccesorio) }
	method altura() = rodado *2.5 + 15
	method velocidadDeCrucero() = if(largo>120) rodado +6
								  else rodado +2
	method carga() = accesorios.sum{ a => a.carga()}
	method peso() = rodado *0.5 + self.pesoTotalAccesorios()
	method pesoTotalAccesorios() = accesorios.sum{ a => a.peso()}
	method tieneLuz() = accesorios.any{ a => a.esLuminoso()}
	method cantAccesoriosLivianos() = accesorios.count{ a => a.peso() < 1}
	method esCompanieraDe(otraBici) = self.marca() == otraBici.marca() &&
									  self.largo() - otraBici.largo() <= 10
}

// Accesorios

object farolito {
	method peso() = 0.5
	method carga() = 0
	method esLuminoso() = true
}

object canasto {
	var property volumen = 0
	
	method peso() = volumen*0.1
	method carga() = volumen *2
	method esLuminoso() = false
}

object morralDeBici {
	var property largo = 0
	var property tieneOjoDeGato = false
	
	method peso() = 1.2
	method carga() = largo/3
	method esLuminoso() = tieneOjoDeGato
}
