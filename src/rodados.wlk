
object auto {
	var property activo
	const property listaActivos = []
	
	method agregarActivo(auto) {
		listaActivos.add(auto)
	}
	method quitarActivo(auto) {
		if (not listaActivos.isEmpty()) {
			listaActivos.remove(auto)
		}
	}
	method activarMovimiento() {
		if (self.activo() == "todos") {
			return listaActivos.map( { auto => self.activo(auto) } )
		} else {
			return self.activo()
		}
	}
}

class ChevroletCorsa {
	var property color
	var property image = "autitorojo.png"
	var property position
	const property historialPosiciones = []
	
	method capacidad() { return 4 } // pasajeros
	method velocidadMax() { return 150 } // Km/h
	method peso() { return 1300 } // Kg
	//method color() { return color }
	//method setColor(colorCambiado) { color = colorCambiado }
	method mostrarPosicion() { return self.position() }
	method mostrarHistorialPosicion() { return self.historialPosiciones() }
	method moverALaIzquierda() {
		self.position(self.position().left(1))
		historialPosiciones.add(self.position())	
	}
	method moverALaDerecha() {
		self.position(self.position().right(1))
		historialPosiciones.add(self.position())	
	}
	method moverArriba() {
		self.position(self.position().up(1))
		historialPosiciones.add(self.position())	
	}
	method moverAbajo() {
		self.position(self.position().down(1))
		historialPosiciones.add(self.position())	
	}
	method pasoPor(posicion) {
		return historialPosiciones.contains(posicion)
	}
	method pasoPorFila(numero) {
		return historialPosiciones.any( { x,y => numero == x })
	}
	method recorrioFilas(lista_de_numeros) {
		return lista_de_numeros.all( { numero => self.pasoPorFila(numero) } )
	} 
	method cambiarColor(nuevoColor) {
		self.color(nuevoColor)
		if (nuevoColor == colores.rojo()) {
			self.image("autitorojo.png")
		} else if (nuevoColor == colores.azul()) {
			self.image("autitoazul.png")
		} else if (nuevoColor == colores.verde()) {
			self.image("autitoverde.png")
			}
	}
}

class RenaultKwind {
	var tanqueAdicional = true
	
	method capacidad() {
		var pasajeros = 3
		if (not tanqueAdicional) {
			pasajeros = 4
		}
		return pasajeros
	}
	method velocidadMax() {
		var maxVelocidad = 110 // Km/h
		if (not tanqueAdicional) {
			maxVelocidad = 120 // Km/h
		}
		return maxVelocidad
	}
	method peso() {
		var peso = 1200 // Kg
		if (tanqueAdicional) {
			peso = peso + 150 // Kg
		}
		return peso
	}
	method color() { return colores.azul() }
	method noTieneGas() { tanqueAdicional = not tanqueAdicional }
}

class AutosEspeciales {
	var property capacidad  // numero de pasajeros
	var property velocidadMax   // Km/h
	var property peso   // Kg
	var property color  
	
	/*var capacidadPasajeros
	var velocidadMaxima
	var peso
	var color
	
	method capacidad() { return capacidadPasajeros } // pasajeros
	method setCapacidad(pasajeros) { capacidadPasajeros = pasajeros } // numero de pasajeros
	method velocidadMax() { return velocidadMaxima } // Km/h
	method setVelocidad(maxima) { velocidadMaxima = maxima }
	method peso() { return peso } // Kg
	method setPeso(kg) { peso = kg }
	method color() { return color }
	method setColor(colorCambiado) { color = colorCambiado }
	/* */
}

object colores {
	method verde() { return 'verde' }
	method azul() { return 'azul' }
	method blanco() { return 'blanco' }
	method negro() { return 'negro' }
	method rojo() { return 'rojo' }
	method beige() { return 'beige'}
}


