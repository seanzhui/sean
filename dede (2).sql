--
-- 数据库: `dede`
--

-- --------------------------------------------------------

--
-- 表的结构 `tp_adflash`
--

CREATE TABLE IF NOT EXISTS `tp_adflash` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `fimg_src` varchar(150) NOT NULL COMMENT '动画广告图片路径',
  `flink` varchar(100) NOT NULL COMMENT '动画广告链接地址',
  `ad_id` smallint(6) NOT NULL COMMENT '所属广告id',
  PRIMARY KEY (`id`),
  KEY `ad_id` (`ad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin`
--

CREATE TABLE IF NOT EXISTS `tp_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '管理id',
  `uname` varchar(20) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_time` int(10) NOT NULL COMMENT '最后登录',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用状态 1：正常 0：禁用',
  `groupid` mediumint(8) unsigned NOT NULL COMMENT '所属用户组',
  `img` varchar(60) NOT NULL COMMENT '头像',
  `file` varchar(60) NOT NULL COMMENT '上传接口',
  `name` varchar(60) NOT NULL COMMENT '昵称',
  `create_ip` varchar(60) NOT NULL COMMENT '创建ip',
  `loat_ip` varchar(60) NOT NULL COMMENT '登陆ip',
  `login_count` varchar(60) NOT NULL COMMENT '登陆次数',
  PRIMARY KEY (`id`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `tp_admin`
--

INSERT INTO `tp_admin` (`id`, `uname`, `password`, `create_time`, `last_time`, `status`, `groupid`, `img`, `file`, `name`, `create_ip`, `loat_ip`, `login_count`) VALUES
(1, 'admin', '7917f2596f8bb70c954893f200ba6274', 1500179263, 1535107883, 1, 1, '/adminimg/20180807\\adb8095930fe3dd47531ab6a931d4a8c.jpeg', '', 'admin', '', '0.0.0.0', '2'),
(4, 'sean', '144f67525d025f91ff2f0ab2e656302c', 1533632556, 1535613321, 1, 9, '/adminimg/20180812\\f95b3bc0db1ae48ce101280cce08401f.jpeg', '', 'sean', '', '0.0.0.0', '25');

-- --------------------------------------------------------

--
-- 表的结构 `tp_archives`
--

CREATE TABLE IF NOT EXISTS `tp_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文档id',
  `title` varchar(150) NOT NULL COMMENT '标题',
  `keywords` varchar(150) NOT NULL COMMENT '关键词',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `writer` varchar(60) NOT NULL COMMENT '作者',
  `source` varchar(150) NOT NULL COMMENT '来源',
  `litpic` varchar(150) NOT NULL COMMENT '缩略图',
  `attr` varchar(60) NOT NULL COMMENT '文档属性',
  `click` mediumint(9) NOT NULL COMMENT '点击量',
  `content` longtext NOT NULL COMMENT '内容',
  `cate_id` mediumint(9) NOT NULL COMMENT '所属栏目',
  `model_id` mediumint(9) NOT NULL COMMENT '所属模型',
  `time` int(11) NOT NULL COMMENT '发布时间',
  `file` varchar(60) NOT NULL COMMENT '图片上传的',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `tp_archives`
--

INSERT INTO `tp_archives` (`id`, `title`, `keywords`, `description`, `writer`, `source`, `litpic`, `attr`, `click`, `content`, `cate_id`, `model_id`, `time`, `file`) VALUES
(13, '测试作品', '测试作品', '测试作品', '测试作品', '测试作品', '20180830\\0d3787ca4fdf2ae75d97f5fbc6990610.jpeg', '', 23, '&lt;p&gt;测试作品&lt;/p&gt;', 24, 37, 1535623872, ''),
(14, '测试生活文章', '测试生活文章', '测试生活文章', '测试生活文章', '测试生活文章', '20180830\\ea7962af5637fcadf663ad66375b3e1f.jpeg', '', 78, '&lt;p&gt;测试生活文章&lt;/p&gt;', 25, 39, 1535623896, ''),
(15, '文章二号', '文章二号', '文章二号', '文章二号作者', '文章二号来源你', '', '', 65, '&lt;p&gt;文章二号文章二号文章二号文章二号文章二号文章二号文章二号文章二号文章二号文章二号文章二号文章二号&lt;/p&gt;', 23, 39, 1535627720, ''),
(12, '测试文章', '测试文章', '测试文章', '测试文章', '测试文章', '20180830\\6756d50e4bbe2739016de9102f573140.jpeg', '', 23, '&lt;p&gt;测试文章&lt;/p&gt;', 23, 39, 1535623848, '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_artlist`
--

CREATE TABLE IF NOT EXISTS `tp_artlist` (
  `aid` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_artlist`
--

INSERT INTO `tp_artlist` (`aid`) VALUES
(12),
(14),
(15);

-- --------------------------------------------------------

--
-- 表的结构 `tp_auth_group`
--

CREATE TABLE IF NOT EXISTS `tp_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `tp_auth_group`
--

INSERT INTO `tp_auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '超级管理员', 1, '1,2,12,13,14,15,27,29,28,30,31,17,18,19,20,21,24,25,26,32,33'),
(9, '栏目管理员', 1, '1,2,12,13,14,15,27,29,28,30,31,17,18,19,20,21,24,25,26,32,33,34,35,36,37,38,39,4');

-- --------------------------------------------------------

--
-- 表的结构 `tp_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `tp_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '管理员id拥有那些权限',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_auth_group_access`
--

INSERT INTO `tp_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(4, 9);

-- --------------------------------------------------------

--
-- 表的结构 `tp_auth_rule`
--

CREATE TABLE IF NOT EXISTS `tp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` mediumint(9) NOT NULL DEFAULT '0' COMMENT '上级规则id 0表示顶级规则',
  `icon` varchar(15) NOT NULL COMMENT '图标名称',
  `show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '菜单是否显示',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- 转存表中的数据 `tp_auth_rule`
--

INSERT INTO `tp_auth_rule` (`id`, `name`, `title`, `type`, `status`, `condition`, `pid`, `icon`, `show`) VALUES
(1, 'admin/Conf', '系统设置', 1, 1, '', 0, 'fa-gear', 1),
(2, 'admin/Conf/conflst', '配置项列表', 1, 1, '', 1, '', 1),
(29, 'admin/Authrule/add', '权限添加', 1, 1, '', 27, '', 1),
(28, 'admin/Authrule/index', '权限显示', 1, 1, '', 27, '', 1),
(27, 'admin/Authrule', '权限管理', 1, 1, '', 0, '', 1),
(12, 'admin/Conf/index', '配置列表', 1, 1, '', 1, '', 1),
(13, 'admin/Conf/add', '配置添加', 1, 1, '', 1, '', 1),
(14, 'admin/Conf/edit', '配置修改', 1, 1, '', 1, '', 0),
(15, 'admin/Conf/delete', '配置删除', 1, 1, '', 1, '', 0),
(17, 'admin/Content', '文章管理', 1, 1, '', 0, 'fa-file-text', 1),
(18, 'admin/Content/index', '文章列表', 1, 1, '', 17, '', 1),
(19, 'admin/Content/add', '文章添加', 1, 1, '', 17, '', 0),
(20, 'admin/Content/edit', '文章编辑', 1, 1, '', 17, '', 0),
(21, 'admin/Content/delete', '文章删除', 1, 1, '', 17, '', 1),
(24, 'admin/message', '评论管理', 1, 1, '', 0, '', 1),
(25, 'admin/message/index', '评论列表', 1, 1, '', 24, '', 1),
(26, 'adminmessage/delete', '评论删除', 1, 1, '', 24, '', 0),
(30, 'admin/Authrule/edit', '权限修改', 1, 1, '', 27, '', 1),
(31, 'admin/Authrule/delete', '权限删除', 1, 1, '', 27, '', 1),
(32, 'admin/index/index', '后台首页', 1, 1, '', 0, '&amp;#xe614;', 0),
(34, 'admin/Admingroup', '用户组管理', 1, 1, '', 0, '', 1),
(35, 'Admingroup/index', '用户组', 1, 1, '', 34, '', 1),
(36, 'Admingroup/add', '用户组添加', 1, 1, '', 34, '', 1),
(37, 'Admingroup/delete', '用户组删除', 1, 1, '', 34, '', 1),
(38, 'Admingroup/edit', '用户组修改', 1, 1, '', 34, '', 1),
(39, 'admin/admin', '管理员管理', 1, 1, '', 0, '', 1),
(40, 'admin/admin/index', '管理员', 1, 1, '', 39, '', 1),
(41, 'admin/admin/add', '管理员增加', 1, 1, '', 39, '', 1),
(42, 'admin/admin/edit', '管理员修改', 1, 1, '', 39, '', 1),
(43, 'admin/admin/delete', '管理员删除', 1, 1, '', 39, '', 1),
(44, 'admin/cate', '栏目管理', 1, 1, '', 0, '', 1),
(45, 'admin/cate/index', '栏目', 1, 1, '', 44, '', 1),
(46, 'admin/cate/add', '栏目新增', 1, 1, '', 44, '', 1),
(47, 'admin/cate/edit', '栏目修改', 1, 1, '', 44, '', 1),
(48, 'admin/cate/delete', '栏目删除', 1, 1, '', 44, '', 1),
(49, 'admin/modelFields', '字段管理', 1, 1, '', 0, '', 1),
(50, 'admin/modelFields/index', '字段', 1, 1, '', 49, '', 1),
(51, 'admin/modelFields/add', '字段新增', 1, 1, '', 49, '', 1),
(52, 'admin/modelFields/edit', '字段修改', 1, 1, '', 49, '', 1),
(53, 'admin/modelFields/delete', '字段删除', 1, 1, '', 49, '', 1),
(54, 'admin/model', '模型管理', 1, 1, '', 0, '', 1),
(55, 'admin/model/add', '模型新增', 1, 1, '', 54, '', 1),
(56, 'admin/model/edit', '模型修改', 1, 1, '', 54, '', 1),
(57, 'admin/model/delete', '模型删除', 1, 1, '', 54, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_cate`
--

CREATE TABLE IF NOT EXISTS `tp_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `cate_name` varchar(30) NOT NULL COMMENT '栏目名称',
  `pagkew` varchar(150) NOT NULL COMMENT '单页关键词',
  `keywords` varchar(150) NOT NULL COMMENT '栏目关键词',
  `desc` varchar(255) NOT NULL COMMENT '单页描述',
  `content` text NOT NULL COMMENT '单页内容',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：显示 0：隐藏',
  `img` varchar(150) NOT NULL COMMENT '图片',
  `cate_attr` tinyint(1) NOT NULL DEFAULT '1' COMMENT '属性 1：列表栏目 2：频道封面 3:外链栏目',
  `link` varchar(150) NOT NULL COMMENT '栏目外链',
  `sort` smallint(6) NOT NULL DEFAULT '50' COMMENT '排序',
  `model_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '栏目所属模型',
  `bottom_nav` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在底部显示 1：是 0：否',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `file` varchar(60) NOT NULL COMMENT '图片上传',
  `page` varchar(200) NOT NULL COMMENT '单页标题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `tp_cate`
--

INSERT INTO `tp_cate` (`id`, `cate_name`, `pagkew`, `keywords`, `desc`, `content`, `status`, `img`, `cate_attr`, `link`, `sort`, `model_id`, `bottom_nav`, `pid`, `file`, `page`) VALUES
(22, '关于', '', '关于，简介', '自我评价', '&lt;p&gt;工作经历&lt;br/&gt;&lt;/p&gt;', 1, '/cateimg/20180830\\7cfa4692db5f8de8d2f978c46d7d2a51.jpeg', 2, '', 50, 38, 0, 0, '', '自我评价'),
(23, '文章', '', '文章。121321231', '', '', 1, '', 1, '', 50, 39, 0, 0, '', ''),
(24, '作品', '', '作品', '', '', 1, '', 1, '', 50, 37, 0, 0, '', ''),
(25, '生活', '', '生活', '', '', 1, '', 1, '', 50, 39, 0, 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_conf`
--

CREATE TABLE IF NOT EXISTS `tp_conf` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置项id',
  `cname` varchar(60) NOT NULL COMMENT '中文名称',
  `ename` varchar(60) NOT NULL COMMENT '英文名称',
  `value` text NOT NULL COMMENT '默认值',
  `values` varchar(255) NOT NULL COMMENT '可选值',
  `dt_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：输入框 2：单选 3：复选 4：下拉菜单 5：文本域 6：附件',
  `cf_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：基本信息 2：联系方式 3：seo设置 ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `tp_conf`
--

INSERT INTO `tp_conf` (`id`, `cname`, `ename`, `value`, `values`, `dt_type`, `cf_type`) VALUES
(16, 'QQ群', 'qq', '1052157022', '', 1, 2),
(15, '联系人', 'contact', 'Jefferson', '', 1, 2),
(13, '网站logo', 'logo', '20180830\\ba945116bddb8b5015a23b7bf99e4145.jpeg', '', 6, 1),
(14, '备案号', 'beian', '版权所有桂ICP备17010589号', '', 1, 1),
(11, '站点跟网址', 'siteurl', '2', '', 1, 1),
(17, '电子邮箱', 'email', '1052157022@qq.com', '', 1, 2),
(18, '站点名称', 'sitename', 'Jefferson的博客', '', 1, 3),
(19, '关键词', 'keywords', '博客，生活，深圳，php，css，后端', '', 1, 3),
(20, '站点描述', 'desc', '   Jefferson的个人博客和生活网站，分享我的生活与技术  ', '', 5, 3),
(22, '关闭站点', 'closesite', '开启', '关闭,开启', 4, 1),
(23, '电话', 'phone', '15677550147', '', 1, 2),
(25, '二维码', 'ewm', '20180830\\0fcddd20c244c13ac274c6a681205370.jpeg', '', 6, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_emailconfig`
--

CREATE TABLE IF NOT EXISTS `tp_emailconfig` (
  `email` varchar(5) NOT NULL COMMENT '邮箱配置标识',
  `from_email` varchar(50) NOT NULL COMMENT '邮件来源也就是邮件地址',
  `from_name` varchar(50) NOT NULL,
  `smtp` varchar(50) NOT NULL COMMENT '邮箱smtp服务器',
  `username` varchar(100) NOT NULL COMMENT '邮箱账号',
  `password` varchar(100) NOT NULL COMMENT '邮箱密码',
  `title` varchar(200) NOT NULL COMMENT '邮件标题',
  `content` text NOT NULL COMMENT '邮件模板',
  KEY `email` (`email`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_emailconfig`
--

INSERT INTO `tp_emailconfig` (`email`, `from_email`, `from_name`, `smtp`, `username`, `password`, `title`, `content`) VALUES
('email', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_message`
--

CREATE TABLE IF NOT EXISTS `tp_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `name` varchar(60) NOT NULL COMMENT '留言名称',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `title` varchar(120) NOT NULL COMMENT '标题',
  `contact` text NOT NULL COMMENT '留言内容',
  `create_time` int(11) NOT NULL COMMENT '留言时间',
  `ip` varchar(255) NOT NULL COMMENT '留言ip',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '已读未读',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `tp_message`
--

INSERT INTO `tp_message` (`id`, `name`, `email`, `title`, `contact`, `create_time`, `ip`, `status`) VALUES
(2, 'cname', '12051516@cc.com', 'jkjlkj', 'ceshiyihoa', 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `tp_model`
--

CREATE TABLE IF NOT EXISTS `tp_model` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型id',
  `model_name` varchar(50) NOT NULL COMMENT '模型名称',
  `table_name` varchar(50) NOT NULL COMMENT '模型对应表明',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0：禁用 1：开启  ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- 转存表中的数据 `tp_model`
--

INSERT INTO `tp_model` (`id`, `model_name`, `table_name`, `status`) VALUES
(37, '我的作品', 'works', 1),
(38, '单页', 'page', 1),
(39, '文章', 'artlist', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_model_fields`
--

CREATE TABLE IF NOT EXISTS `tp_model_fields` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '字段id',
  `field_cname` varchar(60) NOT NULL COMMENT '字段中文名称',
  `field_ename` varchar(60) NOT NULL COMMENT '字段英文名称',
  `field_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '字段类型：1：单行文本 2：单选安按钮 3：复选框 4：下拉菜单 5：文本域 6：附件 7：浮点 8：整型 9：长文本类型 longtext ',
  `field_values` varchar(255) NOT NULL COMMENT '可选值',
  `model_id` mediumint(9) NOT NULL COMMENT '所属模型',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `tp_model_fields`
--

INSERT INTO `tp_model_fields` (`id`, `field_cname`, `field_ename`, `field_type`, `field_values`, `model_id`) VALUES
(7, '下载通道', 'dowrode', 3, ' 迅雷下载,qq下载,电驴下载 ', 26),
(8, '图片', 'img', 1, '', 25),
(9, '电影别名', 'othername', 1, '', 24),
(11, '电影类型', 'filmtype', 3, '喜剧,动作,剧情,武侠    ', 24),
(16, '下载地址', 'downurl', 9, '', 26),
(31, '文章字段', 'article', 1, '', 35),
(30, '单页字段', 'content', 1, '', 36),
(20, '电影主图', 'zhutu', 6, '', 24),
(21, '下载平台', 'xzpt', 3, 'win7,win2000,win10', 26),
(22, '下载方式', 'xzfs', 4, '电信下载,网通下载', 26),
(23, '下载主图', 'xzzt', 6, '', 26),
(24, '编号', 'bianhao', 1, '', 27),
(25, '格式', 'geshi', 1, '', 27),
(27, '副标题', 'shout_title', 1, '', 28);

-- --------------------------------------------------------

--
-- 表的结构 `tp_page`
--

CREATE TABLE IF NOT EXISTS `tp_page` (
  `aid` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_works`
--

CREATE TABLE IF NOT EXISTS `tp_works` (
  `aid` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_works`
--

INSERT INTO `tp_works` (`aid`) VALUES
(13);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
