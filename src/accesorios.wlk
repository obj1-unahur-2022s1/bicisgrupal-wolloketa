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

/* 5. Una pregunta
 * 
 * Para agregar nuevos accesorios habría que definir nuevos objetos que los representen,
 * que entiendan por lo menos los mensajes peso(), carga() y esLuminoso(), para respetar
 * el polimorfismo.
 * 
 */
