package ar.edu.utn.dds.multiextensions

import java.util.List
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.Data

class Main {

	def static void main(String[] args) {

		val tincho = new Amigo

		val pablo = new Saludador()
		pablo.estrategiaSaludo = new SaludadorEnfatico
		pablo.addNick(tincho, "tincho")

		val List<Saludable> personas = #[tincho, new Conocido("Pepe")]
		println(pablo.saludarATodos(personas));
		
		pablo.estrategiaSaludo = new SaludadorNormal
		println(pablo.saludarATodos(personas));
		
		extension val estrategia = pablo.estrategiaSaludo
		println(pablo.saludar(tincho))
	}
}

class Saludador {

	@Accessors String nombre = "Pablo"

	@Accessors extension EstrategiaSaludo estrategiaSaludo

	@Accessors
	Map<Amigo, String> nicknames = newHashMap()

	def saludarATodos(List<Saludable> saludables) {
		saludables.map[unSaludable|this.saludar(unSaludable)].join("\n")
	}

	def getNick(Amigo a) {
		nicknames.getOrDefault(a, 'AMIGOU')
	}

	def setNick(Amigo a, String nick) {
		nicknames.put(a, nick)
	}

	def addNick(Amigo a, String nick) {
		a.nick = nick
	}

}

interface EstrategiaSaludo {
	def String saludar(Saludador s, Saludable sal)
}

class SaludadorNormal implements EstrategiaSaludo {
	def dispatch saludar(Saludador s, Conocido conocido) {
		'''Cómo le va, don «conocido.nombre»? Soy «s.nombre»!'''
	}

	def dispatch saludar(Saludador s, Amigo a) {
		"Qué hacés papá!?!?!?"
	}
}

class SaludadorEnfatico implements EstrategiaSaludo {

	def dispatch saludar(Saludador s, Conocido conocido) {
		'''QUE HACEEEEEEE «conocido.nombre»? Te acorda de mi, «s.nombre»'''
	}

	def dispatch saludar(extension Saludador s, Amigo a) {
		'''NOOOOOOOO, COMO ANDAAAAA «a.nick»'''
	}
}

@Data class Conocido implements Saludable {
	String nombre

}

class Amigo implements Saludable {
}

interface Saludable {
}








