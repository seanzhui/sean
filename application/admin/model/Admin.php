<?php
namespace app\admin\model;
use think\Model;
use think\Request;
class Admin extends Model
{
    public function login($data){
        $uname=$data['uname'];
        $password=md5($data['uname'].md5($data['password']));
        $admins=Admin::get(['uname'=>$uname]);
        if($admins){
            $_password=$admins['password'];
            if($_password==$password){
                if($admins['status']==0){
                    return 4;//管理员被禁用
                }
                $admins-> setInc('login_count');
                $admins-> save(['last_time'=> time()]);
                //ip
                $request = Request::instance();
                $ipRes=$request->ip();
                $admins-> save(['loat_ip'=>$ipRes]);

                session('uname',$uname);
                session('id',$admins['id']);
                return 1;//密码正确可以登录
            }else{
                return 2;//密码出错
            }
        }else{
            return 3;//用户不存在
        }
    }
    function get_client_ip($type = 0) {
        $type       =  $type ? 1 : 0;
        static $ip  =   NULL;
        if ($ip !== NULL) return $ip[$type];
        if($_SERVER['HTTP_X_REAL_IP']){//nginx 代理模式下，获取客户端真实IP
            $ip=$_SERVER['HTTP_X_REAL_IP'];
        }elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {//客户端的ip
            $ip     =   $_SERVER['HTTP_CLIENT_IP'];
        }elseif (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {//浏览当前页面的用户计算机的网关
            $arr    =   explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
            $pos    =   array_search('unknown',$arr);
            if(false !== $pos) unset($arr[$pos]);
            $ip     =   trim($arr[0]);
        }elseif (isset($_SERVER['REMOTE_ADDR'])) {
            $ip     =   $_SERVER['REMOTE_ADDR'];//浏览当前页面的用户计算机的ip地址
        }else{
            $ip=$_SERVER['REMOTE_ADDR'];
        }
        // IP地址合法验证
        $long = sprintf("%u",ip2long($ip));
        $ip   = $long ? array($ip, $long) : array('0.0.0.0', 0);
        return $ip[$type];
    }

}
