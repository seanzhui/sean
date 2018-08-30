<?php
namespace app\index\controller;
use app\index\controller\Common;
class Index extends Common
{
    public function index(){
        $art=db('archives')->limit(6)->order('id','desc')->select();
        $this->assign("art",$art);
        return $this-> fetch('index/index');
    }
}
