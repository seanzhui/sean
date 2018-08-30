<?php
namespace app\index\controller;
use app\index\controller\Common;
class About extends Common
{
    public function index($cid)
    {
        $cates=db('cate')->find($cid);//查询当前栏目信息
        $topcid=model('cate')->getTopId($cid);
        $topCates=db('cate')->find($topcid);//顶级栏目信息
        $sonCateRes=db('cate')->where(array('pid'=>$topcid))->where(array('status'=>1))->select();//根据主栏目id获取当前主栏目下所有二级栏目
        //面包屑
        $pos=model('cate')->position($cid);
        $this->assign([
            'cates'=>$cates,
            'topcid'=>$topcid,//当前栏目顶级栏目的id，用户顶级栏目的高亮显示
            'cid'=>$cid,//当前栏目的id,用于判断当前左侧子栏目高亮
            'topCates'=>$topCates,//顶级栏目
            'sonCateRes'=>$sonCateRes,//二级栏目
            'pos'=>$pos,//面包屑
        ]);
        return $this-> fetch('about/index');
    }
}
