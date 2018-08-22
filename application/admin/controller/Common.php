<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
class Common extends Controller
{

    public function _initialize(){
        if(!session('uname')){
            $this->error('请先登录系统！','Login/index');
        }


    }



}
