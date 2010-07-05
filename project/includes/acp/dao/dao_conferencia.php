<?php

include 'dao.'.$phpEx;

class dao_conferencia extends dao{

	private $CONFERENCIA_TABLE='conferencia';

	public function dao_conferencia($db){
		$this->db=$db;
	}

	private function objeto_to_array($objeto) {
		
		$sql_ary = array(
			'id_conferencia'	=>	$objeto->get_id_conferencia(),
			'fecha_realizacion'	=>	$objeto->get_fecha_realizacion()->format("Y/m/d"),
			'tema'	=>	$objeto->get_tema(),
			'numero_de_votos'	=>	$objeto->get_numero_votos(),
			'phpbb_forums_forum_id'	=>	$objeto->get_id_foro()
		);

		return $sql_ary;
	}

	public function crear($objeto){
		
		$sql_ary = $this->objeto_to_array($objeto);
		$sql='INSERT INTO '.$this->CONFERENCIA_TABLE.' '.$this->db->sql_build_array('INSERT', $sql_ary);
		
		$this->db->sql_query($sql);
		
		return $this->db->sql_nextid();
			
	}

	public function actualizar($objeto){
		throw new Exception('No implementado aun');
	}

	public function eliminar($objeto){
		throw new Exception('No implementado aun');
	}

	public function consultar($consulta){
		throw new Exception('No implementado aun');
	}

}

?>