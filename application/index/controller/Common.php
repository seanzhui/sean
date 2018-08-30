<?php
namespace app\index\Controller;
use think\Controller;
use think\Request;
use think\Session;
class Common extends Controller
{
    public function _initialize(){
        if(isMobile()){
            $this->redirect('mobile/index/index');
        }
        $cateRes=$this->getCate();//顶部导航
        // dump($cateRes);die;
        $this->confs=$this->getConf();//配置项
        $call=db('admin')->field('call')->where('id',1)->find();
        $this->assign([
            'call'=>$call,
            'cateRes'=>$cateRes,
            'confs'=>$this->confs,
    	]);

    }

    //顶部导航
    public function getCate(){
        $cateRes=db('cate')->where(array('pid'=>0,'status'=>1))->select();
        foreach ($cateRes as $k => $v) {
            $cateRes[$k]['children']=db('cate')->where(array('pid'=>$v['id'],'status'=>1))->select();
        }
        return $cateRes;
    }

    //获取配置项并重新组装
    public function getConf(){
        $confRes=array();
        $_confRes=db('conf')->field('ename,value')->select();
        foreach ($_confRes as $k => $v) {
            $confRes[$v['ename']]=$v['value'];
        }
        return $confRes;
    }


}
