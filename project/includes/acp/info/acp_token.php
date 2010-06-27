<?php

class token {

	private $token;
	private $asignado;
	private $fecha_vencimiento;

	function token() {
		$this->token='';
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