<?php

class conferencia {

	private $id_conferencia;
	private $fecha_realizacion;
	private $tema;
	private $numero_votos;
	private $id_foro;

	function conferencia() {
		$this->id_conferencia=null;
		$this->fecha_realizacion=null;
		$this->tema=null;
		$this->numero_votos=null;
		$this->id_foro=null;
	}

	public function set_id_foro($id_foro) {
		return $this->id_foro=$id_foro;
	}

	public function get_id_foro() {
		return $this->id_foro;
	}

	public function set_numero_votos($num) {
		return $this->numero_votos=$num;
	}

	public function get_numero_votos() {
		return $this->numero_votos;
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

	public function set_id_conferencia($id) {
		$this->id_conferencia=$id;
	}

	public function set_fecha_realizacion($fecha_realizacion ) {
		$this->fecha_realizacion=$fecha_realizacion;
	}

	public function set_tema() {
		$this->tema=$tema;
	}

}

?>