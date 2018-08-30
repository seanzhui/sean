<?php
namespace app\index\controller;
use app\index\controller\Common;
class Search extends Common
{
    public function index(){
        if(!request()->isPost()){
            $this->error('请求类型错误');
        }elseif(!input('keywords')){
            $this->error('没有搜索内容');
        }else{
            $keywords=input('keywords');
            $serRes=db('archives')->order('id desc')->where('title','like','%'.$keywords.'%')->select();
            $this->assign(array(
                'serRes'=>$serRes,
                'keywords'=>$keywords,
            ));
        };
        return $this-> fetch('search/index');
    }
}
