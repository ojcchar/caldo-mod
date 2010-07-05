<?php

abstract class dao{
	
	private $db;
	
	public function dao($db){
		$this->db=$db;
	}

	abstract public function crear($objeto);

	abstract public function actualizar($objeto);

	abstract public function eliminar($objeto);

	abstract public function consultar($consulta);

}


?>