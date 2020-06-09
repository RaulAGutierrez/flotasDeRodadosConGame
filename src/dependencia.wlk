import rodados.*
import traffic.*

class Dependencia {
	const property flota = []
	var empleados
	const property registroPedidos = []
	
	method setEmpleados(cantidad) { empleados = cantidad }
	
	method agregarAFlota(rodado) {
		flota.add(rodado)
	}
	method quitarDeFlota(rodado) {
		if (not flota.isEmpty()) {
			flota.remove(rodado)
		}
	}
	method pesoTotalFlota() {
		return flota.sum( { rodado => rodado.peso() } )
	}
	method estaBienEquipada() {
		return (flota.size() >= 3) and (flota.all( { rodado => rodado.velocidadMax() >= 100 } ))
	}
	method capacidadTotalEnColor(color) {
		return (flota.filter( { rodado => rodado.color() == color })).sum( { rodado=> rodado.capacidad() } )
	}
	method colorDelRodadoMasRapido() {
		return (flota.max( { rodado => rodado.velocidadMax() } ).color())
	}
	method capacidadFaltante() {
		// version mejorada.
		return empleados - (flota.sum( { rodado => rodado.capacidad() } )).max(0)
		/*var capacidadFaltante = empleados - (flota.sum( { rodado => rodado.capacidad() } ))
		if (capacidadFaltante < 0) {
			capacidadFaltante = 0
		}
		return capacidadFaltante
		*/
	}
	method esGrande() {
		return (empleados >= 40) and (flota.size() >= 5)
	}
	method agregarAlRegistro(pedido) { registroPedidos.add(pedido) }
	method quitarDelRegistro(pedido) {
		if (not registroPedidos.isEmpty()) {
			registroPedidos.remove(pedido)	
		}	
	}
	method totalPasajerosEnPedidos() {
		return registroPedidos.count( { pedido => pedido.cantidadPasajeros() } )
	}
	method noPuedeSatisfacer(pedido) {
		return flota.any( { rodado => pedido.satisfacerPedido(rodado) } ) 
	}
	method pedidosRegistradosNoSatisfechos() {
		return registroPedidos.filter( { pedido => self.noPuedeSatisfacer(pedido) } )
	}
		
	method todosLosPedidosSonImcompatibledCon(color) {
		return registroPedidos.all( { pedido => pedido.estaEnColoresIncompatiblesEl(color) == color } )
	}
	
	method relajarPedidos() {
		registroPedidos.forEach( { pedido => pedido.relajar() } )
		}
}
