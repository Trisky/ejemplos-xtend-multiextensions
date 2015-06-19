package ar.edu.utn.dds.multiextensions8

import ar.edu.utn.dds.multiextensions.Saludable
import static extension ar.edu.utn.dds.multiextensions5.StringUtils.*

class ExtensionesLocas {
	static def dispatch saludar(String s, Saludable sal) {
		'''«s» saluda a ti'''
	}
	static def dispatch saludar(Integer i, Saludable s) {
		"hola".multiply(i)
	}
}