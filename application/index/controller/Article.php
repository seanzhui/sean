<?php
namespace app\index\controller;
use app\index\controller\Common;
class Article extends Common
{
    public function index($cid)
    {
        $cates=db('cate')->find($cid);//查询当前栏目信息
        
        //获取对应的附加表的名称
        $models=db('model')->field('table_name')->find($cates['model_id']);
        $addTableName=$models['table_name'];
        //获取当前栏目以及其子栏目的id
        $sid=model('admin/cate')->childrenids($cid);
        $sid[]=intval($cid);
    	//调用文章
        $map['cate_id']=array('in',$sid);
        //要求上级栏目和他对应的子栏目必须使用同一个模型
    	$artRes=db('archives')->alias('a')->where($map)->join("$addTableName b",'a.id=b.aid')->order('a.id desc')->select();
        //顶级栏目id获取
        $topcid=model('cate')->getTopId($cid);
        $topCates=db('cate')->find($topcid);//顶级栏目信息
        //查询二级栏目
        $sonCateRes=db('cate')->where(array('pid'=>$topcid))->where(array('status'=>1))->select();//根据主栏目id获取当前主栏目下所有二级栏目
        //面包屑
        $pos=model('cate')->position($cid);
    	$this->assign([
            'cates'=>$cates,
    		'artRes'=>$artRes,
            'topcid'=>$topcid,
            'cid'=>$cid,
            'topCates'=>$topCates,
            'sonCateRes'=>$sonCateRes,
            'pos'=>$pos,
    	]);
        return $this-> fetch('article/artlist');
    }

    public function article($aid){

        $arts=db('archives')->find($aid);
    	$cid=$arts['cate_id'];
    	$cates=db('cate')->find($cid);
    	//获取对应的附加表的名称
        $models=db('model')->field('table_name')->find($cates['model_id']);
        $addTableName=$models['table_name'];
        $arts=db('archives')->alias('a')->join("$addTableName b",'a.id=b.aid')->find($aid);
        //上下文章
        $front=db('archives')->field('id,title')->where("id<".$aid)->where('cate_id','=',$cid)->order('id')->limit('1')->find();
        $after=db('archives')->field('id,title')->where("id>".$aid)->where('cate_id','=',$cid)->order('id')->limit('1')->find();
    	// dump($front); die;
    	//顶级栏目id获取
        $topcid=model('cate')->getTopId($cid);
        $topCates=db('cate')->find($topcid);//顶级栏目信息
        //查询二级栏目
        $sonCateRes=db('cate')->where(array('pid'=>$topcid))->where(array('status'=>1))->select();//根据主栏目id获取当前主栏目下所有二级栏目
        //面包屑
        $pos=model('cate')->position($cid);
        $this->assign([
            'front'=>$front,
            'after'=>$after,
    		'arts'=>$arts,
            'topcid'=>$topcid,
            'cid'=>$cid,
            'topCates'=>$topCates,
            'sonCateRes'=>$sonCateRes,
            'curCates'=>$cates,
            'pos'=>$pos,
    		]);
    	return $this->fetch('article/article');
    }



}
