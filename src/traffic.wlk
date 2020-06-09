import rodados.*

object trafic {
	var capacidadPasajeros
	var pesoCapacidad
	var velocidadMaxima
	var pesoMotor
	const pesoTrafic = 4000
	
	method setInterior(tipoInterior) {
		capacidadPasajeros = tipoInterior.capacidad()
		pesoCapacidad = tipoInterior.peso()
	}
	method setMotor(tipoMotor) {
		velocidadMaxima = tipoMotor.velocidadMax()
		pesoMotor = tipoMotor.peso()
	}
	
	/*
	method interiorComodo() {
		capacidadPasajeros = 5 // Pasajeros
		pesoCapacidad = 700 // Kg
	}
	method interiorPopular() {
		capacidadPasajeros = 12 // Pasajeros
		pesoCapacidad = 1000 // Kg
	}
	method motorPulenta() {
		velocidadMaxima = 130 // Km /h
		pesoMotor = 800 // Kg
	}
	method motorBaraton() {
		velocidadMaxima = 80 // Km /h
		pesoMotor = 500 // Kg
	}  
	*/
	method capacidad() { return capacidadPasajeros } // pasajeros
	method velocidadMax() { return velocidadMaxima } // Km/h
	method peso() { return pesoTrafic + pesoMotor + pesoCapacidad } // Kg
	method color() { return colores.blanco() } 
	
}

class Interior {
	var capacidadPasajeros // cantidad pasajeros
	var pesoCapacidad  // Peso en Kg del interior
	
	method setCapacidad(pasajeros) { capacidadPasajeros = pasajeros }
	method capacidad() { return capacidadPasajeros } // pasajeros 
	method setPeso(kg) { pesoCapacidad = kg }
	method peso() { return pesoCapacidad }
}

class Motor {
	var velocidadMaxima // velocidad maxima que proporciona el motor
	var pesoMotor  // Peso motor
	
	method setVelocidadMax(kmxh) { velocidadMaxima = kmxh } // Km/h
	method velocidadMax() { return velocidadMaxima } // Km/h
	method setPesoMotor(kg) { pesoMotor = kg } // Kg
	method peso() { return pesoMotor }
}

