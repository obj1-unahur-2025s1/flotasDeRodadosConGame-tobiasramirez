class Corsa {
  var color 
  method capacidad() = 4
  method velocidadMax() = 150
  method peso() = 1300
  method color() = color
  method color(nuevo) {color = nuevo}
  method puedeSatisfacer(unPedido) {
    return self.velocidadMax() >= (unPedido.velocidadRequerida() + 10) and 
           self.capacidad() >= unPedido.pasajeros() and 
           (!unPedido.coloresIncompatibles().contains(self.color()))
  }
  method initialize() {
    if(not colores.validos().contains(color)){
      self.error(color.toString() + " no es un color valido," + " los colores validos son " + colores.validos())
    
    }
  }
}
object colores{
  method validos()= [rojo, blanco,azul,verde,beige,negro]
}

class Kwid {
  var adicional 
  method capacidad() = adicional.capacidad()
  method ponerTanque() {adicional = tanque}
  method sacarTanque() {adicional = sinAdicional}
  method velocidadMax() = adicional.velocidadMax()
  method peso() = 1200 + adicional.peso()
  method color() = azul
  method puedeSatisfacer(unPedido) {
    return self.velocidadMax() >= (unPedido.velocidadRequerida() + 10) and 
           self.capacidad() >= unPedido.pasajeros() and 
           (!unPedido.coloresIncompatibles().contains(self.color()))
  }
}
object sinAdicional {
   method peso() = 0
  method velocidadMax() = 110
  method capacidad() = 4
}
object tanque {
  method peso() = 150
  method velocidadMax() = 120
  method capacidad() = 3

}
object trafic {
  var motor = motorBataton
  var interior = interiorPopular 
  method motor()=motor
  method motor(nuevo) {motor=nuevo}
  method interior() = interior
  method interior(nuevo) {interior=nuevo}
  method peso() = 4000 + interior.peso() + motor.peso()
  method velocidadMax()= motor.velocidadMax()
  method capacidad() = interior.capacidad()
  method color() = blanco
  method puedeSatisfacer(unPedido) {
    return self.velocidadMax() >= (unPedido.velocidadRequerida() + 10) and 
           self.capacidad() >= unPedido.pasajeros() and 
           (!unPedido.coloresIncompatibles().contains(self.color()))
  }
 }
 object interiorComodo {
   method capacidad() = 5
   method peso() = 700
 }
 object interiorPopular {
   method capacidad() = 12
   method peso() = 1000  
 }

 object motorPulenta {
   method peso() = 800
   method velocidadMax() = 130

 }
 object motorBataton {
   method peso() = 500
   method velocidadMax() = 80
 }
 
 class AutoEspecial {
  const color
  const capacidad
  const velocidadMax
  const peso
  method color() = color
  method peso() = peso
  method capacidad() = capacidad
  method velocidadMax() = velocidadMax
  method puedeSatisfacer(unPedido) {
    return self.velocidadMax() >= (unPedido.velocidadRequerida() + 10) and 
           self.capacidad() >= unPedido.pasajeros() and 
           (!unPedido.coloresIncompatibles().contains(self.color()))
  }
 }
 class Dependencia {
  var property pedidos = []
  var rodados 
  var empleados 
  var coloresIncompatibles = #{}
  
  method empleados() = empleados
  method cantidadEmpleados() = empleados
  method agregarAFlota(rodado) {rodados.add(rodado)}
  method quitarDeFlota(rodado) {rodados.remove(rodado)}
  method pesoTotal() = rodados.sum{r=>r.peso()}
  method capacidadTotal() = rodados.sum({r=>r.capacidad()})
  method estaBienEquipada() = rodados.size() >= 3 and rodados.all({r=>r.velocidadMax() >=100})
  method capacidadTotalEnColor(color) = rodados.filter({r=>r.color() == color}).sum({r=>r.capacidad()})
  method colorDelRodadoMasRapido() = rodados.max({r=>r.velocidadMax()}).color()
  method capacidadFaltante() = self.cantidadEmpleados() - self.capacidadTotal()
  method esGrande() = empleados >=40 and rodados.size()>=5
  method totalPasajerosEnPedidos() = pedidos.sum({p=>p.pasajeros()})
  method losQueNoPuedenSerSatisfechos() = pedidos.filter({p=>self.noPuedeSatisfacerA(p)})
  
  method noPuedeSatisfacerA(unPedido) = !rodados.any({r=>r.puedeSatisfacer(unPedido)})
  method todosSonCompatiblesCon(unColor) = pedidos.all({p=>!p.coloresIncompatibles().contains(unColor)})
  method relajarATodos() = pedidos.forEach({p=>p.relajar()})
  method coloresIncompatibles() {
    pedidos.forEach({p=>coloresIncompatibles.add(p.coloresIncompatibles()) })
    return coloresIncompatibles
  }
  method colores() = rodados.map({r=>r.color()})
  
 }
object azul {

}
object verde {
  
  
}
object rojo {
  
}
object blanco {
  
}
object beige {
  
}
object negro {
  
}
class Pedido {
  var property distancia
  var  property tiempoMaximo
  var property pasajeros
  var property coloresIncompatibles
  
  method velocidadRequerida() = distancia / tiempoMaximo
  method puedeSatisfacerUnPedido(auto) {
    return auto.velocidadMax() >= (self.velocidadRequerida() + 10) and 
           auto.capacidad() >= pasajeros and 
           (!coloresIncompatibles.contains(auto.color()))
  }
  method acelerar() {tiempoMaximo-=1}
  method relajar() {tiempoMaximo+=1}
}