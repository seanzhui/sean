<?php
namespace app\index\controller;
use app\index\controller\Common;
class Index extends Common
{
    public function index(){
        db('admin')->where('id', 1)->setInc('call',1);
        $art=db('archives')->limit(6)->order('id','desc')->select();
        $this->assign("art",$art);
        return $this-> fetch('index/index');
    }
}
