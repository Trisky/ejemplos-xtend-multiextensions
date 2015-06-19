package ar.edu.utn.dds.multiextensions8

import ar.edu.utn.dds.multiextensions.Amigo
import static extension ar.edu.utn.dds.multiextensions8.ExtensionesLocas.*

class Main {

	def static void main(String[] args) {
		val l =#[3, "pepe", "canoa"]
		
		println(l.map[it.saludar(new Amigo)])	
	}
	
}