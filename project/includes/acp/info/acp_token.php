<?php

define('IN_PHPBB', true);
$phpbb_root_path = (defined('PHPBB_ROOT_PATH')) ? PHPBB_ROOT_PATH : './';
$phpEx = substr(strrchr(__FILE__, '.'), 1);
include($phpbb_root_path . 'common.' . $phpEx);


class token {

	private $token;
	private $asignado;
	private $fecha_vencimiento;

	function token() {
		$this->token=md5(gen_rand_string(15));
		$this->fecha_vencimiento=new DateTime();
		$this->asignado=false;
	}
	
	public function get_asignado() {
		return $this->asignado;
	}
	
	public function set_asignado($asignado) {
		$this->asignado=$asignado;
	}
	
	public function get_token() {
		return $this->token;
	}
	
	public function set_token($token) {
		$this->token=$token;
	}
	
	public function get_fecha_vencimiento() {
		return $this->fecha_vencimiento;
	}

	public function set_fecha_vencimiento($fecha_vencimiento) {
		if ($fecha_vencimiento==null) {
			$fecha_vencimiento=new DateTime();
		}
		$this->fecha_vencimiento=$fecha_vencimiento;
	}

}

?>