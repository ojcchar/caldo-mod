<?php
/*
 * Created on Jul 5, 2010
 *
 */
 class ucp_unlock_info
{
	function module()
	{
		return array(
			'filename'	=> 'ucp_unlock',
			'title'		=> 'UCP_UNLOCK',
			'version'	=> '0.0.1',
			'modes'		=> array(
				'miscaldo'		=> array('title' => 'UCP_MIS_CALDO', 'auth' => '', 'cat' => array('')),
				'hacercaldo'	=> array('title' => 'UCP_HACER_CALDO', 'auth' => '', 'cat' => array(''))
			),
		);
	}

	function install()
	{
	}

	function uninstall()
	{
	}
}
 
?>
