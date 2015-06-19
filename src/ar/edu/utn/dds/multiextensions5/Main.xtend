package ar.edu.utn.dds.multiextensions5

import ar.edu.utn.dds.multiextensions.Amigo

import static extension ar.edu.utn.dds.multiextensions5.StringUtils.*

class Main {

	def static void main(String[] args) {
		println("Zz".multiply(8))
		println(saludar("Perro", new Amigo))	
	}
}

