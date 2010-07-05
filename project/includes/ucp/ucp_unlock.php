<?php
class ucp_unlock {
	function main($id, $mode) {
		global $db, $user, $auth, $template;
		global $config, $phpbb_root_path, $phpbb_admin_path, $phpEx;
		$submit = (!empty ($_POST['submit'])) ? true : false;
		switch ($mode) {
			case 'miscaldo' :
				$this->page_title = 'UCP_MIS_CALDO_TITLE';
				$this->tpl_name = 'ucp_unlock_mis_caldo';
				//$template->assign_vars(array);
				break;
			case 'hacercaldo' :
				$this->page_title = 'UCP_HACER_CALDO_TITLE';

				if ($submit) {
					$data = array (
						'token' => request_var('token', '')
						
					);
				} else {
					$this->tpl_name = 'ucp_unlock_hacer_caldo';
				}
				break;
			default :
				exit; //temporary
		}
	}
}
?>
