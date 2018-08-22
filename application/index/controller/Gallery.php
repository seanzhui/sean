<?php
namespace app\index\controller;
use app\index\controller\Common;
class Gallery extends Common
{
    public function index()
    {
      return $this-> fetch('gallery/gallery');
    }
}
