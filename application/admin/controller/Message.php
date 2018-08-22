<?php
namespace app\admin\controller;
use think\Controller;
class Message extends Controller
{
    public function index(){
        $messageCount=db('message')->count();
        $messageDate=db('message')->paginate(15);
        // dump($messageDate);die;
        $this->assign([
            'messageCount'=>$messageCount,
            'messageDate'=>$messageDate,
        ]);
        return  $this->fetch('message/message');
    }

    public function delete($id){
        $del=db('message')->delete($id);
        if($del){
            $this->success('删除留言成功！','index');
        }else{
            $this->error('删除留言失败！');
        }
    }

    public function delAll(){
        if(!request()->post()){
            $this->error('请求类型错误');
        }else{
            $id=input('post.');
            if($id==true){
                $del=db('message')->where(array("id"=>$id))->delete($id);
                if($del){
                    $this->success('删除留言成功！','index');
                }else{
                    $this->error('删除留言失败！');
                }
            }else{
                $this->error('没有选定要删除的留言');
            }
        }
    }

    //ajax异步修改留言状态
    public function changestatus(){
        if(request()->isAjax()){
            $id=input('id');
            $status=db('message')->field('status')->where('id',$id)->find();
            $status=$status['status'];
            if($status==1){
                db('message')->where('id',$id)->update(['status'=>0]);
                echo 1;//由显示改为隐藏
            }else{
                db('message')->where('id',$id)->update(['status'=>1]);
                echo 2;//由隐藏改为显示
            }
        }else{
            $this->error("非法操作！");
        }
    }




}
