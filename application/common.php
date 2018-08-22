<?php
function isMobile()
{
   if (isset($_SERVER['HTTP_X_WAP_PROFILE'])) {
       return true;
   }
   if (isset($_SERVER['HTTP_VIA'])) {
       return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
   }
   if (isset($_SERVER['HTTP_USER_AGENT'])) {
       $clientkeywords = array('nokia', 'sony', 'ericsson', 'mot', 'samsung', 'htc', 'sgh', 'lg', 'sharp', 'sie-', 'philips', 'panasonic', 'alcatel', 'lenovo', 'iphone', 'ipod', 'blackberry', 'meizu', 'android', 'netfront', 'symbian', 'ucweb', 'windowsce', 'palm', 'operamini', 'operamobi', 'openwave', 'nexusone', 'cldc', 'midp', 'wap', 'mobile');
       if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
           return true;
       }
   }
   if (isset($_SERVER['HTTP_ACCEPT'])) {
       if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'textml') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'textml')))) {
           return true;
       }
   }
   return false;
}

// 百度编辑器
function get_ueditor($name,$value='',$width=800,$height=400){
	$str=<<<HTML
	<textarea name='$name' id='$name'>$value</textarea>
	<script type="text/javascript">
		UE.getEditor('$name',{initialFrameWidth:$width,initialFrameHeight:$height,});
	</script>
HTML;
	return $str;
};
