<?php
namespace app\admin\controller;
use think\Db;
use app\admin\controller\Commom;
class Model extends Common
{
    public function index(){
        $confCount=db('model')->count();
        $modelRes=db('model')->order('id desc')->paginate(10);
        $prefix=config("database.prefix");//表前缀
        $this->assign(array(
            'modelRes'=>$modelRes,
            'prefix'  =>$prefix,
            'confCount'=>$confCount,
            ));
        return  $this->fetch('model/index');
    }

    public function add(){

        return  $this->fetch('model/add');
    }

    public function create(){
        if(!request()->isPost()){
            $this->error("请求类型错误");
        }else{
            $data=input('post.');
    		$validate=validate('model');
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError());
            }
            //添加成功后创建一张表
    		$add=db('model')->insert($data);
    		if($add){
    			$tableName=$data['table_name'];//表名
    			$tableName=config("database.prefix").$tableName;//动态配置添加表前缀，连接上表名
    			$sql="create table {$tableName} (aid int unsigned not null) engine=MYISAM default charset=utf8";//创建一张表括号内是默认字段
    			Db::execute($sql);//执行sql语句创建表
    			$this->success('添加模型成功！',url('index'));
    		}else{
    			$this->error('添加模型失败！');
    		}
    		return;
        }
    }

    public function edit($id){
        $models=db('model')->find($id);
    	$this->assign('models',$models);
        return  $this->fetch('model/edit');
    }

    public function save(){
        if(!request()->isPost()){
            $this->error('请求类型错误！');
        }else{
            $data=input('post.');
            //在更改前获取$this的附加表名
            $oldTableName=db('model')->field('table_name')->find($data['id']);
            $oldTableName=$oldTableName['table_name'];//数组拆分成字符串，然后才好对比
            //验证
            $validate=validate('model');
            if(!$validate->scene('edit')->check($data)){
                $this->error($validate->getError());
            }
            //更改表字段
            $save=db('model')->update($data);

            //更改附加表名，如果更改了才执行
            if($oldTableName != $data['table_name']){
                //得到表前缀然后拼接得到表名
                $prefix=config("database.prefix");
                $oldTableName=$prefix.$oldTableName;
                //新的表名，然后把旧的更替
                $tableName=$prefix.$data['table_name'];
                $sql=" alter table {$oldTableName} rename {$tableName} ";
                Db::execute($sql);
            }
            if($save !== false){
                $this->success('修改模型成功！',url('index'));
            }else{
                $this->error('修改模型失败！');
            }
            return;

        }
    }


    //ajax删除模型
    public function ajaxdel(){
    	$modelId=input('id');
    	$tableName=input('table_name');
        //删除表记录
    	$del=db('model')->delete($modelId);
        //删除附加表
    	$sql="drop table {$tableName}";
    	Db::execute($sql);
    	if($del){
    		echo 1;//删除记录和附加表成功
    	}else{
    		echo 2;//删除失败
    	}
    }

    //ajax异步修改模型状态
    public function changestatus(){
        if(request()->isAjax()){
            $modelid=input('modelid');
            $status=db('model')->field('status')->where('id',$modelid)->find();
            $status=$status['status'];//查询到的是数组的形式，需转换成数字的形式
            if($status==1){
                db('model')->where('id',$modelid)->update(['status'=>0]);
                echo 1;//由显示改为隐藏
            }else{
                db('model')->where('id',$modelid)->update(['status'=>1]);
                echo 2;//由隐藏改为显示
            }
        }else{
            $this->error("非法操作！");
        }
    }



}
