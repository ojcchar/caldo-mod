<?php
/*! @function submit_caldo
    @abstract Crea un caldo para una conferencia en un foro específico 
    @param forum_id int - El id del foro en el que se desea crear el caldo
    @param criterios array - Un array de los id's de los criterios que incluye el caldo 
    @param conferencia array - Un array compuesto por 'titulo' y 'fecha', que da información sobre la conferencia a la que hará referencia el caldo
    @param Votantes array - Un array de los id's de los nombres de usuarios habilitados para votar
    @param conferencistas array - Un array con los nombres de usuarios que actuaron como conferencisatas y que portanto pueden ver el resultado de sus caldos.
    @result Boolean - Devuelve verdadero si la creación del caldo fue exitosa y falso en cualquier otro caso.
 */
function submit_caldo($forum_id,$criterios,$conferencia,$votantes,$conferencistas){
	//Verifique que exista el foro identificado por $forum_id
	
	//Verifique que existan los criterios identificados por los id's en el array $criterios
	
	//Cree la conferencia y almacene su id en la variable $conferencia_id
	
	//Verifique la existencia de los nombres de usuarios en el array votantes y en el array conferencistas
	
	//
}
?>