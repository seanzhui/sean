<?php
namespace app\admin\controller;
use app\admin\controller\Commom;
class Authrule extends Common
{
    public function index(){
        $confCount=db('authRule')->count();
        $ruleRes=db('authRule')->select();
        $ruleTree=model('authRule')->ruletree($ruleRes);
        $this->assign([
            'confCount'=>$confCount,
            'ruleTree'=>$ruleTree,
        ]);
        return $this->fetch('authrule/index');
    }

    public function add(){
        $ruleRes=db('authRule')->select();
        $ruleTree=model('authRule')->ruletree($ruleRes);
        $this->assign([
            'ruleTree'=>$ruleTree,
        ]);
        return $this->fetch('authrule/add');
    }
    public function create(){
        if(!request()->isPost()){
            $this->error('请求类型错误');
        }else{
            $data=input('post.');
            $validate=validate('authRule');
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError());
            }
            $add=db('authRule')->insert($data);
            if($add){
                $this->success('添加规则成功！','index');
            }else{
                $this->error('添加规则失败！');
            }
            return;
        }
    }


    public function edit(){
        $id=input('id');
        $rules=db('authRule')->find($id);
        $ruleRes=db('authRule')->select();
        $ruleTree=model('authRule')->ruletree($ruleRes);
        $this->assign([
            'ruleTree'=>$ruleTree,
            'rules'=>$rules,
        ]);
        return $this->fetch('authrule/edit');
    }
    public function update(){
        if(!request()->isPost()){
            $this->error('请求类型错误');
        }else{
            $data=input('post.');
            //验证
            $validate=validate('authRule');
            if(!$validate->scene('edit')->check($data)){
                $this->error($validate->getError());
            }
            $save=db('authRule')->update($data);
            if($save!==false){
                $this->success('修改规则成功！','index');
            }else{
                $this->error('修改规则失败！');
            }
            return;
        }
    }

    public function delete($id){
        $cid=model('authRule')->childrenids($id);
        $cid[]=$id;
        $del=db('authRule')->delete($cid);
        if($del){
            $this->success('删除成功！','index');
        }else{
            $this->error('删除失败！');
        }
    }

    public function ajaxlst(){
        if(request()->isAjax()){
        $ruleid=input('ruleid');
        $sonids=model('authRule')->childrenids($ruleid);
        echo json_encode($sonids);
        }else{
            $this->error('非法操作！');
        }
    }


}
