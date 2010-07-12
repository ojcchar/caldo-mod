<?php

class criterios_evaluacion {

	private $id_criterio_evaluacion;
	private $nombre;
	private $descripcion;

	public function criterios_evaluacion() {
		$this->id_criterio_evaluacion=null;
		$this->nombre=null;
		$this->descripcion=null;
	}

	public function get_id_criterio_evaluacion() {
		return $this->id_criterio_evaluacion;
	}

	public function get_nombre() {
		return $this->nombre;
	}

	public function get_descripcion() {
		return $this->descripcion;
	}

	public function set_id_criterio_evaluacion($id) {
		$this->id_criterio_evaluacion=$id;
	}

	public function set_nombre($nombre) {
		$this->nombre=$nombre;
	}

	public function set_descripcion($desc) {
		$this->descripcion=$desc;
	}

}

?>