<?php
namespace app\admin\controller;
use app\admin\controller\Commom;
use app\index\model\Cate as CateModel;
class Cate extends Common
{
    public function index(){
        $confCount=db('cate')->count();
        //获取前缀
        $prefix=config('database.prefix');
        $modelName=$prefix.'model';
        //连表查询,获取栏目
        $_cateRes=db('cate')->alias('a')->field('a.*,b.model_name')->join("$modelName b",'a.model_id = b.id')->order('sort desc')->select();
        $cateRes=model('cate')->catetree($_cateRes);

        $this->assign([
            'confCount'=>$confCount,
            'cateRes'=>$cateRes,
        ]);
        return  $this->fetch('cate/cate');
    }

    //ajax异步修改栏目显示状态
    public function changestatus(){
        if(request()->isAjax()){
            $cateid=input('cateid');
            $status=db('cate')->field('status')->where('id',$cateid)->find();
            $status=$status['status'];
            if($status==1){
                db('cate')->where('id',$cateid)->update(['status'=>0]);
                echo 1;//由显示改为隐藏
            }else{
                db('cate')->where('id',$cateid)->update(['status'=>1]);
                echo 2;//由隐藏改为显示
            }
        }else{
            $this->error("非法操作！");
        }
    }

    //查询子栏目
    public function ajaxcateinfo(){
        $cateid=input('cateid');
        $data=db('cate')->find($cateid);
        echo json_encode($data);
    }

    //子栏目收缩
    public function ajaxlst(){
        if(request()->isAjax()){
            $cateid=input('cateid');
            $sonids=model('cate')->childrenids($cateid);
            echo json_encode($sonids);
        }else{
            $this->error('非法操作！');
        }
    }

    //排序
    public function del_sort(){
        $data=input('post.');
        dump($data);
        if($data['itm']){
            model('cate')->pdel($data['itm']);
        }
        $this->success('数据处理成功！',url('lst'));
    }

    //新增显示
    public function add(){
        //获取栏目
        $_cateRes=db('cate')->select();
        $cateRes=model('cate')->catetree($_cateRes);
        //接受栏目id
        $cateid=input('cateid');
        //模型信息
        $modelRes=db('model')->field('id,model_name')->select();
        $this->assign(array(
            'cateRes'=>$cateRes,
            'cateid'=>$cateid,
            'modelRes'=>$modelRes,
        ));
        return  $this->fetch('cate/add');
    }

    //新增操作
    public function create(){
        if(!request()->isPost()){
            $this->error('请求类型错误');
    	}else{
            $data=input('post.');
            $validate=validate('cate');
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError());
            }
            $add=db('cate')->insert($data);
            if($add){
                $this->success('添加栏目成功！',url('index'));
            }else{
                $this->error('添加栏目失败！');
            }
            return;
        }
    }

    //检测用户名是否可用
    public function checkUserName(Request $request){
        $userName = trim($request -> param('name'));
        $status = 1;
        $message = '用户名可用';
        if (UserModel::get(['name'=> $userName])) {
            //如果在表中查询到该用户名
            $status = 0;
            $message = '用户名重复,请重新输入~~';
        }
        return ['status'=>$status, 'message'=>$message];
    }

    //显示修改栏目页面
    public function edit(){
        if(request()->isPost()){
            $data=input('post.');
            //判断是否隐藏栏目
            $_data=array();
            foreach ($data as $k => $v) {
                $_data[]=$k;
            }
            if(!in_array('status', $_data)){
                $data['status']=1;
            }
            //验证
            $validate=validate('cate');
            if(!$validate->scene('edit')->check($data)){
                $this->error($validate->getError());
            }
            //执行栏目修改操作
            $save=db('cate')->update($data);
            if($save!==false){
                $this->success('修改栏目成功！',url('index'));
            }else{
                $this->error('修改栏目失败！');
            }
            return;
        }
        //获取栏目
        $_cateRes=db('cate')->select();
        $cateRes=model('cate')->catetree($_cateRes);
        //接受栏目id
        $cateid=input('cateid');
        // var_dump($cateid);die;
        $cates=db('cate')->find($cateid);
        //模型信息
        $modelRes=db('model')->field('id,model_name')->select();
        $this->assign(array(
            'cateRes'=>$cateRes,
            'cates'=>$cates,
            'modelRes'=>$modelRes,
            ));
        return  $this->fetch('cate/edit');
    }

    //删除
    public function delete(){
        $cateid=input('cateid');
        $childrenids=model('cate')->childrenids($cateid);
        $childrenids[]=(int)$cateid;
        //删除栏目及文章相关资源
        foreach ($childrenids as $k => $v) {
            //删除栏目缩略图
            $cates=db('cate')->find($v);
            if($cates['img']){
                $imgSrc=ADMINIMG.$cates['img'];
                if(file_exists($imgSrc)){
                    @unlink($imgSrc);
                }
            }
            //获取当前栏目对应的模型的附加表名称
            $modelId=$cates['model_id'];
            $models=db('model')->field('table_name')->find($modelId);
            $tableName=$models['table_name'];//附加表名称
            //删除文章的操作
            $artRes=db('archives')->where(array('cate_id'=>$v))->select();
            //循环删除附加表里面的记录
            foreach ($artRes as $k1 => $v1) {
                db($tableName)->where(array('aid'=>$v1['id']))->delete();
            }
            //删除文章主表对应的缩略图和记录
            foreach ($artRes as $k1 => $v1) {
                //删除资源图片
                if($v1['litpic']){
                    $artSrc=INDEXIMG.$v1['litpic'];
                    if(file_exists($artSrc)){
                        @unlink($artSrc);
                    }
                }
                //删除记录
                db('archives')->delete($v1['id']);
            }
        }
        //结束
        $del=db('cate')->delete($childrenids);
        if($del){
            $this->success('删除栏目成功！',url('index'));
        }else{
            $this->error('删除栏目失败！');
        }
   }

    //通用缩略图上传接口
    public function upload(){
       if($this->request->isPost()){
            $res['code']=1;
            $res['msg'] = '上传成功！';
            $file = $this->request->file('file');
            $info = $file->move(ROOT_PATH . 'public/static/admin/images/cateimg');
            if($info){
                $res['name'] = $info->getFilename();
                $res['filepath'] = '/cateimg/'.$info->getSaveName();
             }else{
                $res['code'] = 0;
                $res['msg'] = '上传失败！'.$file->getError();
            }
            return $res;
         }
    }

    public function delimg(){
        $cateid=input('cateid');
        $imgurl=input('imgurl');
        $imgurl=ADMINIMG. $imgurl;
        $res=unlink($imgurl);
        if($cateid){
            db('cate')->where('id',$cateid)->setField('img','');
        }
        if($res){
            echo 1; //删除文件成功
        }else{
            echo 2;//删除文件失败
        }
    }



}
