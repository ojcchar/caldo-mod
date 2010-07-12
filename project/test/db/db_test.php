<?php

	include 'test/init.php';
	require($phpbb_caldo_path . '../includes/acp/info/acp_conferencia.' . $phpEx);
	require($phpbb_caldo_path . '../includes/acp/dao/dao_conferencia.' . $phpEx);

	$sql='SELECT COUNT(*) AS temas_count FROM tokens' ;
	$db->sql_query($sql);
	
	
	//test crear
	$dao_conf=new dao_conferencia($db);
	$objeto=new conferencia();
	$objeto->set_id_conferencia(null);
	$objeto->set_tema('tema1');
	$objeto->set_id_foro(1);
	$objeto->set_fecha_realizacion(new DateTime());
	
	$id_inserted=  $dao_conf->crear($objeto);

	//test update
	
	$objeto->set_id_conferencia($id_inserted);
	
	$objeto->set_tema('tema2');
	
	$dao_conf->actualizar($objeto);
	
	//test delete
	
//	echo $dao_conf->eliminar($objeto);
	
	//test consulta
	
	$objeto=new conferencia();
	$objeto->set_fecha_realizacion(new DateTime());
	
	
	$resultado=$dao_conf->consultar($objeto);
	echo $resultado;
?>