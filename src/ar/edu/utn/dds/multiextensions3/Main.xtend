package ar.edu.utn.dds.multiextensions3

import java.util.List
import org.eclipse.xtend.lib.annotations.Data

class Main {
	
	def static void main(String[] args) {
		/* Multiple Dispatch */
		
		val saludador = new Saludador
		println(
			saludador.saludarATodos(
				newArrayList(new Amigo, new Conocido("Carlos"), new Conocido("Miguel"))
			)
		)
	}
}

class Saludador {
	def dispatch saludar(Conocido conocido) {
		'''Cómo le va, don «conocido.nombre»?'''
	}
	
	def dispatch saludar(Amigo a) {
		"Qué hacés papá!?!?!?"
	}
	
	def saludarATodos(List<Saludable> s) {
		s.map[ this.saludar(it) ].join("\n")
	}
}

interface Saludable {
	
}

@Data class Conocido implements Saludable{
	String nombre
}

class Amigo implements Saludable {
	
}