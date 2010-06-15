<?php

include 'includes/acp/info/acp_conferencia.php';
include 'includes/acp/info/acp_criterios_evaluacion.php';

$salto_linea = '<br/>';

prueba_criterios();
prueba_conferencia();

function prueba_criterios() {
	global $salto_linea;

	$criterio=new criterios_evaluacion();
	$criterio->set_nombre("Pruebasadasd");
	$criterio->set_descripcion("Pruebaddd");
	$criterio->set_id_criterio_evaluacion(12);

	echo($criterio->get_nombre().$salto_linea);
}

function prueba_conferencia() {
	global $salto_linea;

	$conf=new conferencia();
	echo($conf->get_fecha_realizacion()->format("d/m/Y").$salto_linea);

}


?>