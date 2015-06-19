package ar.edu.utn.dds.multiextensions6

import java.util.List
import org.eclipse.xtend.lib.annotations.Data
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Map

class Main {
	
	def static void main(String[] args) {
		val fenomeno = new Amigo
		val mostro = new Amigo
		
		val saludador = new Saludador()
		
		saludador.addNick(fenomeno, "fenomeno")
		saludador.addNick(mostro, "mostro")
		
		println(saludador.saludarATodos(newArrayList(fenomeno, mostro)))
	}
}

class Saludador {
	@Accessors
	val Map<Amigo, String> nicknames = newHashMap()
	
	def dispatch saludar(Conocido conocido) {
		'''Cómo le va, don «conocido.nombre»?'''
	}
	
	def dispatch saludar(Amigo a) {
		'''Amigo «a.nickname», como andas che!?!?!?'''
	}
	
	def nickname(Amigo amigo) {
		nicknames.getOrDefault(amigo, "loco")
	}
	
	def saludarATodos(List<Saludable> s) {
		s.map[ this.saludar(it) ].join("\n")
	}
	
	def addNick(Amigo amigo, String nick) {
		nicknames.put(amigo, nick)
	}
	
}

interface Saludable {
	
}

@Data class Conocido implements Saludable{
	String nombre
}

class Amigo implements Saludable {
	
}