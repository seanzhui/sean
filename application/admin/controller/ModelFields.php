<?php
namespace app\admin\controller;
use think\Db;
use app\admin\controller\Commom;
class ModelFields extends Common
{
    public function index()
    {
        //自定义字段个数
        $confCount=db('model_fields')->count();
        //获取前缀然后得到表名
        $prefix=config('database.prefix');
        $modelName=$prefix.'model';
        //根据模型查询字段，知道字段类型
        $modelId=input('model_id');
        if($modelId){
            //model_fields的字段与获取的相等
            $map['a.model_id']  = ['=',$modelId];
        }else{
            $map=1;
        }
        //连表查询，所属模型的
        $fieldRes=db('model_fields')->field('a.*,b.model_name')->alias('a')->join("$modelName b",'a.model_id=b.id')->where($map)->order('id desc')->paginate(10);
        $this->assign([
            'fieldRes'=>$fieldRes,
            'confCount'=>$confCount,
            ]);
        return $this->fetch('modelfields/index');
    }

    public function add(){
        if(request()->isPost()){
            $data=input('post.');
            //获取$this的附加表名
            $tableName=db('model')->field('table_name')->find($data['model_id']);
            $tableName=config("database.prefix").$tableName['table_name'];//与表前缀拼接
            //过滤中文"，"   可选值
            if($data['field_values']){
                $data['field_values']=str_replace('，', ',', $data['field_values']);
            }
            //验证数据
            $validate=validate('model_fields');
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError());
            }
            //添加
            $add=db('model_fields')->insert($data);
            if($add){
                //1到5是字符串
                //字段类型：1：单行文本 2：单选安按钮 3：复选框 4：下拉菜单 5：文本域 6：附件 7：浮点 8：整型 9：长文本类型 longtext
                switch ($data['field_type']) {
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 6:
                        $fileType='varchar(150) not null default ""';
                        break;
                    case 5:
                        $fileType='varchar(600) not null default ""';
                        break;
                    case 7:
                        $fileType='float not null default "0.0"';
                        break;
                    case 8:
                        $fileType='int not null default "0"';
                        break;
                    case 9:
                        $fileType='longtext';
                        break;
                    default:
                        $fileType='varchar(150) not null default ""';
                        break;
                }
                //向那张表中添加什么字段
                $sql="alter table {$tableName} add {$data['field_ename']} {$fileType}";
                Db::execute($sql);
                $this->success('添加字段成功！','index');
            }else{
                $this->error('添加字段失败！');
            }
            return;
        }
        $modelRes=db('model')->field('id,model_name')->select();
        $this->assign([
            'modelRes'=>$modelRes,
            ]);
        return $this->fetch('modelfields/add');

    }

    public function edit(){
        if(request()->isPost()){
            $data=input('post.');
            //获取前缀
            $prefix=config('database.prefix');
            $modelName=$prefix.'model';
            //连表查询所需要的表名及字段名称
            $fieldInfo=db('model_fields')->field('a.field_ename,b.table_name')->alias('a')->join("$modelName b",'a.model_id = b.id')->find($data['id']);
            //需要修改字段的表名
            $tableName=$prefix.$fieldInfo['table_name'];
            //需要修改的字段名称
            $oldFieldName=$fieldInfo['field_ename'];
            //过滤中文"，"
            if($data['field_values']){
                $data['field_values']=str_replace('，', ',', $data['field_values']);
            }
            //验证数据
            $validate=validate('model_fields');
            if(!$validate->scene('edit')->check($data)){
                $this->error($validate->getError());
            }
            //执行记录修改
            $save=db('model_fields')->update($data);
            //修改数据表的字段
            //字段类型：1：单行文本 2：单选安按钮 3：复选框 4：下拉菜单 5：文本域 6：附件 7：浮点 8：整型 9：长文本类型 longtext
                switch ($data['field_type']) {
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 6:
                        $fileType='varchar(150) not null default ""';
                        break;
                    case 5:
                        $fileType='varchar(600) not null default ""';
                        break;
                    case 7:
                        $fileType='float not null default "0.0"';
                        break;
                    case 8:
                        $fileType='int not null default "0"';
                        break;
                    case 9:
                        $fileType='longtext';
                        break;
                    default:
                        $fileType='varchar(150) not null default ""';
                        break;
                }
                // $sql="alter table {$tableName} add {$data['field_ename']} {$fileType}";
                $sql="alter table {$tableName} change {$oldFieldName}  {$data['field_ename']}  {$fileType}";
                Db::execute($sql);

            if($save){
                $this->success('修改字段成功!',url('index'));
            }else{
                $this->error('修改字段失败!');
            }
            return;
        }
        $modelRes=db('model')->field('id,model_name')->select();
        $modelFields=db('model_fields')->find(input('id'));
        $this->assign([
            'modelRes'=>$modelRes,
            'modelFields'=>$modelFields,
            ]);
        return $this->fetch('modelfields/edit');
    }

    //ajax删除字段
    public function ajaxdel(){
        $modelFieldsId=input('id');
        //获取前缀
        $prefix=config('database.prefix');
        $modelName=$prefix.'model';
        //连表查询所需要的表名及字段名称
        $fieldInfo=db('model_fields')->field('a.field_ename,b.table_name')->alias('a')->join("$modelName b",'a.model_id = b.id')->find($modelFieldsId);
        //需要删除字段的表名
        $tableName=$prefix.$fieldInfo['table_name'];
        //需要删除的字段名称
        $fieldName=$fieldInfo['field_ename'];
        $del=db('model_fields')->delete($modelFieldsId);
        //sql
        $sql="alter table  {$tableName}  drop column {$fieldName}";
        Db::execute($sql);
        if($del){
            echo 1;//删除记录和附加表成功
        }else{
            echo 2;//删除失败
        }

    }




}
