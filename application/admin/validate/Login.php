<?php
namespace app\admin\validate;
use think\validate;
class Login extends validate
{
	protected $rule=[
		'uname'=>'require|min:3',
		'password'=>'require|min:6',
	];

	protected $message=[
		'uname.require'=>'用户名不得为空！',
		'uname.min'=>'用户名不正确！',
		'password.require'=>'密码不能为空！',
		'password.min'=>'密码不能少于6位！',
	];

	protected $scene=[
		'login'=>['uname','password'=>'min:6'],
	];
}
