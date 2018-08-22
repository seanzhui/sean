<?php
namespace app\admin\controller;
use app\admin\controller\Commom;
use think\Request;
use app\admin\model\Admin as AdminModel;
class Admin extends Common
{
    public function index(){
        $confCount=db('admin')->count();
        $adminRes=db('admin')->alias('a')->field('a.*,g.title')->join('auth_group g','a.groupid=g.id')->paginate(10);
        $this->assign([
            'confCount'=>$confCount,
            'adminRes'=>$adminRes,
    	]);
        return  $this->fetch('admin/admin');
    }


    public function add(){
        //所属用户组
        $groupRes=db('authGroup')->select();
        $this->assign([
            'groupRes'=>$groupRes,
        ]);
        return  $this->fetch('admin/add');
    }
    public function create(){
        if(!request()->isPost()){
            $this->error('请求类型错误');
        }else{
            $data=input('post.');
            //验证
            $validate=validate('admin');
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError());
            }
            if($data['password']){
                $data['password']=md5($data['name'].md5($data['password']));
            };
            $data['create_time']=time();
            $data['last_time']=time();
            $add=db('admin')->insertGetId($data);
            $_data=array();//对应管理员和用户组
            $_data['uid']=$add;
            $_data['group_id']=$data['groupid'];
            $addGroupAccess=db('authGroupAccess')->insert($_data);
            if($add && $addGroupAccess){
                $this->success('添加管理员成功！','index');
            }else{
                $this->error('添加管理员失败！');
            }
            return;
        }
    }

    public function edit(){
        $admins=db('admin')->find(input('id'));
        //所属用户组
        $groupRes=db('authGroup')->select();
        $this->assign([
            'admins'=>$admins,
            'groupRes'=>$groupRes,
        ]);
        return  $this->fetch('admin/edit');
    }
    public function update($id){
        $adminres=AdminModel::find($id);
        if(!request()->isPost()){
            $this->error('请求类型错误');
        }else{
            $data=input('post.');
            $validate = \think\Loader::validate('Admin');
            if(!$validate->scene('edit')->check($data)){
                $this->error($validate->getError());
            }
            if(!$data['name']){
                return $this->error('用户名未填写');//管理员用户名为空
            };
            if(!$data['password']){
                $data['password']=$adminres['password'];
            }else{
                $data['password']=md5($data['name'].md5($data['password']));
            };
            $saveadmin=AdminModel::update($data,$id);
            db('authGroupAccess')->where(array('uid'=>$data['id']))->update(['group_id'=>$data['groupid']]);
            if($saveadmin){
                return $this->success('修改管理员成功','index');
            }else{
                return $this->error('修改管理员失败');
            };
            return;
        }
        if(!$adminres){
            return $this->error('该管理员不存在');
        }
    }



    public function delete($id){
        if($id==1){
            $this->error('超级管理员不允许删除！');
        }
        $del=db('admin')->delete($id);
        if($del){
            $this->success('删除管理员成功！','index');
        }else{
            $this->error('删除管理员失败！');
        }
    }

    //ajax修改管理员状态
    public function changestatus(){
        if(request()->isAjax()){
            $id=input('id');
            $admins=db('admin')->field('status')->find($id);
            $status=$admins['status'];
            if($status==1){
                db('admin')->where(array('id'=>$id))->update(['status'=>0]);
            }else{
                db('admin')->where(array('id'=>$id))->update(['status'=>1]);
            }

        }else{
            $this->error("非法操作！");
        }
    }


    //通用头像上传接口
    public function upload()
    {
       if($this->request->isPost()){
            $res['code']=1;
            $res['msg'] = '上传成功！';
            $file = $this->request->file('file');
            $info = $file->move(ROOT_PATH . 'public/static/admin/images/adminimg');
            if($info){
                $res['name'] = $info->getFilename();
                $res['filepath'] = '/adminimg/'.$info->getSaveName();
             }else{
                $res['code'] = 0;
                $res['msg'] = '上传失败！'.$file->getError();
            }
            return $res;
         }
    }
    //删除头像
    public function delimg(){
        $imgurl=input('imgurl');
        $imgurl=ADMINIMG. $imgurl;
        $res=unlink($imgurl);
        if($cateid){
            db('admin')->setField('img','');
        }
        if($res){
            echo 1; //删除文件成功
        }else{
            echo 2;//删除文件失败
        }
    }

    //退出登录
    public function logout(){
        session(null);
        $this->success('退出成功！','Login/index');
    }


}
