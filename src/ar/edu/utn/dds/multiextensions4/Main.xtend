package ar.edu.utn.dds.multiextensions4

import java.util.List
import org.eclipse.xtend.lib.annotations.Data

class Main {

	def static void main(String[] args) {
		/* SOBRECARGA */
		val saludador = new SaludadorNormal
		val saludadorEnfatico = new SaludadorEnfatico
		val saludables = newArrayList(new Amigo, new Conocido("Carlos"), new Conocido("Miguel"))
		println(saludador.saludarATodos(saludables))
		println("=======================")
		println(saludadorEnfatico.saludarATodos(saludables))
		
	}
}

abstract class Saludador {
	abstract def String saludar(Saludable s)

	def saludarATodos(List<Saludable> s) {
		s.map[this.saludar(it)].join("\n")
	}
}

class SaludadorNormal extends Saludador {
	def dispatch saludar(Conocido conocido) {
		'''Cómo le va, don «conocido.nombre»?'''
	}

	def dispatch saludar(Amigo a) {
		"Qué hacés papá!?!?!?"
	}
}

class SaludadorEnfatico extends Saludador {

	def dispatch saludar(Conocido conocido) {
		'''HOLA KE ASE, «conocido.nombre»?'''
	}

	def dispatch saludar(Amigo a) {
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