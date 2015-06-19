package ar.edu.utn.dds.multiextensions5

import ar.edu.utn.dds.multiextensions.Saludable

class StringUtils {
	def static multiply(String s, Integer times) {
		(1 .. times).map[s].join
	}
	
	def static saludar(String str, Saludable s) {
		"Hola soy un String: " + str
	}
}