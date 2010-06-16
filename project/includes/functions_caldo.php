<?php


/**
* @ignore
*/
if (!defined('IN_PHPBB'))
{
	exit;
}

define('CRITERIOS_EVALUACION_TABLE','criterios_evaluacion');
define('CONFERENCIAS_TABLE','conferencia');

$phpbb_root_path = (defined('PHPBB_ROOT_PATH')) ? PHPBB_ROOT_PATH : './';
$phpEx = substr(strrchr(__FILE__, '.'), 1);
include($phpbb_root_path . 'common.' . $phpEx);

/** 
 * Crea un caldo para una conferencia en un foro específico
 *  @param	int		$topic_id	El id del foro en el que se desea crear el caldo
 *  @param	array	$criterios	Un array de los id's de los criterios que incluye el caldo 
 *  @param	array	$conferencia	Un array compuesto por 'titulo' y 'fecha', que da información sobre la conferencia a la que hará referencia el caldo
 *  @param	array	$votantes		Un array de los id's de los nombres de usuarios habilitados para votar
 *  @param	array	$conferencistas	Un array con los nombres de usuarios que actuaron como conferencisatas y que portanto pueden ver el resultado de sus caldos.
 */
function submit_caldo($topic_id,$criterios,$conferencia,$votantes,$conferencistas){
	//Verifique que exista el foro identificado por $forum_id
	$sql='SELECT COUNT(*) AS temas_count
		FROM '. TOPICS_TABLE ."
		WHERE topic_id=$db->sql_escape($topic_id)";
	$db->sql_query($sql);
	if(((int) $db->sql_fetchfield('temas_count'))==0){
		//Existe el tema
	}
	else{
		//No existe el tema
	}
	
	//Verifique que existan los criterios identificados por los id's en el array $criterios
	$criterios_sql = array();
	foreach($criterios as $criterio){
		array_push($criterios_sql,(int)$db->sql_escape($criterio)); //Impedir que haya id's de criterios maliciosos o no enteros
	}
	
	$sql = 'SELECT COUNT(*) as criterios_count
		FROM'. CRITERIOS_EVALUACION_TABLE.'
    	WHERE ' . $db->sql_in_set('id_criterios_evaluacion', $criterios_sql);
	$db->sql_query($sql);
	if (((int) $db->sql_fetchfield('criterios_count'))==count($criterios_sql)){
		//Existen todos los criterios
	}
	
	//Cree la conferencia y almacene su id en la variable $conferencia_id
	
	$sql = 'INSERT INTO '.CONFERENCIAS_TABLE."(fecha_realizacion,tema,phpbb_forums_forum_id)
		VALUES('".date('Y-m-d',$db->sql_escape($conferencia['fecha']))."','".$db->sql_escape($conferencia['titulo'])."',$db->sql_escape($topic_id)";
	if($db->sql_query($sql)){//Si la inserción se realiza exitosamente
		$conferencia_id=$db->sql_nextid();	
	}
	
	
	
	//Verifique la existencia de los nombres de usuarios en el array votantes y en el array conferencistas
	
	//Cree la conferencia y sus relaciones con los criterios y foro(s)
	
	//Cree las relaciones de conferencistas con conferencias.
	
	//Obtenga las direcciones de correo electrónico de los votantes
	
	//Genere tantos tokens como votantes haya y envíe cada uno a un correo de votante
	
}
/*! @function verify_tokens
    @abstract Verifica la validez de los tokens en la tabla tokens a partir de su fecha de vencimiento.
 */
function verify_tokens(){
	//Verificar token por token si la fecha de vencimiento ya pasó y borrar el token en caso de que se haya borrado
}

function submit_vote($conferencia_id,$token,$criterios){
	//Verificar la validez del token ... verificar si el token es válido para la conferencia?
	
	//Multiplicar el valor actual en el puntaje de cada criterio relacionado con la conferencia, por el número de votos, para obtener el total de la suma de puntajes hasta el momento
	
	//Sumarle uno al número de votos en la conferencia
	
	//Sumar los nuevos puntajes a cada acumulado de puntaje de criterio y luego dividir este nuevo acumulado entre el nuevo nnùmero de votos  y guardar esta información en cada criterio 
}
?>