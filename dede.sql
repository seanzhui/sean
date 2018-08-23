--
-- ���ݿ�: `dede`
--

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_about`
--

CREATE TABLE IF NOT EXISTS `tp_about` (
  `aid` int(10) unsigned NOT NULL,
  `bianhao` varchar(150) NOT NULL DEFAULT '',
  `geshi` varchar(150) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_adflash`
--

CREATE TABLE IF NOT EXISTS `tp_adflash` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `fimg_src` varchar(150) NOT NULL COMMENT '�������ͼƬ·��',
  `flink` varchar(100) NOT NULL COMMENT '����������ӵ�ַ',
  `ad_id` smallint(6) NOT NULL COMMENT '�������id',
  PRIMARY KEY (`id`),
  KEY `ad_id` (`ad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_admin`
--

CREATE TABLE IF NOT EXISTS `tp_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `uname` varchar(20) NOT NULL COMMENT '�û���',
  `password` char(32) NOT NULL COMMENT '����',
  `create_time` int(10) NOT NULL COMMENT '����ʱ��',
  `last_time` int(10) NOT NULL COMMENT '����¼',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '����״̬ 1������ 0������',
  `groupid` mediumint(8) unsigned NOT NULL COMMENT '�����û���',
  `img` varchar(60) NOT NULL COMMENT 'ͷ��',
  `file` varchar(60) NOT NULL COMMENT '�ϴ��ӿ�',
  `name` varchar(60) NOT NULL COMMENT '�ǳ�',
  `create_ip` varchar(60) NOT NULL COMMENT '����ip',
  `loat_ip` varchar(60) NOT NULL COMMENT '��½ip',
  `login_count` varchar(60) NOT NULL COMMENT '��½����',
  PRIMARY KEY (`id`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- ת����е����� `tp_admin`
--

INSERT INTO `tp_admin` (`id`, `uname`, `password`, `create_time`, `last_time`, `status`, `groupid`, `img`, `file`, `name`, `create_ip`, `loat_ip`, `login_count`) VALUES
(1, 'admin', '7917f2596f8bb70c954893f200ba6274', 1500179263, 1533807051, 1, 1, '/adminimg/20180807\\adb8095930fe3dd47531ab6a931d4a8c.jpeg', '', 'admin', '', '', '1'),
(4, 'sean', '144f67525d025f91ff2f0ab2e656302c', 1533632556, 1535010029, 1, 9, '/adminimg/20180812\\f95b3bc0db1ae48ce101280cce08401f.jpeg', '', 'sean', '', '0.0.0.0', '20');

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_archives`
--

CREATE TABLE IF NOT EXISTS `tp_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ĵ�id',
  `title` varchar(150) NOT NULL COMMENT '����',
  `keywords` varchar(150) NOT NULL COMMENT '�ؼ���',
  `description` varchar(255) NOT NULL COMMENT '����',
  `writer` varchar(60) NOT NULL COMMENT '����',
  `source` varchar(150) NOT NULL COMMENT '��Դ',
  `litpic` varchar(150) NOT NULL COMMENT '����ͼ',
  `attr` varchar(60) NOT NULL COMMENT '�ĵ�����',
  `click` mediumint(9) NOT NULL COMMENT '�����',
  `content` longtext NOT NULL COMMENT '����',
  `cate_id` mediumint(9) NOT NULL COMMENT '������Ŀ',
  `model_id` mediumint(9) NOT NULL COMMENT '����ģ��',
  `time` int(11) NOT NULL COMMENT '����ʱ��',
  `file` varchar(60) NOT NULL COMMENT 'ͼƬ�ϴ���',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_article`
--

CREATE TABLE IF NOT EXISTS `tp_article` (
  `aid` int(10) unsigned NOT NULL,
  `article` varchar(150) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_auth_group`
--

CREATE TABLE IF NOT EXISTS `tp_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- ת����е����� `tp_auth_group`
--

INSERT INTO `tp_auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '��������Ա', 1, '1,2,12,13,14,15,6,7,8,10,9,16,22,17,18,19,20,21'),
(9, '��Ŀ����Ա', 1, '10,24,25,26');

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `tp_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- ת����е����� `tp_auth_group_access`
--

INSERT INTO `tp_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(2, 1),
(3, 7),
(4, 9),
(5, 8),
(11, 1),
(12, 4);

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_auth_rule`
--

CREATE TABLE IF NOT EXISTS `tp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` mediumint(9) NOT NULL DEFAULT '0' COMMENT '�ϼ�����id 0��ʾ��������',
  `icon` varchar(15) NOT NULL COMMENT 'ͼ������',
  `show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '�˵��Ƿ���ʾ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- ת����е����� `tp_auth_rule`
--

INSERT INTO `tp_auth_rule` (`id`, `name`, `title`, `type`, `status`, `condition`, `pid`, `icon`, `show`) VALUES
(1, 'admin/Conf', 'ϵͳ����', 1, 1, '', 0, 'fa-gear', 1),
(2, 'admin/Conf/conflst', '�������б�', 1, 1, '', 1, '', 1),
(8, 'admin/cate/add/add', '�����Ŀ-�Ӽ�', 1, 1, '', 7, '', 1),
(7, 'admin/Cate/add', '��Ŀ���', 1, 1, '', 6, '', 1),
(6, 'admin/Cate', '��Ŀ����', 1, 1, '', 0, 'fa-folder', 1),
(9, 'admin/Cate/edit', '��Ŀ�޸�', 1, 1, '', 6, '', 0),
(10, 'admin/cate/add/add2', '�����Ŀ-�Ӽ�2', 1, 1, '', 7, '', 1),
(12, 'admin/Conf/index', '�����б�', 1, 1, '', 1, '', 1),
(13, 'admin/Conf/add', '�������', 1, 1, '', 1, '', 1),
(14, 'admin/Conf/edit', '�����޸�', 1, 1, '', 1, '', 0),
(15, 'admin/Conf/del', '����ɾ��', 1, 1, '', 1, '', 0),
(16, 'admin/Cate/lst', '��Ŀ�б�', 1, 1, '', 6, '', 1),
(17, 'admin/Content', '�ĵ�', 1, 1, '', 0, 'fa-file-text', 1),
(18, 'admin/Content/lst', '�����б�', 1, 1, '', 17, '', 1),
(19, 'admin/Content/add', '�������', 1, 1, '', 17, '', 0),
(20, 'admin/Content/edit', '���±༭', 1, 1, '', 17, '', 0),
(21, 'admin/Content/del', '����ɾ��', 1, 1, '', 17, '', 0),
(22, 'admin/Cate/ajaxlst', '������Ŀ', 1, 1, '', 6, '', 0),
(24, 'admin/message', '���۹���', 1, 1, '', 0, '', 1),
(25, 'message/index', '�����б�', 1, 1, '', 24, '', 1),
(26, 'message/delete', '����ɾ��', 1, 1, '', 24, '', 1);

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_cate`
--

CREATE TABLE IF NOT EXISTS `tp_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '��Ŀid',
  `cate_name` varchar(30) NOT NULL COMMENT '��Ŀ����',
  `title` varchar(150) NOT NULL COMMENT '��Ŀ����',
  `keywords` varchar(150) NOT NULL COMMENT '�ؼ���',
  `desc` varchar(255) NOT NULL COMMENT '����',
  `content` text NOT NULL COMMENT '����',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '״̬ 1����ʾ 0������',
  `img` varchar(150) NOT NULL COMMENT 'ͼƬ',
  `cate_attr` tinyint(1) NOT NULL DEFAULT '1' COMMENT '���� 1���б���Ŀ 2��Ƶ������ 3:������Ŀ',
  `link` varchar(150) NOT NULL COMMENT '��Ŀ����',
  `sort` smallint(6) NOT NULL DEFAULT '50' COMMENT '����',
  `model_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '��Ŀ����ģ��',
  `bottom_nav` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ��ڵײ���ʾ 1���� 0����',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '�ϼ�id',
  `file` varchar(60) NOT NULL COMMENT '��֪������ð������',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- ת����е����� `tp_cate`
--

INSERT INTO `tp_cate` (`id`, `cate_name`, `title`, `keywords`, `desc`, `content`, `status`, `img`, `cate_attr`, `link`, `sort`, `model_id`, `bottom_nav`, `pid`, `file`) VALUES
(12, '����', '', 'about', '����', '', 1, '', 3, '', 50, 27, 0, 0, ''),
(13, '����', '', 'gallery', '����', '', 1, '', 4, '', 50, 24, 0, 0, ''),
(14, '����', '', 'article', '��������Ʒ', '', 1, '', 1, '', 50, 35, 0, 0, ''),
(16, '�ҵ�����', '', 'subarticle', '', '', 1, '', 1, '', 50, 35, 0, 14, ''),
(17, '�ҵ���Ʒ', '', 'producion', '', '', 1, '', 1, '', 50, 35, 0, 14, ''),
(20, '��ɪ��', '', '����', '', '', 1, '', 2, 'www.seanpan.top', 50, 36, 0, 0, '');

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_conf`
--

CREATE TABLE IF NOT EXISTS `tp_conf` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '������id',
  `cname` varchar(60) NOT NULL COMMENT '��������',
  `ename` varchar(60) NOT NULL COMMENT 'Ӣ������',
  `value` text NOT NULL COMMENT 'Ĭ��ֵ',
  `values` varchar(255) NOT NULL COMMENT '��ѡֵ',
  `dt_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1������� 2����ѡ 3����ѡ 4�������˵� 5���ı��� 6������',
  `cf_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1��������Ϣ 2����ϵ��ʽ 3��seo���� ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- ת����е����� `tp_conf`
--

INSERT INTO `tp_conf` (`id`, `cname`, `ename`, `value`, `values`, `dt_type`, `cf_type`) VALUES
(16, 'QQȺ', 'qq', '1052157022', '', 1, 2),
(15, '��ϵ��', 'contact', '��Ф��', '', 1, 2),
(13, '��վlogo', 'logo', '20180802\\84a5c28d36c1dfe7f09840368834c519.jpg', '', 6, 1),
(14, '������', 'beian', '��Ȩ���й�ICP��17010589��', '', 1, 1),
(11, 'վ�����ַ', 'siteurl', '2', '', 1, 1),
(17, '��������', 'email', '1052157022@qq.com', '', 1, 2),
(18, 'վ������', 'sitename', '3', '', 1, 3),
(19, '�ؼ���', 'keywords', '3', '', 1, 3),
(20, 'վ������', 'desc', '     sean����վ                                                      ', '', 5, 3),
(22, '�ر�վ��', 'closesite', '����', '�ر�,����', 4, 1),
(23, '�绰', 'phone', '15677550147', '', 1, 2),
(25, '��ά��', 'ewm', '20180802\\993404ff925daa50fa406901bf57c90e.JPG', '', 6, 1);

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_content`
--

CREATE TABLE IF NOT EXISTS `tp_content` (
  `aid` int(10) unsigned NOT NULL,
  `content` varchar(150) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_emailconfig`
--

CREATE TABLE IF NOT EXISTS `tp_emailconfig` (
  `email` varchar(5) NOT NULL COMMENT '�������ñ�ʶ',
  `from_email` varchar(50) NOT NULL COMMENT '�ʼ���ԴҲ�����ʼ���ַ',
  `from_name` varchar(50) NOT NULL,
  `smtp` varchar(50) NOT NULL COMMENT '����smtp������',
  `username` varchar(100) NOT NULL COMMENT '�����˺�',
  `password` varchar(100) NOT NULL COMMENT '��������',
  `title` varchar(200) NOT NULL COMMENT '�ʼ�����',
  `content` text NOT NULL COMMENT '�ʼ�ģ��',
  KEY `email` (`email`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- ת����е����� `tp_emailconfig`
--

INSERT INTO `tp_emailconfig` (`email`, `from_email`, `from_name`, `smtp`, `username`, `password`, `title`, `content`) VALUES
('email', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_gallery`
--

CREATE TABLE IF NOT EXISTS `tp_gallery` (
  `aid` int(10) unsigned NOT NULL,
  `othername` varchar(150) NOT NULL DEFAULT '',
  `filmtype` varchar(150) NOT NULL DEFAULT '',
  `zhutu` varchar(150) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_message`
--

CREATE TABLE IF NOT EXISTS `tp_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `name` varchar(60) NOT NULL COMMENT '��������',
  `email` varchar(255) NOT NULL COMMENT '����',
  `title` varchar(120) NOT NULL COMMENT '����',
  `contact` text NOT NULL COMMENT '��������',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `ip` varchar(255) NOT NULL COMMENT '����ip',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '�Ѷ�δ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- ת����е����� `tp_message`
--

INSERT INTO `tp_message` (`id`, `name`, `email`, `title`, `contact`, `create_time`, `ip`, `status`) VALUES
(2, 'cname', '12051516@cc.com', 'jkjlkj', 'ceshiyihoa', 0, '', 0);

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_model`
--

CREATE TABLE IF NOT EXISTS `tp_model` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ģ��id',
  `model_name` varchar(50) NOT NULL COMMENT 'ģ������',
  `table_name` varchar(50) NOT NULL COMMENT 'ģ�Ͷ�Ӧ����',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0������ 1������  ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- ת����е����� `tp_model`
--

INSERT INTO `tp_model` (`id`, `model_name`, `table_name`, `status`) VALUES
(36, '��ҳ', 'content', 1),
(35, '����', 'article', 1),
(24, '����', 'gallery', 1),
(27, '����', 'about', 1);

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_model_fields`
--

CREATE TABLE IF NOT EXISTS `tp_model_fields` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '�ֶ�id',
  `field_cname` varchar(60) NOT NULL COMMENT '�ֶ���������',
  `field_ename` varchar(60) NOT NULL COMMENT '�ֶ�Ӣ������',
  `field_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '�ֶ����ͣ�1�������ı� 2����ѡ����ť 3����ѡ�� 4�������˵� 5���ı��� 6������ 7������ 8������ 9�����ı����� longtext ',
  `field_values` varchar(255) NOT NULL COMMENT '��ѡֵ',
  `model_id` mediumint(9) NOT NULL COMMENT '����ģ��',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- ת����е����� `tp_model_fields`
--

INSERT INTO `tp_model_fields` (`id`, `field_cname`, `field_ename`, `field_type`, `field_values`, `model_id`) VALUES
(7, '����ͨ��', 'dowrode', 3, ' Ѹ������,qq����,��¿���� ', 26),
(8, 'ͼƬ', 'img', 1, '', 25),
(9, '��Ӱ����', 'othername', 1, '', 24),
(11, '��Ӱ����', 'filmtype', 3, 'ϲ��,����,����,����    ', 24),
(16, '���ص�ַ', 'downurl', 9, '', 26),
(31, '�����ֶ�', 'article', 1, '', 35),
(30, '��ҳ�ֶ�', 'content', 1, '', 36),
(20, '��Ӱ��ͼ', 'zhutu', 6, '', 24),
(21, '����ƽ̨', 'xzpt', 3, 'win7,win2000,win10', 26),
(22, '���ط�ʽ', 'xzfs', 4, '��������,��ͨ����', 26),
(23, '������ͼ', 'xzzt', 6, '', 26),
(24, '���', 'bianhao', 1, '', 27),
(25, '��ʽ', 'geshi', 1, '', 27),
(27, '������', 'shout_title', 1, '', 28);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
