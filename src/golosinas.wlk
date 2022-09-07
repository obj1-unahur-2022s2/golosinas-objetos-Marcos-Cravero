object bombon {
	var peso = 15
	
	method precio() = 5
	method peso() = peso 
	method mordisco() {peso = 0.max(peso * 0.8 - 1)}
	method gusto() = "frutilla"
	method libreGluten() = true 
}

object alfajor {
	var peso = 300
	
	method precio() = 12
	method peso() = peso 
	method mordisco() {peso = 0.max(peso * 0.8)}
	method gusto() = "chocolate"
	method libreGluten() = false 
}

object caramelo {
	var peso = 5
	
	method precio() = 1
	method peso() = peso 
	method mordisco() {peso = 0.max(peso * 0.8 - 1)}
	method gusto() = "frutilla"
	method libreGluten() = true 
}

object chupetin {
	var peso = 7
	
	method precio() = 2
	method peso() = peso 
	method mordisco() { if(peso > 2) peso *= 0.9 }
	method gusto() = "naranja"
	method libreGluten() = true 
}

object oblea {
	var peso = 250
	
	method precio() = 5
	method peso() = peso 
	method mordisco() { 
		if(peso > 70) { 
			peso *= 0.5 
		} else {
			peso *= 0.75
		}
	}
	method gusto() = "naranja"
	method libreGluten() = false 
}

object chocolatin {
	var pesoInicial
	var pesoActual
	
	method precio() = pesoInicial * 0.5
	method peso() = pesoActual 
	method mordisco() {pesoActual = 0.max(pesoActual - 2)}
	method gusto() = "chocolate"
	method libreGluten() = false 
	
	method pesoInicial(cuanto) { 
		pesoInicial = cuanto
		pesoActual = cuanto
	}
}

object golosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	
	method baniaA(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() = golosinaInterior.precio() + 2
	method peso() = golosinaInterior.peso() + 4
	method mordisco() {
		golosinaInterior.mordisco()
		if (pesoBanio > 0) { pesoBanio -= 2 }
	}	
	method gusto() = golosinaInterior.gusto() 
	method libreGluten() = golosinaInterior.libreGluten()	
}

object tuttifrutti {
	const peso = 5
	var property libreGluten = false
	const gustos = ["frutilla", "chocolate", "naranja"]
	var cantMordiscos = 0
	
	method precio() {
		if(libreGluten) {
			return 7
		} else {
			return 10
		}
	}
	
	method peso() = peso 
	method mordisco() {cantMordiscos++}
	method gusto() = gustos.get(cantMordiscos % gustos.size())
}

