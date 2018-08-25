<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
use auth\Auth;
use think\Request;
class Common extends Controller
{

    public function _initialize(){
        if(!session('uname')){
            $this->error('请先登录系统！','Login/index');
        }
        $request=Request::instance();
        $module=$request->module();//模块名
        $con=$request->controller();//控制器名
        $action=$request->action();//模型名
        $name=$module.'/'.$con.'/'.$action;//组合规则得到name

        // $this->assign([
        //    'con'=>$con,
        //    'name'=>$name,
        // ]);

        $auth=new Auth();

        //菜单显示隐藏
        //查询所属用户组
        $group=$auth->getGroups(session('id'));
        //打散成数组
        $rules=explode(',', $group[0]['rules']);

        $menu=array();
        $map['pid']=['=',0];//查询顶级规则
        $map['show']=['=',1];//显示的
        $map['id']=['in',$rules];//id要在数组当中
        $_map['id']=['in',$rules];//
        $menu=db('authRule')->where($map)->select();//根据以上条件查询
        //dump($menu);die;
        //根据一级规则查找其下的二级规则和三级规则
        foreach ($menu as $k => $v) {
            //需要满足在所属用户组下和一级规则下
            $menu[$k]['children']=db('authRule')->where($_map)->where(array('pid'=>$v['id'],'show'=>1))->select();
            foreach ($menu[$k]['children'] as $k1 => $v1) {
                $menu[$k]['children'][$k1]['children']=db('authRule')->where($_map)->where(array('pid'=>$v1['id'],'show'=>1))->select();
            }
        }
        $this->assign([
            //显示所拥有的规则
           'menu'=>$menu,
        ]);

        // if(!$auth->check($name,session('id'))){
        //    $this->error('没有该操作权限！');
        // }

    }



}
