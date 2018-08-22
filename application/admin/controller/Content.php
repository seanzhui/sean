<?php
namespace app\admin\controller;
use think\Db;
use app\admin\controller\Commom;
class Content extends Common
{

    //文档首页
    public function index(){
        //条数
        $confCount=db('archives')->count();
        //查询所属模型的
        $artRes=db('archives')->field('a.id,a.title,a.attr,a.model_id,a.litpic,c.cate_name,m.model_name')->alias('a')->join('tp_cate c','a.cate_id=c.id')->join('tp_model m','a.model_id=m.id')->order('a.id DESC')->paginate(15);
        //判断modelid和cateid是否存在，不存在不显示add方法
        $modelId=input('model_id');
    	$cateId=input('cate_id');
    	if(!$modelId){
    		$modelId=0;
    	}
    	$this->assign([
            'confCount'=>$confCount,
    		'modelId'=>$modelId,
    		'cateId' =>$cateId,
            'artRes'=>$artRes,
    	]);
        return  $this->fetch('content/index');
    }

    //文档首页
    public function indexlst(){
        //条数
        $confCount=db('archives')->count();
        //判断modelid和cateid是否存在，不存在不显示add方法
        $modelId=input('model_id');
        $cateId=input('cate_id');
        //查询所属模型的
        $artRes=db('archives')->field('a.id,a.title,a.attr,a.model_id,a.litpic,c.cate_name,m.model_name')->alias('a')->join('tp_cate c','a.cate_id=c.id')->join('tp_model m','a.model_id=m.id')->where('a.cate_id','=',$cateId)->order('a.id DESC')->paginate(15);
        if(!$modelId){
            $modelId=0;
        }
        $this->assign([
            'confCount'=>$confCount,
            'modelId'=>$modelId,
            'cateId' =>$cateId,
            'artRes'=>$artRes,
            ]);
        return  $this->fetch('content/index');
    }


    public function addselect(){
        //获取栏目
        $_cateRes=db('cate')->select();
        $cateRes=model('cate')->catetree($_cateRes);
        $this->assign([
            'cateRes'=>$cateRes,
            ]);
        return view();
    }

    public function ajaxGetModelId($cateid){
        $cates=db('cate')->field('model_id')->find($cateid);
        echo json_decode($cates['model_id']);
    }

    public function add(){
        $modelId=input('model_id');
        $cateId=input('cate_id');
        if(!$modelId){
            $modelId=0;
        }
        if(request()->isPost()){
            $data=input('post.');
            $columns=array();
            //获取前缀
            $prefix=config('database.prefix');
            //主文章表名称
            $tbArchives=$prefix.'archives';
            //主表里的字段
            $_columns=Db::query("SHOW COLUMNS FROM {$tbArchives}");
            foreach ($_columns as $v) {
                $columns[]=$v['Field'];
            }

            //附加表字段
            $archives=array();
            //附加表
            $addtable=array();
            foreach ($data as $k => $v) {
                if(in_array($k, $columns)){
                    if(is_array($v)){
                        $v=implode(',', $v);
                    }
                    $archives[$k]=$v;
                }else{
                    if(is_array($v)){
                        $v=implode(',', $v);
                    }
                    $addtable[$k]=$v;
                }
            }

            if($_FILES){
                foreach ($_FILES as $k => $v) {
                    if($v['name'] != ""){
                       $addtable[$k]=$this->uploadimg($k);
                    }
                }
            }
            $archives['time']=time();
            $archives['model_id']=$modelId;

            //获取附加表名称
            $tableName=db('model')->field('table_name')->find($modelId);
            $tableName=$tableName['table_name'];

            //添加主表数据并且返回id主键
            $addArchives=db('archives')->insertGetId($archives);
            $addtable['aid']=$addArchives;

            //添加附加表数据
            $_addTable=db($tableName)->insert($addtable);

            if($addArchives&&$_addTable){
                $this->success('添加数据成功！','index');
            }else{
                $this->error('添加数据失败！');
            }
            return;
        }


    	//获取栏目
        $_cateRes=db('cate')->select();
        $cateRes=model('cate')->catetree($_cateRes);
    	//获取当前模型自定义字段
    	$diyFields=db('model_fields')->where(['model_id'=>$modelId])->select();
        $longTextFields=db('model_fields')->where(['model_id'=>$modelId,'field_type'=>9])->select();
        $this->assign([
        	'cateRes'=>$cateRes,
        	'modelId'=>$modelId,
    		'cateId' =>$cateId,
    		'diyFields'=>$diyFields,
            'longTextFields'=>$longTextFields,
        	]);
        return  $this->fetch('content/add');
    }

    public function edit(){
        $modelId=input('model_id');
        $artId=input('art_id');
        if(!$modelId){
            $modelId=0;
        }
        //附加表数据
        $models=db('model')->field('table_name')->find($modelId);
        $tableName=$models['table_name'];
        $diyvals=db($tableName)->where(array('aid'=>$artId))->find();
        if(request()->isPost()){
            $data=input('post.');

            $columns=array();
            //获取前缀
            $prefix=config('database.prefix');
            $tbArchives=$prefix.'archives';//主文章表名称
            $_columns=Db::query("SHOW COLUMNS FROM {$tbArchives}");
            foreach ($_columns as $v) {
                $columns[]=$v['Field'];
            }
            $archives=array();
            $addtable=array();//附加表
            foreach ($data as $k => $v) {
                if(in_array($k, $columns)){
                    if(is_array($v)){
                        $v=implode(',', $v);
                    }
                    $archives[$k]=$v;
                }else{
                    if(is_array($v)){
                        $v=implode(',', $v);
                    }
                    $addtable[$k]=$v;
                }
            }
            //附加表单图或者多图上传处理
            if($_FILES){
                foreach ($_FILES as $k => $v) {
                    if($v['name'] != ""){
                       $addtable[$k]=$this->uploadimg($k);
                    }
                }
            }
            $saveArchives=db('archives')->update($archives);
            $saveAddtable=db($tableName)->where(array('aid'=>$archives['id']))->update($addtable);
            if($saveArchives !== false && $saveAddtable !== false){
                $this->success('修改数据成功！');
            }else{
                $this->error('修改数据失败！');
            }
            return;
        }
        //主表数据
        $arts=db('archives')->find($artId);
        //获取栏目
        $_cateRes=db('cate')->select();
        $cateRes=model('cate')->catetree($_cateRes);
        //获取当前模型自定义字段
        $diyFields=db('model_fields')->where(['model_id'=>$modelId])->select();
        $longTextFields=db('model_fields')->where(['model_id'=>$modelId,'field_type'=>9])->select();
        $this->assign([
            //此id下的所有子栏目
            'cateRes'=>$cateRes,
            //模型id
            'modelId'=>$modelId,
            //栏目内容的id
            'cateId' =>$arts['cate_id'],
            //自定义字段id
            'diyFields'=>$diyFields,
            //富文本
            'longTextFields'=>$longTextFields,
            'arts'=>$arts,
            'diyvals'=>$diyvals,
            //自定义字段所属模型
            'aid'=>$artId,
            ]);
        return  $this->fetch('content/edit');
    }



    public function delete(){
        $artId=input('art_id');
        $modelId=input('model_id');
        $archives=db('archives')->field('litpic')->find($artId);
        if($archives['litpic']){
            $litpicSrc=INDEXIMG.'/'.$archives['litpic'];
            if(file_exists($litpicSrc)){
                @unlink($litpicSrc);
            }
        }
        $delArchives=db('archives')->delete($artId);
        //获取模型表中的附加表名并删除数据
        $models=db('model')->field('table_name')->find($modelId);
        $addTable=$models['table_name'];
        $delAdds=db($addTable)->where(array('aid'=>$artId))->delete();

        if($delArchives && $delAdds){
            $this->success('删除文章成功！',url('index'));
        }else{
            $this->error('删除文章失败！');
        }
    }


    //附加表上传图片
    public function uploadimg($picName){
       $file = request()->file($picName);
       $info = $file->move(ROOT_PATH . 'public/static/index/uploads/attimg');
       if($info){
           return $info->getSaveName();
       }else{
           return $file->getError();
       }
    }

    //ajax异步删除附加表图片
    public function ajaxDelImg(){
        $aid=input('aid');
        $modelId=input('model_id');
        $fieldName=input('field_name');
        $models=db('model')->find($modelId);
        $tableName=$models['table_name'];//获取附加表名称
        $jl=db($tableName)->where(array('aid'=>$aid))->find();
        $imgSrc='/public/static/index/uploads/attimg/'.$jl[$fieldName];
        @unlink($imgSrc);
        //setField更新一个或多个字段
        $save=db($tableName)->where(array('aid'=>$aid))->setField($fieldName,'');
        if($save){
            echo 1;//删除图片成功
        }else{
            echo 2;//删除图片失败
        }

    }

   //通用缩略图上传接口
    public function upload(){
        if($this->request->isPost()){
            $res['code']=1;
            $res['msg'] = '上传成功！';
            $file = $this->request->file('file');
            $info = $file->move(ROOT_PATH . '/public/static/index/uploads/article');
            if($info){
                // if($this->config['thumb']=='是'){  //允许生产缩略图才执行
                //     $thumb_width=$this->config['thumb_width'];//宽，高，位置，透明度度
                //     $thumb_height=$this->config['thumb_height'];
                //     $water_pos=$this->config['water_pos'];
                //     $tmd=$this->config['tmd'];
                //     //缩略图裁剪方式(conf表中存的是文字，需转换成数字)
                //     switch ($this->config['thumb_way']) {
                //         case '等比例缩放':
                //             $thumb_way=1;
                //             break;
                //         case '缩放后填充':
                //             $thumb_way=2;
                //             break;
                //         case '居中裁剪':
                //             $thumb_way=3;
                //             break;
                //         case '左上角裁剪':
                //             $thumb_way=4;
                //             break;
                //         case '右下角裁剪':
                //             $thumb_way=5;
                //             break;
                //         case '固定尺寸缩放':
                //             $thumb_way=6;
                //             break;
                //
                //         default:
                //             $thumb_way=1;
                //             break;
                //     }
                //
                //     //水印图位置
                //     switch ($this->config['water_pos']) {
                //         case '左上角':
                //             $thumb_pos=1;
                //             break;
                //         case '上居中':
                //             $thumb_pos=2;
                //             break;
                //         case '右上角':
                //             $thumb_pos=3;
                //             break;
                //         case '左居中':
                //             $thumb_pos=4;
                //             break;
                //         case '居中':
                //             $thumb_pos=5;
                //             break;
                //         case '右居中':
                //             $thumb_pos=6;
                //             break;
                //         case '左下角':
                //             $thumb_pos=7;
                //             break;
                //         case '下居中':
                //             $thumb_pos=8;
                //             break;
                //         case '右下角':
                //             $thumb_pos=9;
                //             break;
                //         default:
                //             $thumb_pos=9;
                //             break;
                //     }
                //     //数据处理(获取图片路径)然后打开
                //     $imgSrc=INDEXIMG.$info->getSaveName();
                //     $image = \think\Image::open($imgSrc);
                //     //水印图片路径
                //     $water='/public/static/admin/images/uploads/'.$this->config['water_img'];
                //     if($this->config['water']=='是'){
                //         $image->thumb($thumb_width, $thumb_height,$thumb_way)->water($water,$thumb_pos,$tmd)->save($imgSrc);
                //         //生成缩略图、删除原图以及添加水印图片
                //     }else{
                //         $image->thumb($thumb_width, $thumb_height,$thumb_way)->save($imgSrc);
                //         //生成缩略图、删除原图
                //     }
                //
                // }
                $res['name'] = $info->getFilename();
                $res['filepath'] =$info->getSaveName();
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
        $imgurl=INDEXIMG. $imgurl;
        $res=unlink($imgurl);
        if($cateid){
            db('archives')->where('id',$cateid)->setField('litpic','');
        }
        if($res){
            echo 1;
            //删除文件成功
        }else{
            echo 2;
            //删除文件失败
        }
    }

}
