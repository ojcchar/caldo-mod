<?php

define('IN_PHPBB', true);
$phpEx='php';
$phpbb_root_path = '/home/ojcchar1/Download/phpBB3' . DIRECTORY_SEPARATOR;
$phpbb_caldo_path = dirname(__FILE__) . DIRECTORY_SEPARATOR;
//
//$dbms = 'mysql';
//$dbhost = 'localhost';
//$dbport = '3306';
//$dbname = 'phpbb3';
//$dbuser = 'ojcchar';
//$dbpasswd = 'ojcchar';
//$table_prefix = '';
//$acm_type = 'file';
//$load_extensions = '';
//$db =null;
require($phpbb_root_path . 'common.' . $phpEx);


//echo 'Iniciando conexion a db...';
//
//$sql_db = 'dbal_' . $dbms;
//$db	= new $sql_db();
//
//$db->sql_connect($dbhost, $dbuser, $dbpasswd, $dbname, $dbport, false, defined('PHPBB_DB_NEW_LINK') ? PHPBB_DB_NEW_LINK : false);
//
?>