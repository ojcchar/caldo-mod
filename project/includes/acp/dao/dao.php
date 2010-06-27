<?php

interface dao{
	
	public function crear($objeto);
	
	public function actualizar($objeto);
	
	public function eliminar($objeto);
	
	public function consultar($consulta);
	
}


?>