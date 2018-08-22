<?php
namespace app\admin\controller;
use app\admin\controller\Commom;
class Conf extends Common
{
    public function indexlst(){
        if(request()->isPost()){
            $data=input('post.');
            $enameArr=db('conf')->column('ename');
            $confArr=array();
            //附件类型数据处理
            $imgcolumn=db('conf')->where('dt_type',6)->column('ename');
            foreach ($data as $k => $v) {
                $confArr[]=$k;
                if(is_array($v)){
                    $v=implode(',', $v);
                }
               db('conf')->where('ename',$k)->update(['value'=>$v]);
            }

            foreach ($enameArr as $k => $v) {
                if(!in_array($v, $confArr) && !in_array($v, $imgcolumn)){
                    db('conf')->where('ename',$v)->update(['value'=>'']);
                }
            }

            foreach ($imgcolumn as $k => $v) {
               if($_FILES[$v]['tmp_name'] != ''){
                    $file = request()->file($v);
                    $info = $file->move(ROOT_PATH . 'public/static/admin/images/uploads');
                    $imgSrc=$info->getSaveName();
                    if($imgSrc!=''){
                        db('conf')->where('ename',$v)->update(['value'=>$imgSrc]);
                    }
                }
            }
        }
        $conflst=db('conf')->select();
        $this->assign('confRes',$conflst);
        return  $this->fetch('conf/conflst');
    }


    public function index(){
        $confCount=db('conf')->count();
        $confRes=db('conf')->field('id,cname,ename,value,values')->paginate(10);
        $this->assign([
            'confRes'=>$confRes,
            'confCount'=>$confCount,
        ]);
        return  $this->fetch('conf/conf');
    }

    public function add(){
      return  $this->fetch('conf/add');
    }

    public function create(){
        if(!request()->isPost()){
            $this->error('请求类型错误！');
        }else{
            $data=input('post.');
            //过滤中文"，"   可选值
            if($data['values']){
                $data['values']=str_replace('，', ',', $data['values']);
            }
            $validate=validate('conf');
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError());
            }
            $add=db('conf')->insert($data);
            if($add){
                $this->success('添加配置项成功！',url('conf/index'));
            }else{
                $this->error('添加配置项失败！');
            }
        }
    }

    public function edit(){
        $edconf=db('conf')->find(input('id'));
        $this->assign('edconf',$edconf);
        return  $this->fetch('conf/edit');
    }

    public function update($id){
        if(!request()->isPost()){
            $this->error('请求类型错误！');
        }else{
            $data=input('post.');
            //过滤中文"，"   可选值
            if($data['values']){
                $data['values']=str_replace('，', ',', $data['values']);
            }
            $validate=validate('conf');
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError());
            }
            $save=db('conf')->update($data);
            if($save){
                $this->success('修改配置项成功！',url('conf/index'));
            }else{
                $this->error('修改配置项失败！');
            }
        }
    }


    public function delete($id){
        $del=db('conf')->delete($id);
        if($del){
            $this->success('删除配置项成功！',url('conf/index'));
        }else{
            $this->error('删除配置失败！');
        }
    }





}
