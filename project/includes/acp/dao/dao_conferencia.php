<?php

include 'dao.'.$phpEx;
define('CRITERIOS_TABLE','criterios_evaluacion');
define('CONFERENCIA_CRITERIOS_TABLE','criterios_evaluacion_conferencia');
define('CONFERENCIA_USERS_TABLE','phpbb_users_conferencia');
class dao_conferencia extends dao{
	private $CONFERENCIA_CRITERIOS_TABLE ='criterios_evaluacion_conferencia';
	private $CONFERENCIA_TABLE='conferencia';
	

	public function dao_conferencia($db){
		$this->db=$db;
	}

	private function objeto_to_array($objeto) {
		
		$sql_ary = array(
			//'id_conferencia'	=>	$objeto->get_id_conferencia(),
			'fecha_realizacion'	=>	$objeto->get_fecha_realizacion()->format("Y/m/d"),
			'tema'	=>	$objeto->get_tema(),
			'numero_de_votos'	=>	$objeto->sget_numero_votos(),
			'phpbb_topics_topic_id'	=>	$objeto->get_id_topic()
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
	
	public function getCALDO($conferencia_id){
		global $db;
		$id=$db->sql_escape($conferencia_id);
		$sql='SELECT puntuacion,nombre
		FROM '.CONFERENCIA_CRITERIOS_TABLE.','.CRITERIOS_TABLE."
		WHERE conferencia_id_conferencia=$id;";
		$result = $db->sql_query($sql);
		$result = $db->sql_fetchrowset($result);
		return $result;
	}
	public function getConferencias($user_id){
		global $db;
		if (!empty($user_id)){
			$id=$db->sql_escape($user_id);
			$sql='SELECT conferencia_id_conferencia
			FROM '.CONFERENCIA_USERS_TABLE."
			WHERE phpbb_users_user_id=$id;";
			$result = $db->sql_query($sql);
			$result = $db->sql_fetchrowset($result);
			return $result;				
		}
		
	}
	
	

}

?>