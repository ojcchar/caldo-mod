<?php

	include 'test/init.php';
	require($phpbb_caldo_path . '../includes/acp/info/acp_conferencia.' . $phpEx);
	require($phpbb_caldo_path . '../includes/acp/dao/dao_conferencia.' . $phpEx);

	$sql='SELECT COUNT(*) AS temas_count FROM tokens' ;
	$db->sql_query($sql);
	
	$dao_conf=new dao_conferencia($db);
	$objeto=new conferencia();
	$objeto->set_id_conferencia(null);
	$objeto->set_tema();
	$objeto->set_id_foro(1);
	
	echo $dao_conf->crear($objeto);
?>