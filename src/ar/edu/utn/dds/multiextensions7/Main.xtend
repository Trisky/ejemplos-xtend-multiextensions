package ar.edu.utn.dds.multiextensions7

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.Data

class Main {

	def static void main(String[] args) {
		/* SOBRECARGA */
		val saludador = new Saludador(new SaludadorNormal())
		val saludables = newArrayList(new Amigo, new Conocido("Carlos"), new Conocido("Miguel"))
		println(saludador.saludarATodos(saludables))
		println("=======================")
		saludador.estrategia = new SaludadorEnfatico()
		println(saludador.saludarATodos(saludables))
		
	}
	//		val conocido = new Conocido("Carlos")
//		extension val EstrategiaSaludo estrategia = saludador.estrategia
//		
//		println(saludador.saludar(conocido))
	
}

class Saludador {
	@Accessors
	extension EstrategiaSaludo estrategia
	
	new(EstrategiaSaludo estrategia) {
		this.estrategia = estrategia
	}

	def saludarATodos(List<Saludable> s) {
		s.map[this.saludar(it)].join("\n")
	}
}

interface EstrategiaSaludo {
	def String saludar(Saludador s, Saludable sa)
}

class SaludadorNormal implements EstrategiaSaludo {
	def dispatch saludar(Saludador s, Conocido conocido) {
		'''Cómo le va, don «conocido.nombre»?'''
	}

	def dispatch saludar(Saludador s, Amigo a) {
		"Qué hacés papá!?!?!?"
	}
}



class SaludadorEnfatico implements EstrategiaSaludo {

	def dispatch saludar(Saludador s, Conocido conocido) {
		'''HOLA KE ASE, «conocido.nombre»?'''
	}

	def dispatch saludar(Saludador s, Amigo a) {
		"OOOOOSSOOOOOOOO"
	}
}

//class SaludadorDoubleDispatch extends Saludador {
//	
//	override saludar(Saludable s) {
//		s.sosSaludadoPor(this)
//	}
//	
//}

interface Saludable {
}

@Data class Conocido implements Saludable {
	String nombre
}

class Amigo implements Saludable {
}