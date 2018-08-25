<?php
namespace app\index\controller;
use app\index\controller\Common;
class Contact extends Common
{
    public function index()
    {
        $confRes=array();
        $_confRes=db('conf')->field('ename,value')->select();
        foreach ($_confRes as $k => $v) {
            $confRes[$v['ename']]=$v['value'];
        }
        $this->assign([
            'confRes'=>$confRes,
    	]);
        return $this-> fetch('contact/contact');
    }
    public function message(){
        if(!requst()->isAjax()){
            $this->error('请求类型错误');
        }else{
            $data=input('post.');
            
        }
    }
}
