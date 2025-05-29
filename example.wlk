class Corsa {
  var color 
  method capacidad() = 4
  method velocidadMax() = 150
  method peso() = 1300
  method color() = color
  method color(nuevo) {color = nuevo}
  method initialize() {
    if(not colores.validos().contains(color)){
      self.error(color.toString() + " no es un color valido," + " los colores validos son " + colores.validos())
    
    }
  }
}
object colores{
  method validos()= [rojo, blanco,azul,verde]
}

class Kwid {
  var adicional = tanque
  method capacidad() = adicional.capacidad()
  method ponerTanque() {adicional = tanque}
  method sacarTanque() {adicional = sinAdicional}
  method velocidadMax() = adicional.velocidadMax()
  method peso() = 1200 + adicional.peso()
  method color() = azul
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
  var motor = null
  var interior = null
  method motor()=motor
  method motor(nuevo) {motor=nuevo}
  method interior() = interior
  method interior(nuevo) {interior=nuevo}
  method peso() = 4000 + interior.peso() + motor.peso()
  method velocidadMax()= motor.velocidadMax()
  method capacidad() = interior.capacidad()
  method color() = blanco
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
 
 class AutosEspeciales {
  const color
  const capacidad
  const velocidadMax
  const peso
  method color() = color
  method peso() = peso
  method capacidad() = capacidad
  method velocidadMax() = velocidadMax
 }
 class Dependencia {
  var rodados =[]
  var empleados = []
  method empleados() = empleados
  method cantidadEmpleados() = empleados.size()
  method agregarAFlota(rodado) {rodados.add(rodado)}
  method quitarDeFlota(rodado) {rodados.remove(rodado)}
  method pesoTotal() = rodados.sum{r=>r.peso()}
  method capacidadTotal() = rodados.sum({r=>r.capacidad()})
  method estaBienEquipada() = rodados.size() >= 3 and rodados.all({r=>r.velocidadMax() >=100})
  method capacidadTotalEnColor(color) = rodados.filter({r=>r.color() == color}).sum({r=>r.capacidad()})
  method colorDelRodadoMasRapido() = rodados.max({r=>r.velocidadMax()}).color()
  method capacidadFaltante() = self.cantidadEmpleados() - self.capacidadTotal()
  method esGrande() = empleados.size() >=40 and rodados.size()>=5
 }
object azul {

}
object verde {
  
  
}
object rojo {
  
}
object blanco {
  
}