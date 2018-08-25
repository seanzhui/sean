<?php
namespace app\index\model;
use think\Model;
class Cate extends Model
{
    //面包屑导航
    public function position($cid){
        static $pos=array();
        if(empty($pos)){
            $cates=db('cate')->field('id,cate_name,pid,cate_attr')->find($cid);
            $pos[]=$cates;
        }
        $data=db('cate')->field('id,cate_name,pid,cate_attr')->select();//所有栏目信息
        $cates=db('cate')->field('id,cate_name,pid,cate_attr')->find($cid);//当前栏目信息
        foreach ($data as $k => $v) {
            if($cates['pid']==$v['id']){
                $pos[]=$v;
                $this->position($v['id']);
            }
        }
        return array_reverse($pos);
    }


    public function getTopId($cid){
        $data=db('cate')->field('id,pid')->select();
        // 查询后 将结果处理成 如下数组格式
        $arr=array();
        foreach ($data as $k => $v) {
            $arr[$v['id']]=$v['pid'];
        }
        // $arr = [
        //     // id => pid
        //     1 => 0,
        //     // 省略...
        //     5 => 1,
        //     // 省略...
        //     13 => 5
        // ];
        // 建议将这数组缓存起来

        $id = $cid;
        while($arr[$id]) {
            $id = $arr[$id];
        }
        return  $id; // 1
    }

    public function getPageContent($cid){
        $cates=$this->field('content')->find($cid);
        $content=strip_tags($cates['content']);
        $content=cut_str($content,66);
        return $content;
    }






}
