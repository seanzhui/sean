<?php
namespace app\index\controller;
use app\index\controller\Common;
class Article extends Common
{
    public function index()
    {
      return $this-> fetch('article/index');
    }
}
