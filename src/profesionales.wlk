// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var property universidad
	var totalCobrado 
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method donarAAsociacion() {asociacionProfesionalesLitoral.recibirDonacion(totalCobrado)}
	
	
}


// a esta clase le faltan métodos
class ProfesionalVinculado {
	var universidad
	var totalCobrado 
	
	method universidad() { return universidad }
	
	method universidad(univ) { universidad = univ }
	
		method provinciasDondePuedeTrabajar() { return {universidad.provincia()} }
		
	method honorariosPorHora() { return universidad.honorario()}
	
	method donarAUniversidad() {universidad.recibirDonacion(totalCobrado/2)
								totalCobrado= totalCobrado/2
	}
	
	method gastarSinRegistro() {totalCobrado= 0}
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var universidad
	var totalCobrado
	var donacion 
	var property provinciasDondePuedeTrabajar
	var property honorariosPorHora
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method totalRecaudado()= totalCobrado+donacion
	
	method pasarDineroA(alguien, cuanto) {alguien.recibirDonacion(cuanto)}
	
	method recibirDonacion(cuanto){ donacion+= cuanto}
	
	
	
	

	
}


class Universidad {
	
	var property provincia
	var property honorario
	var property donaciones
	
	method recibirDonaciones(cuanto){
		
		donaciones+= cuanto
	}
	
	
}


class EmpresaDeServicios {
	
var property honorarioDeReferencia
var property profesionales 

method profesionalesCaros() {return profesionales.filter{sueldo=>sueldo.honorariosPorHora() > honorarioDeReferencia}}

method universidadesFormadoras() {return profesionales.map{profesional =>profesional.universidad()}.asSet()}

method profesionalMasBarato() {return profesionales.min{sueldo=>sueldo.honorariosPorHora()}}

method provinciaCubierta(provincia){ profesionales.any({ profesional => profesional.provinciasDondePuedeTrabajar().contains(provincia)})} //ojo en este
	
method cuantosEstudiaronEn(universidad) {profesionales.count{profesional => profesional.universidad().contains(universidad)}}

method profesionalPocoAtractivo(profesional) 
	{profesionales.any
		{empleado => empleado.provinciasDondePuedeTrabajar() == profesional.provinciasDondePuedeTrabajar() and empleado.honorariosPorHora() < profesional.honorariosPorHora() }
		}

}

object asociacionProfesionalesLitoral {
	
	var property totalRecaudado
	
	method recibirDonacion(cuanto) { totalRecaudado+= cuanto}
	
}




