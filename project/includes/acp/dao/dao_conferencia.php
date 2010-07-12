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
		$fecha_r=	$objeto->get_fecha_realizacion()->format("Y/m/d");

		$sql_ary = array('fecha_realizacion'=>$fecha_r);

		$id_conf=	$objeto->get_id_conferencia();
		$tema=$objeto->get_tema();
		$num_v= $objeto->get_numero_votos();
		$id_for=	$objeto->get_id_foro();

		if ($id_conf!=null){
			$sql_ary ['id_conferencia' ] = $id_conf;
		}

		if ($tema!=null){
			$sql_ary [ 'tema'   ] =  $tema;
		}

		if ($num_v!=null){
			$sql_ary [ 'numero_de_votos'   ] =  $num_v;
		}

		if ($id_for!=null){
			$sql_ary ['phpbb_forums_forum_id'  ] =  $id_for;
		}

		return $sql_ary;
	}

	public function crear($objeto){

		$sql_ary = $this->objeto_to_array($objeto);
		$sql='INSERT INTO '.$this->CONFERENCIA_TABLE.' '.$this->db->sql_build_array('INSERT', $sql_ary);

		$this->db->sql_query($sql);

		return $this->db->sql_nextid();
			
	}

	public function actualizar($objeto){

		try {

			$id_conf=$objeto->get_id_conferencia();
			$objeto->set_id_conferencia(null);

			$sql_ary = $this->objeto_to_array($objeto);

			$sql='UPDATE '.$this->CONFERENCIA_TABLE.' SET '.$this->db->sql_build_array('UPDATE', $sql_ary);
			$sql.=' WHERE id_conferencia = '.$id_conf;

			$this->db->sql_query($sql);

		} catch (Exception $e) {
			$objeto->set_id_conferencia(	$id_conf);
			throw $e;
		}
		$objeto->set_id_conferencia(	$id_conf);

	}

	public function eliminar($objeto){

		try {

			$id_conf=$objeto->get_id_conferencia();
			$objeto->set_id_conferencia(null);

			$sql='DELETE FROM '.$this->CONFERENCIA_TABLE;
			$sql.=' WHERE id_conferencia = '.$id_conf;

			$this->db->sql_query($sql);

		} catch (Exception $e) {
			$objeto->set_id_conferencia(	$id_conf);
			throw $e;
		}

		$objeto->set_id_conferencia(	$id_conf);
	}

	//TODO: ponerle limites a las consultas
	public function consultar($objeto){

		$sql_ary = $this->objeto_to_array($objeto);

		$sql='SELECT * FROM '.$this->CONFERENCIA_TABLE.' WHERE '.$this->db->sql_build_array('SELECT', $sql_ary);

		$result = $this->db->sql_query($sql);

		$sql_ary = array();
		while ($attach_row = $this->db->sql_fetchrow($result))
		{
			try{
				$obj=new conferencia();
				$obj->set_id_conferencia($attach_row['id_conferencia']);
				$obj->set_id_foro($attach_row['phpbb_forums_forum_id']);
				$obj->set_fecha_realizacion(date('l dS \o\f F Y h:i:s A',strtotime ( $attach_row['fecha_realizacion'])));
				$obj->set_numero_votos($attach_row['numero_de_votos']);
				$obj->set_tema($attach_row['tema']);

				$sql_ary[] =$obj;
			}catch (Exception $e) {
				echo "No se pudo mapear un objeto ";
			}
		}

		$this->db->sql_freeresult($result);

		return $sql_ary;
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