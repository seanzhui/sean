<?php
namespace app\admin\controller;
use think\Cache;
use think\Session;
use app\admin\controller\Commom;
class Index extends Common
{
    public function index(){
        $adminid=session('id');
        $admindate=db('admin')->field('name,img,create_time,loat_ip,last_time,login_count')->find($adminid);
        $messageStatus=db('message')->where('status','=','1')->count();
        //获取前缀
        $prefix=config('database.prefix');
        $modelName=$prefix.'model';
        //连表查询,获取栏目
        $_cateRes=db('cate')->alias('a')->field('a.*,b.model_name')->join("$modelName b",'a.model_id = b.id')->order('sort desc')->select();
        $cateRes=model('cate')->catetree($_cateRes);
        $this->assign([
            'cateRes'=>$cateRes,
            'messageStatus'=>$messageStatus,
            'admindate'=>$admindate,
        ]);

        return  $this->fetch('index/index');
    }

    public function welcome(){
        // \phpmailer\Email::send('906437098@qq.com','tp5-emaiil','sucess-hala');
        // return '发送邮件成功';
        // return $this->fetch();

        $adminid=session('id');
        $admindate=db('admin')->field('name,img,create_time,loat_ip,last_time,login_count')->find($adminid);
        //文章数量
        $contentCount=db('archives')->count();
        $messageStatus=db('message')->count();
        $this->assign([
            'contentCount'=>$contentCount,
            'messageStatus'=>$messageStatus,
            'admindate'=>$admindate,
        ]);
        return  $this->fetch('index/welcome');
    }

    public function clear_sys_cache() {
        $date=Cache::clear();
        if($date){
            $this->success('清除缓存成功！',url('index'));
        }else{
            $this->error('清除缓存失败！');
        }
    }



}
