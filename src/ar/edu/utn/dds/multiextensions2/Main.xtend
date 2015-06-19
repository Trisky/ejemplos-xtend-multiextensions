package ar.edu.utn.dds.multiextensions2

import java.util.List
import org.eclipse.xtend.lib.annotations.Data

class Main {
	
	def static void main(String[] args) {
		/* SOBRECARGA */
		
		val saludador = new Saludador
		println(saludador.saludar(new Amigo))
		println(saludador.saludar(new Conocido("Carlos")))
	}
}

class Saludador {
	def saludar(Conocido conocido) {
		'''Cómo le va, don «conocido.nombre»?'''
	}
	
	def saludar(Amigo a) {
		"Qué hacés papá!?!?!?"
	}
	
//	def saludarATodos(List<Saludable> saludables) {
//		saludables.forEach [ this.saludar(it) ]
//	}
}

interface Saludable {
	
}

@Data class Conocido implements Saludable{
	String nombre
}

class Amigo implements Saludable{
	
}