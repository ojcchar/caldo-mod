<?php

class conferencia {

	private $id_conferencia;
	private $fecha_realizacion;
	private $tema;

	function conferencia() {
		$this->id_conferencia=0;
		$this->fecha_realizacion=new DateTime();
		$this->tema=0;
	}

	public function get_id_conferencia() {
		return $this->id_conferencia;
	}

	public function get_fecha_realizacion() {
		return $this->fecha_realizacion;
	}

	public function get_tema() {
		return $this->tema;
	}

	public function set_id_conferencia($id=0) {
		$this->id_conferencia=$id;
	}

	public function set_fecha_realizacion($fecha_realizacion ) {
		if ($fecha_realizacion==null) {
			$fecha_realizacion=new DateTime();
		}
		$this->fecha_realizacion=$fecha_realizacion;
	}

	public function set_tema($tema="") {
		$this->tema=$tema;
	}



}

?>