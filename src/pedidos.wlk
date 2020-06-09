import rodados.*

class Pedidos {
	var property distanciaARecorrer    // km
	var property tiempoMaximo     // hs.
	var property cantidadPasajeros    // numero de pasajeros
	const property coloresIncompatibles = []
	
	method agregarColorIncompatible(color) { coloresIncompatibles.add(color) }
	
	method quitarColorIncompatible(color) {
		if (not coloresIncompatibles.isEmpty()) {
			coloresIncompatibles.remove(color)
		}
	}
	
	method velocidadRequerida() { return distanciaARecorrer / tiempoMaximo }
	
	method satisfacerPedido(auto) { return
		((auto.velocidadMax() - self.velocidadRequerida()).abs() >= 10) and
		auto.capacidad() >=  cantidadPasajeros and
		coloresIncompatibles.all({ color => color != auto.color() })
	}
	
	method acelerar() { return self.tiempoMaximo(tiempoMaximo - 1) }
	
	method relajar() { return self.tiempoMaximo(tiempoMaximo + 1) }
	
	method estaEnColoresIncompatiblesEl(color) {
		return coloresIncompatibles.find( { colorIncompatible => colorIncompatible == color  } )
	} 	
}
