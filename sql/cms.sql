/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : cms

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 08/09/2022 10:18:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `column_id` bigint(20) DEFAULT NULL,
  `icon_id` bigint(20) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `sub_title` varchar(200) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `pub_date` date DEFAULT NULL COMMENT '发布日期',
  `resume` text COMMENT '摘要',
  `content` longtext COMMENT '内容',
  `url` varchar(255) DEFAULT NULL COMMENT '连接地址',
  `order_value` int(11) DEFAULT NULL,
  `column_property` tinyint(4) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `lastmodified_by` varchar(20) DEFAULT NULL,
  `lastmodified_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
BEGIN;
INSERT INTO `cms_article` VALUES (18, 2, 78, '轮播图一', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.baloon.com', 101, 2, 'admin', '2022-03-14 18:34:28', 'admin', '2022-06-05 15:17:03');
INSERT INTO `cms_article` VALUES (20, 3, NULL, '中华人民共和国国家卫生健康委委员会', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.nhc.gov.cn/', 300, 3, 'admin', '2022-03-15 18:18:52', 'admin', '2022-06-05 15:26:48');
INSERT INTO `cms_article` VALUES (22, 3, NULL, '中华人民共和国科技部', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.most.gov.cn/index.html', 400, 3, 'admin', '2022-03-15 18:32:54', 'admin', '2022-06-05 15:26:53');
INSERT INTO `cms_article` VALUES (30, 3, NULL, '中华医学会', NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.cma.org.cn/', 200, 3, 'admin', '2022-04-04 10:31:40', 'admin', '2022-06-05 15:26:42');
INSERT INTO `cms_article` VALUES (31, 3, NULL, '中国临床肿瘤学会', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.csco.org.cn/cn/index.aspx', 100, 3, 'admin', '2022-04-04 10:32:36', 'admin', '2022-06-05 15:26:37');
INSERT INTO `cms_article` VALUES (32, 20, 57, '国务院办公厅关于印发“十四五”中医药发展规划的通知', NULL, '', '卫健委', '2022-03-28', '为贯彻落实党中央、国务院关于中医药工作的决策部署，明确“十四五”时期中医药发展目标任务和重点措施，依据《中华人民共和国国民经济和社会发展第十四个五年规划和2035年远景目标纲要》，制定本规划。', '<p>&nbsp; &nbsp; &nbsp; &nbsp; 为贯彻落实党中央、国务院关于中医药工作的决策部署，明确“十四五”时期中医药发展目标任务和重点措施，依据《中华人民共和国国民经济和社会发展第十四个五年规划和2035年远景目标纲要》，制定本规划。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<font face=\"黑体\">一、规划背景</font></p><p>&nbsp; &nbsp; &nbsp; &nbsp; “十三五”期间，中医药发展顶层设计加快完善，政策环境持续优化，支持力度不断加大。2017年，中医药法施行。2019年，中共中央、国务院印发《关于促进中医药传承创新发展的意见》，国务院召开全国中医药大会。中医药服务体系进一步健全，截至2020年底，全国中医医院达到5482家，每千人口公立中医医院床位数达到0.68张，每千人口卫生机构中医类别执业（助理）医师数达到0.48人，99%的社区卫生服务中心、98%的乡镇卫生院、90.6%的社区卫生服务站、74.5%的村卫生室能够提供中医药服务，设置中医临床科室的二级以上公立综合医院占比达到86.75%，备案中医诊所达到2.6万家。中医药传承发展能力不断增强，中医药防控心脑血管疾病、糖尿病等重大慢病及重大传染性疾病临床研究取得积极进展，屠呦呦研究员获得国家最高科学技术奖，中医药人才培养体系持续完善，中成药和中药饮片产品标准化建设扎实推进，第四次全国中药资源普查基本完成，公民中医药健康文化素养水平达20.69%。中医药开放发展取得积极成效，已传播到196个国家和地区，中药类商品进出口贸易总额大幅增长。特别是新冠肺炎疫情发生以来，坚持中西医结合、中西药并用，中医药全面参与疫情防控救治，作出了重要贡献。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 当前，全球新冠肺炎疫情仍处于大流行状态，新发传染病不断出现，我国慢性病发病率总体呈上升趋势，传统传染病防控形势仍然严峻。随着经济社会发展和生活水平提高，人民群众更加重视生命安全和健康质量，健康需求不断增长，并呈现多样化、差异化特点。有效应对多种健康挑战、更好满足人民群众健康需求，迫切需要加快推进中医药事业发展，更好发挥其在健康中国建设中的独特优势。同时也应看到，中医药发展不平衡不充分问题仍然突出，中医药优质医疗服务资源总体不足，基层中医药服务能力仍较薄弱，中西医协同作用发挥不够，中医药参与公共卫生和应急救治机制有待完善，传承创新能力有待持续增强，中药材质量良莠不齐，中医药特色人才培养质量仍需提升，符合中医药特点的政策体系需进一步健全。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<font face=\"黑体\">二、总体要求</font></p><p>&nbsp; &nbsp; &nbsp; （一）指导思想。以习近平新时代中国特色社会主义思想为指导，深入贯彻党的十九大和十九届历次全会精神，统筹推进“五位一体”总体布局，协调推进“四个全面”战略布局，认真落实党中央、国务院决策部署，坚持稳中求进工作总基调，立足新发展阶段，完整、准确、全面贯彻新发展理念，构建新发展格局，坚持中西医并重，传承精华、守正创新，实施中医药振兴发展重大工程，补短板、强弱项、扬优势、激活力，推进中医药和现代科学相结合，推动中医药和西医药相互补充、协调发展，推进中医药现代化、产业化，推动中医药高质量发展和走向世界，为全面推进健康中国建设、更好保障人民健康提供有力支撑。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; （二）基本原则。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 坚持以人民为中心。把人民群众生命安全和身体健康放在第一位，加强服务体系和人才队伍建设，提升中医药服务能力，充分发挥中医药在治未病、重大疾病治疗、疾病康复中的重要作用，全方位全周期保障人民健康。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 坚持遵循发展规律。正确把握继承与创新的关系，坚持中医药原创思维，坚持创造性转化、创新性发展，注重利用现代科学技术和方法，深入发掘中医药精华，在创新中形成新特色新优势，促进中医药特色发展。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 坚持深化改革创新。破除体制机制和政策障碍，完善政策举措和评价标准体系，持续推进中医药领域改革创新，建立符合中医药特点的服务体系、服务模式、管理模式、人才培养模式，推动中医药事业和产业高质量发展。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 坚持统筹协调推进。坚持中西医并重，提升中西医结合能力，促进优势互补，共同维护人民健康。统筹谋划推进中医药服务、人才、传承创新、产业、文化、开放发展、深化改革等工作，形成促进中医药事业发展的合力。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; （三）发展目标。到2025年，中医药健康服务能力明显增强，中医药高质量发展政策和体系进一步完善，中医药振兴发展取得积极成效，在健康中国建设中的独特优势得到充分发挥。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; ——中医药服务体系进一步健全。融预防保健、疾病治疗和康复于一体的中医药服务体系逐步健全，中医药基层服务能力持续提升，中西医结合服务水平不断提高，中医药参与新发突发传染病防治和公共卫生事件应急处置能力显著增强。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; ——中医药特色人才建设加快推进。中医药教育改革深入推进，具有中医药特色的人才培养模式逐步完善，人才成长途径和队伍结构持续优化，队伍素质不断提升，基层中医药人才数量和质量进一步提高。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; ——中医药传承创新能力持续增强。中医药传承创新体系进一步健全，有利于传承创新的政策机制逐步完善，基础理论和重大疾病防治研究取得积极进展，临床与科研结合更为紧密，多学科融合创新持续推进。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; ——中医药产业和健康服务业高质量发展取得积极成效。中药材质量水平持续提升，供应保障能力逐步提高，中药注册管理不断优化，中药新药创制活力增强。中医药养生保健服务有序发展，中医药与相关业态持续融合发展。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; ——中医药文化大力弘扬。中医药文化产品和服务供给更为优质丰富，中医药博物馆事业加快发展，文化传播覆盖面进一步拓宽，公民中医药健康文化素养水平持续提高，中医药文化影响力进一步提升。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; ——中医药开放发展积极推进。中医药积极参与重大传染病防控国际合作，助力构建人类卫生健康共同体的作用更加显著。中医药高质量融入“一带一路”建设，国际交流不断深化，服务贸易积极发展。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; ——中医药治理水平进一步提升。中医药领域改革持续深化，遵循中医药发展规律的治理体系逐步完善，中医药信息化、综合统计、法治、监管等支撑保障不断加强，中医药治理水平持续提升。</p>', '', 50, 5, 'admin', '2022-04-04 11:33:24', 'admin', '2022-04-04 11:35:04');
INSERT INTO `cms_article` VALUES (33, 20, 58, '截至4月3日24时新型冠状病毒肺炎疫情最新情况', NULL, '', '卫健委', '2022-04-03', '4月3日0—24时，31个省（自治区、直辖市）和新疆生产建设兵团报告新增确诊病例1405例。其中境外输入病例39例，含16例由无症状感染者转为确诊病例；本土病例1366例；无新增死亡病例。无新增疑似病例。', '<p>&nbsp; &nbsp; &nbsp; &nbsp; 4月3日0—24时，31个省（自治区、直辖市）和新疆生产建设兵团报告新增确诊病例1405例。其中境外输入病例39例（四川14例，上海8例，广东8例，北京3例，福建3例，山东1例，广西1例，云南1例），含16例由无症状感染者转为确诊病例（四川14例，广东2例）；本土病例1366例（吉林836例，其中长春市574例、吉林市244例、白城市10例、四平市5例、白山市3例；上海425例，其中浦东新区141例、闵行区65例、徐汇区34例、宝山区31例、杨浦区29例、静安区28例、普陀区21例、黄浦区16例、长宁区15例、嘉定区14例、虹口区11例、松江区8例、奉贤区5例、金山区3例、青浦区3例、崇明区1例；福建16例，其中泉州市13例、厦门市3例；黑龙江15例，其中哈尔滨市12例、大庆市2例、佳木斯市1例；江苏10例，其中盐城市7例、南京市1例、徐州市1例、宿迁市1例；四川10例，其中成都市9例、乐山市1例；浙江8例，其中宁波市3例、杭州市2例、温州市1例、嘉兴市1例、湖州市1例；青海7例，其中西宁市5例、海东市2例；山东6例，其中青岛市3例、济南市2例、烟台市1例；海南6例，其中海口市2例、三亚市2例、<font face=\"仿宋_GB2312\">琼海市</font>2例；广东5例，其中广州市4例、珠海市1例；山西4例，均在太原市；安徽4例，其中阜阳市3例、淮南市1例；江西4例，其中南昌市2例、抚州市1例、上饶市1例；河北3例，均在邯郸市；河南2例，其中郑州市1例、滑县1例；贵州2例，均在黔西南布依族苗族自治州；北京1例，在大兴区；湖南1例，在娄底市；陕西1例，在西安市），含163例由无症状感染者转为确诊病例（上海71例，吉林68例，福建11例，安徽3例，四川3例，浙江2例，山东2例，广东2例，海南1例）。无新增死亡病例。无新增疑似病例。<o:p></o:p></p><p><font face=\"仿宋_GB2312\">&nbsp; &nbsp; &nbsp; &nbsp; 当日新增治愈出院病例</font>1848例，解除医学观察的密切接触者24376人，重症病例较前一日减少3例。<o:p></o:p></p><p><font face=\"仿宋_GB2312\">境外输入现有确诊病例</font>619例（无重症病例），现有疑似病例17例。累计确诊病例17643例，累计治愈出院病例17024例，无死亡病例。<o:p></o:p></p><p><font face=\"仿宋_GB2312\">&nbsp; &nbsp; &nbsp; &nbsp; 截至</font>4月3日24时，据31个省（自治区、直辖市）和新疆生产建设兵团报告，现有确诊病例25724例（其中重症病例54例），累计治愈出院病例125781例，累计死亡病例4638例，累计报告确诊病例156143例，现有疑似病例17例。累计追踪到密切接触者2418372人，尚在医学观察的密切接触者376115人。<o:p></o:p></p><p>&nbsp; &nbsp; &nbsp; &nbsp; 31个省（自治区、直辖市）和新疆生产建设兵团报告新增无症状感染者11862例，其中境外输入91例，本土11771例（上海8581例，其中浦东新区3529例、闵行区869例、黄浦区813例、徐汇区464例、宝山区431例、嘉定区410例、杨浦区344例、静安区315例、普陀区304例、松江区258例、青浦区217例、虹口区178例、崇明区143例、奉贤区117例、金山区99例、长宁区90例；吉林2742例，其中长春市2346例、吉林市393例、白城市2例、白山市1例；河北108例，其中邯郸市54例、保定市53例、邢台市1例；安徽69例，其中淮南市51例、阜阳市13例、芜湖市3例、合肥市1例、马鞍山市1例；江苏49例，其中宿迁市19例、苏州市11例、盐城市10例、南通市6例、徐州市3例；辽宁39例，其中沈阳市30例、营口市7例、鞍山市2例；江西39例，其中南昌市33例、抚州市3例、上饶市3例；福建26例，其中泉州市25例、福州市1例；海南21例，其中三亚市20例、海口市1例；河南20例，其中周口市13例、郑州市3例、永城市3例、信阳市1例；山东13例，其中临沂市6例、枣庄市3例、济南市2例、菏泽市2例；浙江10例，其中嘉兴市6例、温州市2例、杭州市1例、宁波市1例；黑龙江9例，其中佳木斯市5例、哈尔滨市4例；湖北9例，其中随州市4例、黄石市2例、荆州市2例、武汉市1例；广东9例，其中东莞市4例、广州市2例、珠海市1例、佛山市1例、肇庆市1例；四川9例，其中成都市4例、乐山市3例、资阳市1例、凉山彝族自治州1例；新疆6例，其中巴音郭楞蒙古自治州4例、乌鲁木齐市2例；云南3例，其中德宏傣族景颇族自治州2例、昆明市1例；甘肃3例，均在兰州市；天津2例，均在南开区；湖南2例，均在长沙市；山西1例，在太原市；重庆1例，在南岸区）；当日转为确诊病例179例（境外输入16例）；当日解除医学观察2008例（境外输入116例）；尚在医学观察的无症状感染者83364例（境外输入1064例）。<o:p></o:p></p><p><font face=\"宋体\">&nbsp; &nbsp; &nbsp; &nbsp; 累计收到港澳台地区通报确诊病例</font><font face=\"Calibri\">329770</font><font face=\"宋体\">例。其中，香港特别行政区</font><font face=\"Calibri\">305375</font><font face=\"宋体\">例（出院</font><font face=\"Calibri\">50964</font><font face=\"宋体\">例，死亡</font><font face=\"Calibri\">8172</font><font face=\"宋体\">例），澳门特别行政区</font><font face=\"Calibri\">82</font><font face=\"宋体\">例（出院</font><font face=\"Calibri\">82</font><font face=\"宋体\">例），台湾地区</font><font face=\"Calibri\">24313</font><font face=\"宋体\">例（出院</font><font face=\"Calibri\">13742</font><font face=\"宋体\">例，死亡</font><font face=\"Calibri\">853</font><font face=\"宋体\">例）。</font></p>', '', 50, 5, 'admin', '2022-04-04 11:38:25', 'admin', '2022-04-04 11:38:25');
INSERT INTO `cms_article` VALUES (34, 20, 59, '2022年全国人口监测与家庭发展工作会议在京召开', NULL, '', '卫健委', '2022-04-02', '2022年4月2日，全国人口监测与家庭发展工作电视电话会议在京召开，于学军副主任出席会议并讲话，强调要坚持以习近平新时代中国特色社会主义思想为指导，深入学习贯彻《中共中央国务院关于优化生育政策促进人口长期均衡发展的决定》和《人口与计划生育法》，抓好任务落实，确保优化生育政策取得积极成效。', '<p>&nbsp; &nbsp; &nbsp; &nbsp; 2022<font face=\"仿宋_GB2312\">年</font>4<font face=\"仿宋_GB2312\">月</font>2<font face=\"仿宋_GB2312\">日，全国人口监测与家庭发展工作电视电话会议在京召开，于学军副主任出席会议并讲话，强调要坚持以习近平新时代中国特色社会主义思想为指导，深入学习贯彻《中共中央国务院关于优化生育政策促进人口长期均衡发展的决定》和《人口与计划生育法》，抓好任务落实，确保优化生育政策取得积极成效。</font><o:p></o:p></p><p><font face=\"仿宋_GB2312\">&nbsp; &nbsp; &nbsp; &nbsp; 会议认为，</font>2021<font face=\"仿宋_GB2312\">年，</font><font face=\"仿宋_GB2312\">全国卫生健康</font><font face=\"仿宋_GB2312\">系统认真贯彻落实中央决策部署和委党组要求，</font><font face=\"仿宋_GB2312\">人口家庭</font><font face=\"仿宋_GB2312\">工作稳中有进，取得良好成效。会议要求，全系统要加强学习、坚定信心、改革创新、真抓实干，积极协调出台配套支持生育措施，切实增强群众的幸福感和获得感，推动人口家庭工作再上新台阶，喜迎党的二十大胜利召开。</font><o:p></o:p></p><p><font face=\"仿宋_GB2312\">&nbsp; &nbsp; &nbsp; &nbsp; 各省（区、市）及计划单列市、省会城市、新疆生产建设兵团卫生健康委分管负责同志，人口家庭处和相关处室（单位）负责同志，委有关司局、直属和联系单位负责同志参加会议。</font></p>', '', 50, 5, 'admin', '2022-04-04 11:40:13', 'admin', '2022-04-04 11:40:13');
INSERT INTO `cms_article` VALUES (35, 2, 80, '轮播图二', NULL, NULL, NULL, NULL, NULL, NULL, '', 103, 2, 'admin', '2022-04-04 12:39:01', 'admin', '2022-06-05 15:17:26');
INSERT INTO `cms_article` VALUES (36, 2, 79, '轮播图三', NULL, NULL, NULL, NULL, NULL, NULL, '', 99, 2, 'admin', '2022-04-04 12:39:22', 'admin', '2022-06-05 15:17:13');
INSERT INTO `cms_article` VALUES (37, 2, 77, '001', NULL, NULL, NULL, NULL, NULL, NULL, '123', 100, 2, 'admin', '2022-04-10 11:24:02', 'admin', '2022-06-05 15:16:49');
COMMIT;

-- ----------------------------
-- Table structure for cms_attachment
-- ----------------------------
DROP TABLE IF EXISTS `cms_attachment`;
CREATE TABLE `cms_attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(1000) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `ext_name` varchar(10) DEFAULT NULL COMMENT '扩展名',
  `origin_name` varchar(100) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `lastmodified_by` varchar(20) DEFAULT NULL,
  `lastmodified_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_attachment
-- ----------------------------
BEGIN;
INSERT INTO `cms_attachment` VALUES (1, '1646641333569_19ba8a04-9969-4537-9f8c-1d2d5d279ec9.jpg', '2022-03-07', 'image/jpeg', 'jpg', '1.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (2, '1646641584293_522555b2-5d5d-4b33-99f5-a2834632b835.jpg', '2022-03-07', 'image/jpeg', 'jpg', '1.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (3, '1646643639212_0b956e08-a759-4be0-ab36-82a65615a340.jpg', '2022-03-07', 'image/jpeg', 'jpg', '1.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (4, '1646647059495_4fc02b6a-bd5e-4e0e-9b9a-d61bebb94eb9.jpg', '2022-03-07', 'image/jpeg', 'jpg', '2.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (5, '1646647067387_a90214d8-6469-464b-a049-629d8939e4ad.jpg', '2022-03-07', 'image/jpeg', 'jpg', '2.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (6, '1646647165499_07fb207d-d1c5-40bc-b236-85a1d4593669.jpg', '2022-03-07', 'image/jpeg', 'jpg', '3.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (7, '1646647178143_461756f6-2bcb-4a82-83e8-8f252bbb9f0e.jpg', '2022-03-07', 'image/jpeg', 'jpg', '2.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (8, '1646648190974_b9a00d33-c694-4c7c-acff-15cb2b82f660.jpg', '2022-03-07', 'image/jpeg', 'jpg', '2.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (9, '1646648255029_ee0bb5dd-8b76-4700-924f-b693c3ac66f7.png', '2022-03-07', 'image/png', 'png', '6.png', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (10, '1646648498156_daa1c54a-0c9a-494b-a760-6f478626db73.png', '2022-03-07', 'image/png', 'png', '7.png', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (11, '1646648583648_bee3a614-57b5-4d36-8e2d-ef207cd2fc12.png', '2022-03-07', 'image/png', 'png', '12.png', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (12, '1646648598200_de9ea109-5344-4a8b-953f-487a2e0957b6.jpg', '2022-03-07', 'image/jpeg', 'jpg', '14.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (13, '1646648651311_578e37fc-16fd-4879-9e1a-c10708567932.jpg', '2022-03-07', 'image/jpeg', 'jpg', '3.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (14, '1646648792631_2133c910-f688-4aee-a39b-19b95965528e.png', '2022-03-07', 'image/png', 'png', '9.png', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (15, '1646648796588_0e392500-edb6-4291-a599-70ac6959e5b7.png', '2022-03-07', 'image/png', 'png', '15.png', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (16, '1646648871256_26c61e12-a8ec-4a4e-96f7-b48f28b2d4ef.jpg', '2022-03-07', 'image/jpeg', 'jpg', '3.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (17, '1646648918951_b68db753-f2cb-4f59-8f0f-78bba6ae934f.jpg', '2022-03-07', 'image/jpeg', 'jpg', '1.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (18, '1646649069074_258559b1-205b-4bed-8051-d4e6e0d4a006.png', '2022-03-07', 'image/png', 'png', '7.png', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (19, '1646649075161_33c608c9-10dd-49c8-8927-4be9d3fe3cdb.jpg', '2022-03-07', 'image/jpeg', 'jpg', '14.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (20, '1646649473310_453eed6d-e400-49cb-ad32-489d8a170255.jpg', '2022-03-07', 'image/jpeg', 'jpg', '3.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (21, '1646649496924_6db4fb15-1ef0-4453-830f-6ca390a0516e.png', '2022-03-07', 'image/png', 'png', '8.png', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (22, '1646649513018_d2f25960-94dc-4edc-9620-8653e3269f4b.jpg', '2022-03-07', 'image/jpeg', 'jpg', '14.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (23, '1646649882560_abccd0a7-b6aa-49b9-a65b-e5c22d94fa74.png', '2022-03-07', 'image/png', 'png', '8.png', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (24, '1646649956893_f695a2af-3efa-4726-8cc6-7033005fbe48.png', '2022-03-07', 'image/png', 'png', '15.png', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (25, '1646649998887_e5da6cd6-792d-461d-b1ae-a0894c0eb97d.png', '2022-03-07', 'image/png', 'png', '8.png', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (26, '1646650728100_2bb1632c-21cf-41ee-af88-3b40226b8027.png', '2022-03-07', 'image/png', 'png', '7.png', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (27, '1646650772006_9d390f17-ea0b-4d9b-bb74-981eba64b886.png', '2022-03-07', 'image/png', 'png', '8.png', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (28, '1646650835346_7469d945-1970-4bae-b6af-7f055795478f.png', '2022-03-07', 'image/png', 'png', '5.png', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (29, '1646650973313_ff9fe9ce-a36e-41b4-8618-e1b96c590c34.jpg', '2022-03-07', 'image/jpeg', 'jpg', '2.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (30, '1646651184634_0a8d2252-60be-4978-a9f8-f15348b1a715.png', '2022-03-07', 'image/png', 'png', '7.png', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (31, '1646651718697_b0dcaf2f-f452-4f5a-8c55-7374403df72e.jpg', '2022-03-07', 'image/jpeg', 'jpg', '4.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (32, '1646652380923_f77a671c-85c6-4087-9d40-a5b2c84eaf5d.jpg', '2022-03-07', 'image/jpeg', 'jpg', '3.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `cms_attachment` VALUES (33, '1646661637569_6ee9f620-5774-47d0-9480-08cdc85e9513.jpg', '2022-03-07', 'image/jpeg', 'jpg', '3.jpg', 'admin', '2022-03-07 22:00:38', 'admin', '2022-03-07 22:00:38');
INSERT INTO `cms_attachment` VALUES (34, '1646661770928_065d3861-eb91-4ecc-b7e3-0841d78b1083.jpg', '2022-03-07', 'image/jpeg', 'jpg', '4.jpg', 'admin', '2022-03-07 22:02:51', 'admin', '2022-03-07 22:02:51');
INSERT INTO `cms_attachment` VALUES (35, '1646662198954_1c974f7d-6543-4949-a6cb-d7d6fbdab439.png', '2022-03-07', 'image/png', 'png', '7.png', 'admin', '2022-03-07 22:09:59', 'admin', '2022-03-07 22:09:59');
INSERT INTO `cms_attachment` VALUES (36, '1646662269114_48c3a5b4-d3df-48a9-a27c-42009aeec1ed.png', '2022-03-07', 'image/png', 'png', '12.png', 'admin', '2022-03-07 22:11:09', 'admin', '2022-03-07 22:11:09');
INSERT INTO `cms_attachment` VALUES (37, '1646662389167_22d35ff6-ec77-406a-ae30-1f7db9cbf839.jpg', '2022-03-07', 'image/jpeg', 'jpg', '3.jpg', 'admin', '2022-03-07 22:13:09', 'admin', '2022-03-07 22:13:09');
INSERT INTO `cms_attachment` VALUES (38, '1646662427471_53d9e624-a201-42cf-9d3f-e7686e35dde3.jpeg', '2022-03-07', 'image/jpeg', 'jpeg', '25.jpeg', 'admin', '2022-03-07 22:13:47', 'admin', '2022-03-07 22:13:47');
INSERT INTO `cms_attachment` VALUES (39, '1646662550132_f79f9c62-cea4-4f52-a8f8-4e3b194263ca.jpg', '2022-03-07', 'image/jpeg', 'jpg', '2.jpg', 'admin', '2022-03-07 22:15:50', 'admin', '2022-03-07 22:15:50');
INSERT INTO `cms_attachment` VALUES (40, '1646662687467_1c119643-9cee-45a1-9378-cf175c948503.png', '2022-03-07', 'image/png', 'png', '10.png', 'admin', '2022-03-07 22:18:07', 'admin', '2022-03-07 22:18:07');
INSERT INTO `cms_attachment` VALUES (41, '1646662782633_dc6d75be-9554-4ba5-a147-49beed5c33e0.jpg', '2022-03-07', 'image/jpeg', 'jpg', '3.jpg', 'admin', '2022-03-07 22:19:43', 'admin', '2022-03-07 22:19:43');
INSERT INTO `cms_attachment` VALUES (42, '1646662924088_7d82f4e0-5732-4248-a4d5-7b6c08203e42.jpeg', '2022-03-07', 'image/jpeg', 'jpeg', '28.jpeg', 'admin', '2022-03-07 22:22:04', 'admin', '2022-03-07 22:22:04');
INSERT INTO `cms_attachment` VALUES (43, '1646663007683_22c52e03-545d-4f2c-834f-f14717513e37.jpeg', '2022-03-07', 'image/jpeg', 'jpeg', '23.jpeg', 'admin', '2022-03-07 22:23:28', 'admin', '2022-03-07 22:23:28');
INSERT INTO `cms_attachment` VALUES (44, '1646663073636_e9be5889-77f7-447f-a50a-d04c07f2c7bd.png', '2022-03-07', 'image/png', 'png', '32.png', 'admin', '2022-03-07 22:24:34', 'admin', '2022-03-07 22:24:34');
INSERT INTO `cms_attachment` VALUES (45, '1646665412441_0b1808db-599a-41d7-8586-e426895f3e33.png', '2022-03-07', 'image/png', 'png', '8.png', 'admin', '2022-03-07 23:03:32', 'admin', '2022-03-07 23:03:32');
INSERT INTO `cms_attachment` VALUES (46, '1647254059310_328878dc-1c9d-4af4-ac68-17bd2c34a9c8.jpg', '2022-03-14', 'image/jpeg', 'jpg', 'AgricultureHeart_ZH-CN12475262667_1920x1080.jpg', 'admin', '2022-03-14 18:34:19', 'admin', '2022-03-14 18:34:19');
INSERT INTO `cms_attachment` VALUES (47, '1647254570134_253aafc1-dda6-430b-b69f-37621786df4d.jpg', '2022-03-14', 'image/jpeg', 'jpg', 'AuburnBalloons_EN-AU8649124966_1920x1080.jpg', 'admin', '2022-03-14 18:42:50', 'admin', '2022-03-14 18:42:50');
INSERT INTO `cms_attachment` VALUES (48, '1647254764582_d792a1d8-cc38-4650-b50a-ec48bfd9af44.jpg', '2022-03-14', 'image/jpeg', 'jpg', 'AustralianBaobab_EN-AU9505720984_1920x1080.jpg', 'admin', '2022-03-14 18:46:05', 'admin', '2022-03-14 18:46:05');
INSERT INTO `cms_attachment` VALUES (49, '1647422457906_6a5ebea0-ea01-468a-b4f4-aee07f0d2471.jpg', '2022-03-16', 'image/jpeg', 'jpg', 'Aoraki_EN-US8306633464_1920x1200.jpg', 'admin', '2022-03-16 17:20:58', 'admin', '2022-03-16 17:20:58');
INSERT INTO `cms_attachment` VALUES (50, '1647430589504_5102422a-45aa-4645-be50-3dafec1050c5.jpg', '2022-03-16', 'image/jpeg', 'jpg', 'AthabascaCave_ZH-CN2654280175_1920x1080.jpg', 'admin', '2022-03-16 19:36:30', 'admin', '2022-03-16 19:36:30');
INSERT INTO `cms_attachment` VALUES (51, '1647430615660_097d3e45-bef2-4692-ad95-76cb3d3812f3.jpg', '2022-03-16', 'image/jpeg', 'jpg', 'AuburnBalloons_EN-AU8649124966_1920x1080.jpg', 'admin', '2022-03-16 19:36:56', 'admin', '2022-03-16 19:36:56');
INSERT INTO `cms_attachment` VALUES (52, '1647438750568_ac5e32ba-97ed-423b-ae51-e0dfe5edeb22.jpg', '2022-03-16', 'image/jpeg', 'jpg', 'BalmhornRegion_EN-US6932360915_1920x1200.jpg', 'admin', '2022-03-16 21:52:31', 'admin', '2022-03-16 21:52:31');
INSERT INTO `cms_attachment` VALUES (53, '1647497686370_e10c0538-1a9b-4697-87dc-b980e4a61847.jpg', '2022-03-17', 'image/jpeg', 'jpg', 'AthabascaCave_ZH-CN2654280175_1920x1080.jpg', 'admin', '2022-03-17 14:14:46', 'admin', '2022-03-17 14:14:46');
INSERT INTO `cms_attachment` VALUES (54, '1647497749942_7535b2a2-17ab-4617-bf2b-c27e4e0555a3.jpg', '2022-03-17', 'image/jpeg', 'jpg', 'AgricultureHeart_ZH-CN12475262667_1920x1080.jpg', 'admin', '2022-03-17 14:15:50', 'admin', '2022-03-17 14:15:50');
INSERT INTO `cms_attachment` VALUES (55, '1647498698707_1700bb45-2d11-4cd2-93ed-ba086c039673.jpg', '2022-03-17', 'image/jpeg', 'jpg', 'Aoraki_EN-US8306633464_1920x1200.jpg', 'admin', '2022-03-17 14:31:39', 'admin', '2022-03-17 14:31:39');
INSERT INTO `cms_attachment` VALUES (56, '1647500624426_fb1a5213-43ad-4e59-910c-9103c5ca80d5.jpg', '2022-03-17', 'image/jpeg', 'jpg', 'AuburnBalloons_EN-AU8649124966_1920x1080.jpg', 'admin', '2022-03-17 15:03:44', 'admin', '2022-03-17 15:03:44');
INSERT INTO `cms_attachment` VALUES (57, '1649043293151_909a78d3-aa89-45ca-88ed-d778691f64e8.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'home_cum_img3.jpg', 'admin', '2022-04-04 11:34:53', 'admin', '2022-04-04 11:34:53');
INSERT INTO `cms_attachment` VALUES (58, '1649043314162_48dd4711-bc13-41cf-97c4-18ae8a50d906.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'home_cum_img2.jpg', 'admin', '2022-04-04 11:35:14', 'admin', '2022-04-04 11:35:14');
INSERT INTO `cms_attachment` VALUES (59, '1649043516590_edff7d63-622f-4c4a-9880-1f2f0ac0556e.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'home_cum_img1.jpg', 'admin', '2022-04-04 11:38:37', 'admin', '2022-04-04 11:38:37');
INSERT INTO `cms_attachment` VALUES (60, '1649046881055_176fe501-933d-4689-b684-e6d9f81abb54.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'home_join_img1.jpg', 'admin', '2022-04-04 12:34:41', 'admin', '2022-04-04 12:34:41');
INSERT INTO `cms_attachment` VALUES (61, '1649046894611_b99bfa0b-4f23-4c95-b47d-ef439c765442.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'home_join_img2.jpg', 'admin', '2022-04-04 12:34:55', 'admin', '2022-04-04 12:34:55');
INSERT INTO `cms_attachment` VALUES (62, '1649047001936_30664de4-41d1-40a6-aa63-a518947804aa.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'home_join_img1.jpg', 'admin', '2022-04-04 12:36:42', 'admin', '2022-04-04 12:36:42');
INSERT INTO `cms_attachment` VALUES (63, '1649047011581_f61c8dc8-de02-4f9b-b79c-96150c355def.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'home_join_img2.jpg', 'admin', '2022-04-04 12:36:52', 'admin', '2022-04-04 12:36:52');
INSERT INTO `cms_attachment` VALUES (64, '1649047124945_faa5f965-e739-4c24-aaa6-2589bf80ebbd.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'AthabascaCanyon_EN-US11535281899_1920x1200.jpg', 'admin', '2022-04-04 12:38:45', 'admin', '2022-04-04 12:38:45');
INSERT INTO `cms_attachment` VALUES (65, '1649047152675_0d61c046-047c-4ceb-8477-4b148d92ec37.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'BalmhornRegion_EN-US6932360915_1920x1200.jpg', 'admin', '2022-04-04 12:39:13', 'admin', '2022-04-04 12:39:13');
INSERT INTO `cms_attachment` VALUES (66, '1649047173831_89e9a1cf-56fa-418f-ad45-ce455bf8bb91.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'BethesdaSnow_ZH-CN3087618718_1920x1080.jpg', 'admin', '2022-04-04 12:39:34', 'admin', '2022-04-04 12:39:34');
INSERT INTO `cms_attachment` VALUES (67, '1649047607966_961535b9-b1d9-44a0-b9ac-6826b50c1e7e.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'BingWallpaper-2017-07-31.jpg', 'admin', '2022-04-04 12:46:48', 'admin', '2022-04-04 12:46:48');
INSERT INTO `cms_attachment` VALUES (68, '1649047621644_f4c300a4-b0d0-442b-b51c-d62748ce0661.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'BingWallpaper-2017-08-13.jpg', 'admin', '2022-04-04 12:47:02', 'admin', '2022-04-04 12:47:02');
INSERT INTO `cms_attachment` VALUES (69, '1649047633657_eff34a91-b4d9-4a63-82b8-afccf1c5b66a.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'BingWallpaper-2017-09-13.jpg', 'admin', '2022-04-04 12:47:14', 'admin', '2022-04-04 12:47:14');
INSERT INTO `cms_attachment` VALUES (70, '1649061951281_62a7d89d-1499-40d4-b4f8-afa794dedb33.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'banner_course_d.jpg', 'admin', '2022-04-04 16:45:51', 'admin', '2022-04-04 16:45:51');
INSERT INTO `cms_attachment` VALUES (71, '1649063314488_764c8261-9270-4c9c-a715-5a1d51f24966.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'banner_list.jpg', 'admin', '2022-04-04 17:08:34', 'admin', '2022-04-04 17:08:34');
INSERT INTO `cms_attachment` VALUES (72, '1649063321754_92ad2b69-824d-4401-b10e-f9ed269b251a.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'banner_news.jpg', 'admin', '2022-04-04 17:08:42', 'admin', '2022-04-04 17:08:42');
INSERT INTO `cms_attachment` VALUES (73, '1649063336685_da68d2e0-57f0-4f7f-b094-0db8f17b2d87.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'home_idear_img1.jpg', 'admin', '2022-04-04 17:08:57', 'admin', '2022-04-04 17:08:57');
INSERT INTO `cms_attachment` VALUES (74, '1649063442780_eaed9762-9881-4086-a08f-a07637efa44f.jpg', '2022-04-04', 'image/jpeg', 'jpg', 'pic_d_img.jpg', 'admin', '2022-04-04 17:10:43', 'admin', '2022-04-04 17:10:43');
INSERT INTO `cms_attachment` VALUES (75, '1649561037952_c9cf9958-dcee-4d88-8c98-e84854a9d955.jpg', '2022-04-10', 'image/jpeg', 'jpg', 'AstropygaRadiata_EN-US11362411397_1920x1200.jpg', 'admin', '2022-04-10 11:23:58', 'admin', '2022-04-10 11:23:58');
INSERT INTO `cms_attachment` VALUES (76, '1649561213491_ffa8b5b8-6010-4a4d-b8a7-465bc1f41236.jpg', '2022-04-10', 'image/jpeg', 'jpg', 'BingWallpaper-2017-07-18.jpg', 'admin', '2022-04-10 11:26:53', 'admin', '2022-04-10 11:26:53');
INSERT INTO `cms_attachment` VALUES (77, '1654412029162_ad1a64a5-b88e-4063-93a5-a6aecaf6fffc.jpg', '2022-06-05', 'image/jpeg', 'jpg', 'AberystwythSeafront_ZH-CN9542789062_1920x1080.jpg', 'admin', '2022-06-05 14:53:49', 'admin', '2022-06-05 14:53:49');
INSERT INTO `cms_attachment` VALUES (78, '1654413417863_fd6c5f93-5266-4b20-baf3-22ec35667789.jpg', '2022-06-05', 'image/jpeg', 'jpg', 'AfricaWeaverbirds_EN-US9680293413_1920x1200.jpg', 'admin', '2022-06-05 15:16:58', 'admin', '2022-06-05 15:16:58');
INSERT INTO `cms_attachment` VALUES (79, '1654413428712_946c2a43-3fb2-4e59-88ca-c464d1e3cf3f.jpg', '2022-06-05', 'image/jpeg', 'jpg', 'AstropygaRadiata_EN-US11362411397_1920x1200.jpg', 'admin', '2022-06-05 15:17:09', 'admin', '2022-06-05 15:17:09');
INSERT INTO `cms_attachment` VALUES (80, '1654413438532_608fa495-e073-4c8b-8bcd-e01c6529f91d.jpg', '2022-06-05', 'image/jpeg', 'jpg', 'AuburnBalloons_EN-AU8649124966_1920x1080.jpg', 'admin', '2022-06-05 15:17:19', 'admin', '2022-06-05 15:17:19');
COMMIT;

-- ----------------------------
-- Table structure for cms_column
-- ----------------------------
DROP TABLE IF EXISTS `cms_column`;
CREATE TABLE `cms_column` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `en_name` varchar(500) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `icon_id` bigint(20) DEFAULT NULL,
  `order_value` int(11) DEFAULT NULL,
  `memo` text,
  `display_flag` bit(1) DEFAULT NULL,
  `property` tinyint(4) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `lastmodified_by` varchar(20) DEFAULT NULL,
  `lastmodified_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpn0y34n9iscklmviuo87yicj1` (`pid`),
  CONSTRAINT `FKpn0y34n9iscklmviuo87yicj1` FOREIGN KEY (`pid`) REFERENCES `cms_column` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_column
-- ----------------------------
BEGIN;
INSERT INTO `cms_column` VALUES (1, '01', 'Logo图标', NULL, NULL, NULL, 10, 'Logo图标', b'1', 1, 'admin', '2022-01-25 16:41:20', 'admin', '2022-01-25 16:41:30');
INSERT INTO `cms_column` VALUES (2, '02', '轮播图', NULL, NULL, NULL, 20, '轮播图', b'1', 2, 'admin', '2022-01-25 16:54:15', 'admin', '2022-01-25 16:54:15');
INSERT INTO `cms_column` VALUES (3, '03', '友情链接', NULL, NULL, NULL, 30, '友情链接', b'1', 3, 'admin', '2022-03-07 15:32:41', 'admin', '2022-03-07 15:32:51');
INSERT INTO `cms_column` VALUES (4, '04', '其他资源', 'other', NULL, NULL, 10, '其他资源', b'1', 4, 'admin', '2022-03-07 15:32:44', 'admin', '2022-03-25 18:42:40');
INSERT INTO `cms_column` VALUES (5, '10', '新闻动态', 'News Center', NULL, 96, 10, '新闻中心', b'1', 5, 'admin', '2022-03-07 15:32:47', 'admin', '2022-04-28 07:20:11');
INSERT INTO `cms_column` VALUES (6, '4020', '联系方式', 'Contact Info', 9, NULL, 20, '联系方式', b'1', 5, NULL, NULL, 'admin', '2022-04-04 12:27:11');
INSERT INTO `cms_column` VALUES (7, '20', '中心架构', 'Orgnization Structure', NULL, 71, 20, NULL, b'1', 5, 'admin', '2022-03-16 17:54:04', 'admin', '2022-04-04 17:08:36');
INSERT INTO `cms_column` VALUES (8, '30', '专家委员', ' Expert Committee', NULL, 72, 30, '专家委员', b'1', 5, 'admin', '2022-03-16 17:56:13', 'admin', '2022-04-04 17:08:43');
INSERT INTO `cms_column` VALUES (9, '40', '关于我们', 'About Us', NULL, 74, 40, '关于我们', b'1', 5, 'admin', '2022-03-16 18:11:11', 'admin', '2022-04-04 17:10:45');
INSERT INTO `cms_column` VALUES (19, 'other2', '资源二', 'other2', NULL, NULL, 50, '', b'1', 4, 'admin', '2022-03-17 15:16:23', 'admin', '2022-03-25 18:42:47');
INSERT INTO `cms_column` VALUES (20, '1010', '工作动态', 'Our News', 5, NULL, 10, '工作dong台', b'1', 5, 'admin', '2022-04-04 11:27:05', 'admin', '2022-04-04 11:29:59');
INSERT INTO `cms_column` VALUES (21, '1020', '行业新闻', 'Industry News', 5, NULL, 20, '行业新闻', b'1', 5, 'admin', '2022-04-04 11:29:44', 'admin', '2022-04-04 11:29:44');
INSERT INTO `cms_column` VALUES (22, '2010', '组织架构', 'Orgnization Info', 7, 67, 10, '拟订卫生健康人才发展政策，承担机关和直属单位的人事管理、机构编制和队伍建设等工作，负责卫生健康专业技术人员资格管理。', b'1', 5, 'admin', '2022-04-04 12:12:52', 'admin', '2022-04-04 12:49:28');
INSERT INTO `cms_column` VALUES (23, '2020', '部门介绍', 'Department Info', 7, 68, 20, '承担健康中国战略协调推进工作，组织拟订卫生健康事业发展中长期规划，指导卫生健康服务体系及信息化建设，组织开展爱国卫生运动和卫生健康统计工作。承担《烟草控制框架公约》牵头履约工作。', b'1', 5, 'admin', '2022-04-04 12:13:22', 'admin', '2022-04-04 12:49:47');
INSERT INTO `cms_column` VALUES (24, '2030', '分支机构', 'Branches Info', 7, 69, 30, '承担深化医药卫生体制改革具体工作，研究提出深化医药卫生体制改革重大方针、政策、措施的建议，承担组织推进公立医院综合改革工作。', b'1', 5, 'admin', '2022-04-04 12:18:50', 'admin', '2022-04-04 12:50:08');
INSERT INTO `cms_column` VALUES (25, '3010', '专家成员', 'Experts Team', 8, 62, 10, '专家成员', b'1', 5, 'admin', '2022-04-04 12:21:25', 'admin', '2022-04-04 12:36:43');
INSERT INTO `cms_column` VALUES (26, '3020', '单位会员', 'Unit Member', 8, 63, 20, '', b'1', 5, 'admin', '2022-04-04 12:23:48', 'admin', '2022-04-04 12:36:53');
INSERT INTO `cms_column` VALUES (27, '4010', '组织介绍', 'Orgnization Info', 9, NULL, 10, '', b'1', 5, 'admin', '2022-04-04 12:26:03', 'admin', '2022-04-04 12:26:12');
COMMIT;

-- ----------------------------
-- Table structure for mem_registration
-- ----------------------------
DROP TABLE IF EXISTS `mem_registration`;
CREATE TABLE `mem_registration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgname` varchar(100) DEFAULT NULL,
  `linkman` varchar(50) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `complete_flag` bit(1) DEFAULT b'0',
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `lastmodified_by` varchar(20) DEFAULT NULL,
  `lastmodified_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mem_registration
-- ----------------------------
BEGIN;
INSERT INTO `mem_registration` VALUES (1, '单位一', '张三', '1301011232', '0:0:0:0:0:0:0:1', b'0', 'admin', '2022-04-27 10:04:27', 'admin', '2022-04-27 10:04:27');
INSERT INTO `mem_registration` VALUES (2, '单位二', '李四', '1301011232', '127.0.0.1', b'0', 'admin', '2022-04-27 10:09:33', 'admin', '2022-04-27 10:09:33');
INSERT INTO `mem_registration` VALUES (4, '123', '123', '123', '127.0.0.1', b'0', 'admin', '2022-04-27 14:43:13', 'admin', '2022-04-27 14:43:13');
INSERT INTO `mem_registration` VALUES (5, '001', '002', '003', '127.0.0.1', b'1', 'admin', '2022-04-27 21:31:11', 'admin', '2022-04-28 07:23:26');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `order_value` int(11) DEFAULT NULL,
  `memo` varchar(2000) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `lastmodified_by` varchar(20) DEFAULT NULL,
  `lastmodified_time` datetime DEFAULT NULL,
  `dict_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item` (
  `id` bigint(20) NOT NULL,
  `dict_code` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `order_value` int(11) DEFAULT NULL,
  `memo` varchar(2000) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `lastmodified_by` varchar(20) DEFAULT NULL,
  `lastmodified_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `lastmodified_by` varchar(20) DEFAULT NULL,
  `lastmodified_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '123456', '管理员', 'ROLE_ADMIN', 'admin', '2022-01-26 16:52:33', 'admin', '2022-03-17 16:51:59');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
