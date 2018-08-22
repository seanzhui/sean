<?php
namespace app\admin\controller;
use app\admin\controller\Commom;
use think\Request;
use app\admin\model\Admin as AdminModel;
class Admingroup extends Common
{

    public function index(){
        $confCount=db('authGroup')->count();
        $authGroupRes=db('authGroup')->paginate(15);
        $this->assign([
            'confCount'=>$confCount,
            'authGroupRes'=>$authGroupRes,
        ]);
        return  $this->fetch('admingroup/index');
    }

    public function add(){
        return  $this->fetch('admingroup/add');
    }
    public function create(){
        if(!request()->isPost()){
            $this->error('请求类型错误');
        }else{
            $data=input('post.');
            $validate=validate('authGroup');
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError());
            }
            $add=db('authGroup')->insert($data);
            if($add){
                $this->success('添加用户组成功！','index');
            }else{
                $this->error('添加用户组失败！');
            }
            return;
        }
    }

    public function edit(){
        $id=input('id');
        $authGroups=db('authGroup')->find($id);
        $this->assign([
            'authGroups'=>$authGroups,
        ]);
        return  $this->fetch('admingroup/edit');
    }
    public function update($id){
        if(!request()->isPost()){
            $this->error('请求类型错误');
        }else{
            $data=input('post.');
           //验证
           $validate=validate('authGroup');
           if(!$validate->scene('edit')->check($data)){
               $this->error($validate->getError());
           }
           $save=db('authGroup')->update($data,$id);
           if($save!==false){
               $this->success('修改用户组成功！','index');
           }else{
               $this->error('修改用户组失败！');
           }
           return;
        }
    }

    public function delete($id){
        //删除用户组前，先删除该用户组下所有管理员
        $delAdmin=db('admin')->where(array('groupid'=>$id))->delete();
        $del=db('authGroup')->delete($id);
        if($del && $delAdmin){
            $this->success('删除用户组成功！','index');
        }else{
            $this->error('删除用户组失败！');
        }
    }

    //异步修改用户组状态
    public function changeStatus(){
        $id=input('id');
        $authGroups=db('authGroup')->field('status')->find($id);
        if($authGroups['status']==1){
            db('authGroup')->where(array('id'=>$id))->update(['status'=>0]);
        }else{
            db('authGroup')->where(array('id'=>$id))->update(['status'=>1]);
        }
    }

    //分配权限
    public function power(){
        if(request()->isPost()){
            $data=input('post.');
            $rules=implode(',', $data['rules']);
            $save=db('authGroup')->where(array('id'=>$data['id']))->update(['rules'=>$rules]);
            if($save !== false){
                $this->success('分配权限成功！');
            }else{
                $this->error('分配权限失败！');
            }
            return;
        }
        $data=db('authRule')->where(['pid'=>0])->select();
        foreach ($data as $k => $v) {
            $data[$k]['children']=db('authRule')->where(['pid'=>$v['id']])->select();
            foreach ($data[$k]['children'] as $k1 => $v1) {
                $data[$k]['children'][$k1]['children']=db('authRule')->where(['pid'=>$v1['id']])->select();
            }
        }
        $id=input('id');
        $authGroups=db('authGroup')->find($id);
        $rules=explode(',',$authGroups['rules']);
        $this->assign([
            'authGroups'=>$authGroups,
            'data'=>$data,
            'rules'=>$rules,
        ]);
        return  $this->fetch('admingroup/power');
    }



}
