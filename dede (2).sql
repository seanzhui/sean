--
-- ���ݿ�: `dede`
--

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
(1, 'admin', '7917f2596f8bb70c954893f200ba6274', 1500179263, 1535107883, 1, 1, '/adminimg/20180807\\adb8095930fe3dd47531ab6a931d4a8c.jpeg', '', 'admin', '', '0.0.0.0', '2'),
(4, 'sean', '144f67525d025f91ff2f0ab2e656302c', 1533632556, 1535613321, 1, 9, '/adminimg/20180812\\f95b3bc0db1ae48ce101280cce08401f.jpeg', '', 'sean', '', '0.0.0.0', '25');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- ת����е����� `tp_archives`
--

INSERT INTO `tp_archives` (`id`, `title`, `keywords`, `description`, `writer`, `source`, `litpic`, `attr`, `click`, `content`, `cate_id`, `model_id`, `time`, `file`) VALUES
(13, '������Ʒ', '������Ʒ', '������Ʒ', '������Ʒ', '������Ʒ', '20180830\\0d3787ca4fdf2ae75d97f5fbc6990610.jpeg', '', 23, '&lt;p&gt;������Ʒ&lt;/p&gt;', 24, 37, 1535623872, ''),
(14, '������������', '������������', '������������', '������������', '������������', '20180830\\ea7962af5637fcadf663ad66375b3e1f.jpeg', '', 78, '&lt;p&gt;������������&lt;/p&gt;', 25, 39, 1535623896, ''),
(15, '���¶���', '���¶���', '���¶���', '���¶�������', '���¶�����Դ��', '', '', 65, '&lt;p&gt;���¶������¶������¶������¶������¶������¶������¶������¶������¶������¶������¶������¶���&lt;/p&gt;', 23, 39, 1535627720, ''),
(12, '��������', '��������', '��������', '��������', '��������', '20180830\\6756d50e4bbe2739016de9102f573140.jpeg', '', 23, '&lt;p&gt;��������&lt;/p&gt;', 23, 39, 1535623848, '');

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_artlist`
--

CREATE TABLE IF NOT EXISTS `tp_artlist` (
  `aid` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- ת����е����� `tp_artlist`
--

INSERT INTO `tp_artlist` (`aid`) VALUES
(12),
(14),
(15);

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
(1, '��������Ա', 1, '1,2,12,13,14,15,27,29,28,30,31,17,18,19,20,21,24,25,26,32,33'),
(9, '��Ŀ����Ա', 1, '1,2,12,13,14,15,27,29,28,30,31,17,18,19,20,21,24,25,26,32,33,34,35,36,37,38,39,4');

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `tp_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '����Աidӵ����ЩȨ��',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '�û���id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- ת����е����� `tp_auth_group_access`
--

INSERT INTO `tp_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(4, 9);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- ת����е����� `tp_auth_rule`
--

INSERT INTO `tp_auth_rule` (`id`, `name`, `title`, `type`, `status`, `condition`, `pid`, `icon`, `show`) VALUES
(1, 'admin/Conf', 'ϵͳ����', 1, 1, '', 0, 'fa-gear', 1),
(2, 'admin/Conf/conflst', '�������б�', 1, 1, '', 1, '', 1),
(29, 'admin/Authrule/add', 'Ȩ�����', 1, 1, '', 27, '', 1),
(28, 'admin/Authrule/index', 'Ȩ����ʾ', 1, 1, '', 27, '', 1),
(27, 'admin/Authrule', 'Ȩ�޹���', 1, 1, '', 0, '', 1),
(12, 'admin/Conf/index', '�����б�', 1, 1, '', 1, '', 1),
(13, 'admin/Conf/add', '�������', 1, 1, '', 1, '', 1),
(14, 'admin/Conf/edit', '�����޸�', 1, 1, '', 1, '', 0),
(15, 'admin/Conf/delete', '����ɾ��', 1, 1, '', 1, '', 0),
(17, 'admin/Content', '���¹���', 1, 1, '', 0, 'fa-file-text', 1),
(18, 'admin/Content/index', '�����б�', 1, 1, '', 17, '', 1),
(19, 'admin/Content/add', '�������', 1, 1, '', 17, '', 0),
(20, 'admin/Content/edit', '���±༭', 1, 1, '', 17, '', 0),
(21, 'admin/Content/delete', '����ɾ��', 1, 1, '', 17, '', 1),
(24, 'admin/message', '���۹���', 1, 1, '', 0, '', 1),
(25, 'admin/message/index', '�����б�', 1, 1, '', 24, '', 1),
(26, 'adminmessage/delete', '����ɾ��', 1, 1, '', 24, '', 0),
(30, 'admin/Authrule/edit', 'Ȩ���޸�', 1, 1, '', 27, '', 1),
(31, 'admin/Authrule/delete', 'Ȩ��ɾ��', 1, 1, '', 27, '', 1),
(32, 'admin/index/index', '��̨��ҳ', 1, 1, '', 0, '&amp;#xe614;', 0),
(34, 'admin/Admingroup', '�û������', 1, 1, '', 0, '', 1),
(35, 'Admingroup/index', '�û���', 1, 1, '', 34, '', 1),
(36, 'Admingroup/add', '�û������', 1, 1, '', 34, '', 1),
(37, 'Admingroup/delete', '�û���ɾ��', 1, 1, '', 34, '', 1),
(38, 'Admingroup/edit', '�û����޸�', 1, 1, '', 34, '', 1),
(39, 'admin/admin', '����Ա����', 1, 1, '', 0, '', 1),
(40, 'admin/admin/index', '����Ա', 1, 1, '', 39, '', 1),
(41, 'admin/admin/add', '����Ա����', 1, 1, '', 39, '', 1),
(42, 'admin/admin/edit', '����Ա�޸�', 1, 1, '', 39, '', 1),
(43, 'admin/admin/delete', '����Աɾ��', 1, 1, '', 39, '', 1),
(44, 'admin/cate', '��Ŀ����', 1, 1, '', 0, '', 1),
(45, 'admin/cate/index', '��Ŀ', 1, 1, '', 44, '', 1),
(46, 'admin/cate/add', '��Ŀ����', 1, 1, '', 44, '', 1),
(47, 'admin/cate/edit', '��Ŀ�޸�', 1, 1, '', 44, '', 1),
(48, 'admin/cate/delete', '��Ŀɾ��', 1, 1, '', 44, '', 1),
(49, 'admin/modelFields', '�ֶι���', 1, 1, '', 0, '', 1),
(50, 'admin/modelFields/index', '�ֶ�', 1, 1, '', 49, '', 1),
(51, 'admin/modelFields/add', '�ֶ�����', 1, 1, '', 49, '', 1),
(52, 'admin/modelFields/edit', '�ֶ��޸�', 1, 1, '', 49, '', 1),
(53, 'admin/modelFields/delete', '�ֶ�ɾ��', 1, 1, '', 49, '', 1),
(54, 'admin/model', 'ģ�͹���', 1, 1, '', 0, '', 1),
(55, 'admin/model/add', 'ģ������', 1, 1, '', 54, '', 1),
(56, 'admin/model/edit', 'ģ���޸�', 1, 1, '', 54, '', 1),
(57, 'admin/model/delete', 'ģ��ɾ��', 1, 1, '', 54, '', 1);

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_cate`
--

CREATE TABLE IF NOT EXISTS `tp_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '��Ŀid',
  `cate_name` varchar(30) NOT NULL COMMENT '��Ŀ����',
  `pagkew` varchar(150) NOT NULL COMMENT '��ҳ�ؼ���',
  `keywords` varchar(150) NOT NULL COMMENT '��Ŀ�ؼ���',
  `desc` varchar(255) NOT NULL COMMENT '��ҳ����',
  `content` text NOT NULL COMMENT '��ҳ����',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '״̬ 1����ʾ 0������',
  `img` varchar(150) NOT NULL COMMENT 'ͼƬ',
  `cate_attr` tinyint(1) NOT NULL DEFAULT '1' COMMENT '���� 1���б���Ŀ 2��Ƶ������ 3:������Ŀ',
  `link` varchar(150) NOT NULL COMMENT '��Ŀ����',
  `sort` smallint(6) NOT NULL DEFAULT '50' COMMENT '����',
  `model_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '��Ŀ����ģ��',
  `bottom_nav` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ��ڵײ���ʾ 1���� 0����',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '�ϼ�id',
  `file` varchar(60) NOT NULL COMMENT 'ͼƬ�ϴ�',
  `page` varchar(200) NOT NULL COMMENT '��ҳ����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- ת����е����� `tp_cate`
--

INSERT INTO `tp_cate` (`id`, `cate_name`, `pagkew`, `keywords`, `desc`, `content`, `status`, `img`, `cate_attr`, `link`, `sort`, `model_id`, `bottom_nav`, `pid`, `file`, `page`) VALUES
(22, '����', '', '���ڣ����', '��������', '&lt;p&gt;��������&lt;br/&gt;&lt;/p&gt;', 1, '/cateimg/20180830\\7cfa4692db5f8de8d2f978c46d7d2a51.jpeg', 2, '', 50, 38, 0, 0, '', '��������'),
(23, '����', '', '���¡�121321231', '', '', 1, '', 1, '', 50, 39, 0, 0, '', ''),
(24, '��Ʒ', '', '��Ʒ', '', '', 1, '', 1, '', 50, 37, 0, 0, '', ''),
(25, '����', '', '����', '', '', 1, '', 1, '', 50, 39, 0, 0, '', '');

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
(15, '��ϵ��', 'contact', 'Jefferson', '', 1, 2),
(13, '��վlogo', 'logo', '20180830\\ba945116bddb8b5015a23b7bf99e4145.jpeg', '', 6, 1),
(14, '������', 'beian', '��Ȩ���й�ICP��17010589��', '', 1, 1),
(11, 'վ�����ַ', 'siteurl', '2', '', 1, 1),
(17, '��������', 'email', '1052157022@qq.com', '', 1, 2),
(18, 'վ������', 'sitename', 'Jefferson�Ĳ���', '', 1, 3),
(19, '�ؼ���', 'keywords', '���ͣ�������ڣ�php��css�����', '', 1, 3),
(20, 'վ������', 'desc', '   Jefferson�ĸ��˲��ͺ�������վ�������ҵ������뼼��  ', '', 5, 3),
(22, '�ر�վ��', 'closesite', '����', '�ر�,����', 4, 1),
(23, '�绰', 'phone', '15677550147', '', 1, 2),
(25, '��ά��', 'ewm', '20180830\\0fcddd20c244c13ac274c6a681205370.jpeg', '', 6, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- ת����е����� `tp_model`
--

INSERT INTO `tp_model` (`id`, `model_name`, `table_name`, `status`) VALUES
(37, '�ҵ���Ʒ', 'works', 1),
(38, '��ҳ', 'page', 1),
(39, '����', 'artlist', 1);

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

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_page`
--

CREATE TABLE IF NOT EXISTS `tp_page` (
  `aid` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- ��Ľṹ `tp_works`
--

CREATE TABLE IF NOT EXISTS `tp_works` (
  `aid` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- ת����е����� `tp_works`
--

INSERT INTO `tp_works` (`aid`) VALUES
(13);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
