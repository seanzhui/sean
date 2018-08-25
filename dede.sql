--
-- 数据库: `dede`
--

-- --------------------------------------------------------

--
-- 表的结构 `tp_about`
--

CREATE TABLE IF NOT EXISTS `tp_about` (
  `aid` int(10) unsigned NOT NULL,
  `bianhao` varchar(150) NOT NULL DEFAULT '',
  `geshi` varchar(150) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
(4, 'sean', '144f67525d025f91ff2f0ab2e656302c', 1533632556, 1535183998, 1, 9, '/adminimg/20180812\\f95b3bc0db1ae48ce101280cce08401f.jpeg', '', 'sean', '', '0.0.0.0', '23');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `tp_archives`
--

INSERT INTO `tp_archives` (`id`, `title`, `keywords`, `description`, `writer`, `source`, `litpic`, `attr`, `click`, `content`, `cate_id`, `model_id`, `time`, `file`) VALUES
(10, 'mysql导出中文乱码及phpmyadmin导入中文乱码', 'mysql导出中文乱码及phpmyadmin导入中文乱码', 'mysql导出中文乱码及phpmyadmin导入中文乱码', '抄的', '', '', '', 12, '&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;因为要把本机的gbk编码的mysql数据库导入到虚拟主机去，服务商只提供了phpmyadmin供你导入导出。一直不用这个phpmyadmin,在本机也是用navicat,总感觉phpmyadmin速度较慢。这回不行了，没有独立主机，只好用人家给的phpmyadmin了。&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;第一步：本地数据导出sql文件。心想这对于navicat小事一桩。直接在数据库上右键&ldquo;转储sql&rdquo;(如图1),哗哗,十几秒的时间导出成功。&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img border=&quot;0&quot; alt=&quot;&quot; src=&quot;/ueditor/php/upload/image/20180823/1535015012127593.jpg&quot; width=&quot;257&quot; height=&quot;338&quot; style=&quot;border: 0px; max-width: 900px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;（&lt;strong&gt;图1：navicat下对整个数据库转sql&lt;/strong&gt;）&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;用记事本打开一看，傻眼了。中文全是乱码。咋回事呢？搜索了一下，改变什么连接属性啥的。不管用。试着在单张表上，转储sql,嘿,中文正常。但是82个表，我一个个转储我不累死。不行。看来只能弃用我心爱的navicat了。想起有个mysqldump，好试试它。运行-C:\\Documents and Settings\\Administrator&amp;gt;mysqldump -uroot -p123&amp;nbsp; ttg&amp;gt;ttgbk2.sql。打开一看，还是乱码。还不行。唉。。搜索，改成下面的加上指定字符集&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;C:\\Documents and Settings\\Administrator&amp;gt;mysqldump -uroot -p123 --default-character-set=gbk ttg&amp;gt;ttgbk2.sql。打开看看。嘿可以了。&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;第二步：打开虚拟主机提供的phpmyadmin.导入选择文件ttgbk2.sql.点执行。那个速度，唉。。。一会儿报错了。在执行lock tables tablename write 时出现access denied错误，原来我是虚拟主机用户没有 lock tables的权限.打开sql一看还真有lock tables 选项。没权限那就不用这个。到网上一搜说加上--skip-lock-tables，心想不错，应该是这个&ldquo;跳过锁表&rdquo;嘛&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;在mysqldump时加上-skip-lock-tables选项，那么命令行就变成&lt;br/&gt;C:\\Documents and Settings\\Administrator&amp;gt;mysqldump -uroot -p123 --default-character-set=gbk --skip-lock-tables ttg&amp;gt;ttgbk3.sql.&lt;br/&gt;结果令人失望，还是有lock tables.&lt;br/&gt;后来看了一下mysqldump --help&lt;br/&gt;才明白--skip-lock-tables是用在备份时候不让读写。但是如果你不想让导出的带lock-tables（因为你导入的时候没有权限嘛，呵呵）应该是使用add-locks=false，这是2个概念。正确的如下&lt;br/&gt;C:\\Documents and Settings\\Administrator&amp;gt;mysqldump -uroot -p123 --default-character-set=gbk ttg --add-locks=false&amp;gt;ttgttg3.sql.&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;我的版本导出的在记事本中打开是asni格式的。&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;再次到phpmyadmin处导入。结果是导入了3个表后报错。mysql语句报错。一看中文还乱码。。。。。接近崩溃。&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;再找原因。把&ldquo;MySQL 连接校对&rdquo;改成gbk-chinese-ci,把language改成中文-chinese simplified(如图2)。再把导入时&ldquo;文件编码&rdquo;改成&ldquo;gbk&rdquo;(默认的是utf-8，当然对应的sql文件的编码用记事本打开就是ansi.)(如图三).再试。。。。&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img border=&quot;0&quot; alt=&quot;&quot; src=&quot;/ueditor/php/upload/image/20180823/1535015012664841.jpg&quot; width=&quot;712&quot; height=&quot;274&quot; style=&quot;border: 0px; max-width: 900px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;（&lt;strong&gt;图二：修改连接校对及language&lt;/strong&gt;）&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img border=&quot;0&quot; alt=&quot;&quot; src=&quot;/ueditor/php/upload/image/20180823/1535015012134599.jpg&quot; width=&quot;598&quot; height=&quot;406&quot; style=&quot;border: 0px; max-width: 900px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;(&lt;strong&gt;图三：修改文件的字符集为gbk&lt;/strong&gt;)&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;终于所有表导入成功。打开一个含有中文的表，字段显示正常。&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;2点体会：&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;1、数据库编码归数据库编码。保证连接校对与数据库编码一致即可。&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; font-family: Verdana, &amp;quot;Lucida Grande&amp;quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;2、sql文件编码归文件编码。保证导入时选择的文件编码与数据库所用编码一致最好。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 16, 35, 1535015015, ''),
(11, '国维画院', '国维画院', '国维画院网站开发工作', 'sean', 'sean', '20180823\\6cd2d43d78f58c118fa0ec0eefeccbf3.jpg', '', 44, '&lt;p&gt;国维画院&lt;/p&gt;', 17, 35, 1535015145, '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_article`
--

CREATE TABLE IF NOT EXISTS `tp_article` (
  `aid` int(10) unsigned NOT NULL,
  `article` varchar(150) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_article`
--

INSERT INTO `tp_article` (`aid`, `article`) VALUES
(10, ''),
(11, '');

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
(9, '栏目管理员', 1, '24,25,26,32,33');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

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
(17, 'admin/Content', '文档', 1, 1, '', 0, 'fa-file-text', 1),
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
(33, 'admin/index/welcome', '首页信息', 1, 1, '', 0, '&#xe614;', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_cate`
--

CREATE TABLE IF NOT EXISTS `tp_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `cate_name` varchar(30) NOT NULL COMMENT '栏目名称',
  `title` varchar(150) NOT NULL COMMENT '栏目标题',
  `keywords` varchar(150) NOT NULL COMMENT '关键词',
  `desc` varchar(255) NOT NULL COMMENT '描述',
  `content` text NOT NULL COMMENT '内容',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：显示 0：隐藏',
  `img` varchar(150) NOT NULL COMMENT '图片',
  `cate_attr` tinyint(1) NOT NULL DEFAULT '1' COMMENT '属性 1：列表栏目 2：频道封面 3:外链栏目',
  `link` varchar(150) NOT NULL COMMENT '栏目外链',
  `sort` smallint(6) NOT NULL DEFAULT '50' COMMENT '排序',
  `model_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '栏目所属模型',
  `bottom_nav` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在底部显示 1：是 0：否',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `file` varchar(60) NOT NULL COMMENT '不知道哪里冒出来的',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `tp_cate`
--

INSERT INTO `tp_cate` (`id`, `cate_name`, `title`, `keywords`, `desc`, `content`, `status`, `img`, `cate_attr`, `link`, `sort`, `model_id`, `bottom_nav`, `pid`, `file`) VALUES
(12, '关于', '', 'about', '关于', '<p>关于我们关于我们关于我们关于我们关于我们关于我们关于我们1231544645646431313</p>', 1, '/cateimg/20180824\\6ee1b2ed0597d59b6b2c6ae7cf9b7b8f.jpg', 2, '', 50, 27, 0, 0, ''),
(13, '画廊', '', 'gallery', '画廊', '', 0, '', 1, '', 50, 24, 0, 0, ''),
(14, '文章', '', 'article', '文章与作品', '', 1, '', 1, '', 50, 35, 0, 0, ''),
(16, '我的文章', '', 'subarticle', '', '', 1, '', 1, '', 50, 35, 0, 14, ''),
(17, '我的作品', '', 'producion', '', '', 1, '', 1, '', 50, 35, 0, 14, ''),
(20, '旧的博客站点', '', '搜索', '', '', 1, '', 3, 'http://www.seanpan.top', 50, 36, 0, 0, '');

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
(15, '联系人', 'contact', '杨肖恩', '', 1, 2),
(13, '网站logo', 'logo', '20180802\\84a5c28d36c1dfe7f09840368834c519.jpg', '', 6, 1),
(14, '备案号', 'beian', '版权所有桂ICP备17010589号', '', 1, 1),
(11, '站点跟网址', 'siteurl', '2', '', 1, 1),
(17, '电子邮箱', 'email', '1052157022@qq.com', '', 1, 2),
(18, '站点名称', 'sitename', '3', '', 1, 3),
(19, '关键词', 'keywords', '3', '', 1, 3),
(20, '站点描述', 'desc', '     sean的网站                                                      ', '', 5, 3),
(22, '关闭站点', 'closesite', '开启', '关闭,开启', 4, 1),
(23, '电话', 'phone', '15677550147', '', 1, 2),
(25, '二维码', 'ewm', '20180802\\993404ff925daa50fa406901bf57c90e.JPG', '', 6, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_content`
--

CREATE TABLE IF NOT EXISTS `tp_content` (
  `aid` int(10) unsigned NOT NULL,
  `content` varchar(150) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- 表的结构 `tp_gallery`
--

CREATE TABLE IF NOT EXISTS `tp_gallery` (
  `aid` int(10) unsigned NOT NULL,
  `othername` varchar(150) NOT NULL DEFAULT '',
  `filmtype` varchar(150) NOT NULL DEFAULT '',
  `zhutu` varchar(150) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `tp_model`
--

INSERT INTO `tp_model` (`id`, `model_name`, `table_name`, `status`) VALUES
(36, '单页', 'content', 1),
(35, '文章', 'article', 1),
(24, '画廊', 'gallery', 1),
(27, '关于', 'about', 1);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
