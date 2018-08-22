<?php
namespace app\admin\controller;
use think\Controller;
class Emailconf extends Controller
{
    public function index(){
        if(request()->isPost()){
            $data=input('post.');

            return;
        }
        return  $this->fetch('emailconf/index');
    }



}
