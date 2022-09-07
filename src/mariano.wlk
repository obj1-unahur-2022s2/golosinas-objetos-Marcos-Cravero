import golosinas.*

object mariano {
	var golosinas = []
	var golosinasDesechadas = []
	
	method comprar(unaGolosina) {golosinas.add(unaGolosina)}
	method comprarVarias(lista) {golosinas.addAll(lista)}
	method vaciarBolsa() {golosinas.clear()}
	method quitarGolosina(unaGolosina) {
		golosinas.remove(unaGolosina)
		golosinasDesechadas.add(unaGolosina)
	}
	method cantidadDeGolosinas() = golosinas.size()
	method tieneLaGolosina(unaGolosina) = golosinas.contains(unaGolosina)
	method probarGolosinas() {golosinas.forEach({ g => g.mordisco()
//												  console.println("gusto: " + g.gusto() + "peso: " + g.peso())
	})}
	
	
	method hayGolosinaSinTACC() = 
					golosinas.any({g => g.libreGluten()})
				
	method hayGolosinaSinTACCconAll() = 
					!golosinas.all({g => g.libreGluten()})
	
	method preciosCuidados() = 
					golosinas.all({g => g.precio() <= 10})
					
	method preciosCuidadosConAny() = 
					!golosinas.any({g => g.precio() > 10})
					
	method golosinaDeSabor(unSabor) =
					golosinas.find({g => g.gusto() == unSabor})
						
	method golosinasDeSabor(unSabor) =
					golosinas.filter({g => g.gusto() == unSabor})	
	
	method sabores() = golosinas.map({g => g.gusto()}) //mariano.sabores().asSet()
	
	method golosinaMasCara() = 
					golosinas.max({g => g.precio()})
					
	method precioGolosinaMasCara() = self.golosinaMasCara().precio()
	
	method pesoGolosinas() = golosinas.sum({g => g.peso()})
	
	method golosinasFaltantes(golosinasDeseadas) =
					golosinasDeseadas.asSet().difference(golosinas.asSet()) 
					
	method golosinasFaltantes2(golosinasDeseadas) =
					golosinas.asSet().difference(golosinasDeseadas.asSet()) 
					
	method gustosFaltantes(gustosDeseados) = 
					gustosDeseados.asSet().difference(self.sabores())
	
// Métodos desafío
	
	method gastoEn(sabor) = self.golosinaDeSabor(sabor).sum({g => g.precio()})
	
	method precioGolosinaMasCaraDeUnSabor(sabor) =
					self.golosinaDeSabor(sabor).max({g => g.precio()}).precio()
					
	method cantGolosinasDeSabor(unSabor) =
					self.golosinasDeSabor(unSabor).size()
					
	method saborMasPopular() =
					self.sabores().max({s => self.cantGolosinasDeSabor(s)})
					
	method comproYDesecho(golosina) =
					golosinasDesechadas.contains(golosina)
}

