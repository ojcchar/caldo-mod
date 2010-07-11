<?php
define('IN_PHPBB', true);
$phpbb_root_path = '../../phpBB3/';
$phpEx = substr(strrchr(__FILE__, '.'), 1);
include($phpbb_root_path . 'common.' . $phpEx);
include('./includes/acp/dao/dao_conferencia.' . $phpEx);

$dao=new dao_conferencia($db);
foreach($dao->getConferencias(2) as $conferencia){
	print_r($dao->getCALDO($conferencia['conferencia_id_conferencia']));
}

?>
