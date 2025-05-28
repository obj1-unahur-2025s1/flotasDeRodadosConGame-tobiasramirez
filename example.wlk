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
  method validos()= ["rojo" ,"verde","blanco","azul","negro","beige"]
}
class Kwid {
  var tieneTanque = false
  method capacidad() = if(self.tieneTanque()) 3 else 4
  method tieneTanque() = tieneTanque
}

object trafic {
  
}