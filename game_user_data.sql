/*
 Navicat Premium Dump SQL

 Source Server         : node
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : game_user_data

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 27/02/2026 17:44:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for character_dialogues
-- ----------------------------
DROP TABLE IF EXISTS `character_dialogues`;
CREATE TABLE `character_dialogues`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_id` int NOT NULL,
  `catchphrase` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_character`(`character_id` ASC) USING BTREE,
  CONSTRAINT `fk_character` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_dialogues
-- ----------------------------
INSERT INTO `character_dialogues` VALUES (1, 1, '\"我，即是战争的……什么来着？\"', '在被悬空城上的萨卡兹们发现前，别礼只是一个被卡普里尼守墓人夫妇收养的善良女孩。由于养父母的熏陶，年轻的食腐者不愿惊扰任何一人的死亡，拒绝本能对“进食”的呼唤，这让她总是饿得昏天黑地，因为自卑而在人前畏畏缩缩。\r\n一次偶遇让塞什卡发现了别礼的潜力。在“超划算零工”和“抑制本能的特训”双重引诱下，别礼成为了商人们口中的“战争王庭公主”。如今，她身着巫术时刻的测试款作战服，为了终末地的目标挥舞霜雪和兵刃——既是履行合同，也是为了终末地向她展示的，真正能让生命平和安宁的明天。\r\n\r\n“如果塞什卡的合约到期了，您也可以继续找我……啊，这个不可以讲的，要、要对其他人保密哦！”', '2026-02-23 21:34:01', '2026-02-23 22:21:48');
INSERT INTO `character_dialogues` VALUES (2, 2, '\"这把铳手感不错！恩……设计上还有拓展空间，我会把它改成我的专属款！\"', '伊冯是终末地工业特种技术部门的干员，现负责对超域、侵蚀及相关装置的研究。\r\n单从外表来看，伊冯就像是一位叛逆的时尚少女：给自己的角、尾巴和指甲涂上惹眼的色彩；翘掉学术会议去购买时尚杂志和流行唱片……伊冯总会被新奇的事物吸引，以离经叛道的姿态走在潮流最前端。\r\n但没有任何人敢否认她是绝对的天才。从学生时代开始，伊冯就在科研领域获得了令人艳羡的成就，然而，当所有人都认为她会入职大型研究所，成为科研的领航人时，伊冯却选择离开那些地方，加入了终末地。\r\n理由？她从没说过，或许你能问出答案。\r\n\r\n“我能给装备改涂装吗？我觉得它的颜色跟我的头发不搭。”', '2026-02-23 21:37:23', '2026-02-23 22:21:59');
INSERT INTO `character_dialogues` VALUES (3, 3, '\"火焰，照亮黄昏！\"', '莱万汀来自罗德岛，在该公司与终末地工业的框架协议范围内，通过管理员的直接引荐，以管理员直属干员的身份为终末地工业提供服务。\r\n在加入终末地工业之前，莱万汀曾独自游历，追寻一个属于她自己的目标。由于这样的经历，加之独立作战能力十分强大，她经常被误会成“不能沟通的人”——当然，这与事实相去甚远。只是因为她真诚、坦率的性格有时确实过于外显，导致一些人对她产生了误会。\r\n不过，她有时候会说一些令他人费解的事情，比如经常挂在嘴边的那些关于“记忆”的话题，就好像她刻意在与“自己”划清界限一样。\r\n她经常挥舞着火焰，又十分喜欢冰淇淋——于她而言，这也许是一件自然而然的事吧。\r\n\r\n“如果还觉得冷，可以往我这边靠。”', '2026-02-23 21:37:54', '2026-02-23 22:22:52');
INSERT INTO `character_dialogues` VALUES (4, 4, '\"你好呀！你身上有一股令人怀念的气味……好像一封没有写完的信，我很好奇它会去往哪里。\"', '洁尔佩塔来自罗德岛，在该公司与终末地工业的框架协议范围内，加入特种技术部门，以信使的身份为终末地工业提供服务。洁尔佩塔擅长使用一种十分罕见的源石技艺，可以影响身边的重力。\r\n在终末地，洁尔佩塔负责多个基地、据点间的书信传递与情报输送，常常游走在文明环带与开拓区的交界处，她似乎十分享受这份工作。近日，她开始表达“寻求挑战、磨练自己”的意图，要求承担更多高风险地区的任务。\r\n据华法琳所说，洁尔佩塔开朗乐观的模样，和对未来怀抱着的那一丝忐忑与憧憬，曾让自己既感到意外，又有点怀念。\r\n\r\n“看这里！瞧，信使小姐带着你的信飞来咯！”', '2026-02-23 21:39:26', '2026-02-23 22:22:49');
INSERT INTO `character_dialogues` VALUES (5, 5, '\"这片土地还有太多的未知，我们必须了解脚下的这颗星球，就像……我们应该更加了解我们自己。对吧，前辈？\"', '艾尔黛拉来自罗德岛，在该公司与终末地工业的框架协议范围内，以地质研究专家的身份为终末地工业提供服务。\r\n艾尔黛拉曾专注于火山，但如今投身于超域与地质灾害研究。她常年独自奔走在灾害现场，亲自采集样本，分析结构，总结理论，为终末地制定侵蚀应对措施提供了重要依据。\r\n她始终谦逊、礼貌，内心仿佛有着永不枯竭的力量。只要还能爬更多山，走更多路，聆听属于这个世界的声音，尽情探索这颗星球的秘密，就能让她感到很开心。\r\n对了，如果能和艾尔黛拉成为好朋友，那么多利先生也会喜欢你的。\r\n\r\n“多利先生？别乱跑哦！和前辈打个招呼吧。”', '2026-02-23 21:39:37', '2026-02-23 22:22:44');
INSERT INTO `character_dialogues` VALUES (6, 6, '\"看来我不只在武学上有天赋嘛，当你的干员是不是也是一把好手？\"', '陈千语是终末地工业的干员，是危机处理小组的核心成员之一。\r\n她自幼接受母亲和谈剑堂的教导，磨练武艺。刻苦的训练不仅让她收获了过硬的战斗素养，还练就了同龄人中少有的心理素质。尽管从未亲眼见过那把传说中的赤霄剑，陈千语还是以自己独创的“赤霄剑法”为荣，行侠仗义。\r\n只身仗剑游历塔卫二数年后，陈千语在佩丽卡的邀请下加入了终末地。作为天生的乐天派，陈千语以饱满的热情介入一切亟需解决的困难。\r\n\r\n“管理员，我曾听说，妈妈的剑能碰触到天上的云彩。我会做到的，然后，成为你和佩丽卡最信任的人！”', '2026-02-23 21:40:06', '2026-02-23 22:22:42');
INSERT INTO `character_dialogues` VALUES (7, 7, '\"我们曾这样不断抵抗……期待着你能再一次归来。\"', '佩丽卡，终末地工业的监督和官方发言人，主要负责管理和推进协议源石技术的开发和应用，同时也承担帝江号的管理工作。\r\n作为一位杰出的协议技术专家，她的专业成果对于这种技术的适应性发展及其进一步应用产生了重要的影响，并推动了集成工业系统的完善。\r\n佩丽卡能够果断且冷静地应对各种危机，但终末地工业所面临的挑战总是超出预期。在管理员休眠期间，她正式接管了危机处理小组的指挥权，领导终末地工业的“英雄们”为了一个无私的目标而战。她来回奔波于文明环带的各处，为终末地的平稳发展竭尽全力。\r\n\r\n“只有徒步行走在这片大地上，我们才能感受到生命的气息……这也是终末地战斗的意义。”', '2026-02-23 21:40:18', '2026-02-23 22:22:40');
INSERT INTO `character_dialogues` VALUES (8, 8, '\"不会的菜式就得多练！这可不是为了出风头，我掌勺就图个做得敞亮，吃得爽心！\"', '大潘出身于宏山科学院，在离开那里后，主要从事各项“离散型关键科研后勤支持工作”，也就是厨师、电工、司机、职业练摊儿等等。他最新的岗位调动则是以个人身份，加入终末地工业的特种技术部门。\r\n在众多身份中，最令他自豪的还是做一名游历四方的厨师。他热衷于钻研食谱、创新菜式，最大的乐趣是做出各种美味佳肴，赢得食客们的赞美。\r\n大潘有个从不离身的水杯，很少有人能够注意到。若注意到的人懂得炎国文字，便会好奇它的来历；若那人也来自宏山，便自然会明白这物件从何而来，以及它仅颁发给“先进科研工作者”的分量。\r\n\r\n“今天我掌勺，弄了点新鲜的，您先尝尝！”', '2026-02-23 21:40:31', '2026-02-23 22:22:38');
INSERT INTO `character_dialogues` VALUES (9, 9, '\"当我们彼此联结，智慧便会涌现。\"', '赛希来自寂语修会——由拉特兰派遣至塔卫二的技术研修组织。她所归属的会话派，将演算和语言分析视为通往真知的道路。\r\n相比起与人交流，赛希更擅长运用信息技术。就连寂语修会的修道院院长也无法否认，赛希拥有难得的天赋。因此，即便在她“擅自”对大教堂的穹顶实行了升级，引发了一连串事故后，院长仍然真挚地将她引荐到终末地工业，以便她能更好地发挥能力。\r\n如今，赛希在帝江号上参与协议源石网络的搭建与系统集成等信息工程事务。她对于源石网络的独到见解，辅以修会丰富的知识储备，令其成为终末地不可或缺的一员。\r\n\r\n“古老的知识，不要让我们陷入诱惑，但救我们免于险恶……我是赛希，管理员，愿您得到启迪。”', '2026-02-23 21:40:43', '2026-02-23 22:22:35');
INSERT INTO `character_dialogues` VALUES (10, 10, '\"风速适中，能见度良好，是滑雪的好天气。\"', '昼雪来自罗德岛，在该公司与终末地工业的框架协议范围内，以救援专家的身份为终末地工业提供服务。\r\n由于众所周知的原因，塔卫二真正的极地目前对于人类而言还是个禁区。但随着开拓区重新扩大，文明环带对像昼雪这样了解极地和高海拔区地理环境的专家的需求不言而喻。\r\n正因为这一巨大的人才缺口，即使没有特殊任务时，昼雪和她的救援队伍每天也很忙碌。\r\n不过她还是利用业余时间完成了她的《极地生存指南》，这本书已经成为了塔卫二冰雪条件下的生存与救援所不可或缺的关键参考。\r\n\r\n“我喜欢冰雪，喜欢雪山，喜欢这些严寒下依然璀璨的事物……所以我才更不希望它们给人带来痛苦的回忆。”', '2026-02-27 16:29:45', '2026-02-27 16:29:45');
INSERT INTO `character_dialogues` VALUES (11, 11, '\"信使要护送许多秘密，每一个秘密都有昂贵的价格，但比它们更昂贵的，是……我的守口如瓶。\"', '艾维文娜是一名武装信使。\r\n在加入终末地工业之前，艾维文娜曾在合金萝卜自由市里一个庞大的物流家族中生活，但寄寓在家族血脉中对于旅行的向往，驱使她主动离开了原来的生活，踏上旅途。在塔卫二众多不同的目的地之间，艾维文娜发现了它们共同的联系——神秘的管理员。\r\n艾维文娜擅长社交，她总能以成熟、职业的方式恰到好处地处理各类人际关系。至于她是不是像看起来那样脾气好，这恐怕就要在和她接触后，才能作出判断了。\r\n\r\n“没有人喜欢被人拒绝……所以，能好好说话就能解决的事儿，我当然不想动手啦。不过，我也不喜欢被人拒绝哦。”', '2026-02-27 16:30:05', '2026-02-27 16:30:05');
INSERT INTO `character_dialogues` VALUES (12, 12, '\"事态紧急，我希望尽快了解你的作战计划……最好就是现在。\"', '骏卫来自罗德岛，在该公司与终末地工业的框架协议范围内，以军事顾问的身份为终末地工业提供服务。\r\n骏卫拥有丰富的军事理论知识和团队作战经验，能够在战场上指挥应对各种突发状况。在他来到终末地工业之前，就已经在铁誓军中担任了盾卫旗队的指挥官。在抗击天使的最前线，他和他的盾卫被誉为最值得信赖的作战队伍之一。因为塔卫二日益复杂的局势需要，他毅然决然地选择加入终末地工业。\r\n他坚信着管理员会将塔卫二带往一条全新的道路，亦如他曾经所认为的那样。\r\n\r\n“我相信，管理员你所做的，会让这惨烈的循环得到一份庄严的结局。”', '2026-02-27 16:30:23', '2026-02-27 16:30:23');
INSERT INTO `character_dialogues` VALUES (13, 13, '\"我来终末地就是为了学东西的！只是……这里的东西多得有点儿学不完啊……要加把劲！\"', '黎风出生于武陵城，目前正在终末地工业特种技术部门学习实践。\r\n黎风是武陵闻名遐迩、人见人爱的孩子王。在大潘多年的教导下，黎风习得了一手漂亮的枪法，以此向他扬善惩恶的目标而努力。从他的外表来看，很难有人联想到他过去的阴影——事故击碎了原本幸福美满的家庭，也使得他失去了一条手臂。但灾难始终阻挡不了少年的锋芒，他认真而热情地成长，渴望承担更多的责任。有朝一日，他会独当一面，然后回到需要他保护的家乡。\r\n\r\n“有朝一日，我会扛起一切的。管理员，等我。”', '2026-02-27 16:30:46', '2026-02-27 16:30:46');
INSERT INTO `character_dialogues` VALUES (14, 14, '\"扰乱？牵制？还是……一步到位？\"', '终末地Z7行动组成员，负责侦察和战线扰乱工作。萤石对街头规矩和宵小伎俩的了解和她的铳法一样，已经为小队避免了不计其数的麻烦。她来自文明环带边缘的开拓区，在一次又一次迁移和流浪中锻炼出了与众不同的观察力。大部分时候，她只是在房间一角似笑非笑地旁听，就能让人感到自己的每一丝纰漏都已经被看穿，压力倍增。\r\n然而，这绝不意味着萤石是个善解人意的人——对人心的敏锐把握不仅给萤石带来了出色的战场嗅觉，却也让她成为了小队当中最擅长用几句话招惹任何人，给工作带来无数麻烦的不稳定因素。\r\n\r\n“不说点什么吗？恩……要不，散会？”', '2026-02-27 16:31:04', '2026-02-27 16:31:04');

-- ----------------------------
-- Table structure for character_role_damage
-- ----------------------------
DROP TABLE IF EXISTS `character_role_damage`;
CREATE TABLE `character_role_damage`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_id` int NOT NULL,
  `role_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色定位：1-6',
  `damage_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '伤害类型：1-5',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_character_role_damage`(`character_id` ASC) USING BTREE,
  CONSTRAINT `fk_character_role_damage` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_role_damage
-- ----------------------------
INSERT INTO `character_role_damage` VALUES (1, 1, 'profession_4.png', 'property_4.png');
INSERT INTO `character_role_damage` VALUES (2, 2, 'profession_5.png', 'property_4.png');
INSERT INTO `character_role_damage` VALUES (3, 3, 'profession_4.png', 'property_3.png');
INSERT INTO `character_role_damage` VALUES (4, 4, 'profession_5.png', 'property_2.png');
INSERT INTO `character_role_damage` VALUES (5, 5, 'profession_5.png', 'property_2.png');

-- ----------------------------
-- Table structure for character_skills
-- ----------------------------
DROP TABLE IF EXISTS `character_skills`;
CREATE TABLE `character_skills`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_id` int NOT NULL,
  `skill_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `skill_type` enum('普通攻击','战技','连携技','终结技') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `character_id`(`character_id` ASC) USING BTREE,
  CONSTRAINT `character_skills_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_skills
-- ----------------------------
INSERT INTO `character_skills` VALUES (1, 1, '严霜之舞', '普通攻击', NULL);
INSERT INTO `character_skills` VALUES (2, 1, '塞什卡的秘传', '战技', NULL);
INSERT INTO `character_skills` VALUES (3, 1, '噬冬', '连携技', NULL);
INSERT INTO `character_skills` VALUES (4, 1, '临终别礼', '终结技', NULL);
INSERT INTO `character_skills` VALUES (5, 2, '雀跃扳机', '普通攻击', NULL);
INSERT INTO `character_skills` VALUES (6, 2, '冰冰弹·β型', '战技', NULL);
INSERT INTO `character_skills` VALUES (7, 2, '速冻仔·υ37', '连携技', NULL);
INSERT INTO `character_skills` VALUES (8, 2, '冷冻射手', '终结技', NULL);
INSERT INTO `character_skills` VALUES (9, 3, '燃烬', '普通攻击', NULL);
INSERT INTO `character_skills` VALUES (10, 3, '焚灭', '战技', NULL);
INSERT INTO `character_skills` VALUES (11, 3, '沸腾', '连携技', NULL);
INSERT INTO `character_skills` VALUES (12, 3, '沸腾', '终结技', NULL);
INSERT INTO `character_skills` VALUES (13, 4, '秘杖·束能技艺', '普通攻击', NULL);
INSERT INTO `character_skills` VALUES (14, 4, '秘杖·束能技艺', '战技', NULL);
INSERT INTO `character_skills` VALUES (15, 4, '秘杖·矩阵位移', '连携技', NULL);
INSERT INTO `character_skills` VALUES (16, 4, '秘杖·重力场', '终结技', NULL);
INSERT INTO `character_skills` VALUES (17, 5, '秘杖·重力场', '普通攻击', NULL);
INSERT INTO `character_skills` VALUES (18, 5, '奔腾的多利', '战技', NULL);
INSERT INTO `character_skills` VALUES (19, 5, '火山蘑菇云', '连携技', NULL);
INSERT INTO `character_skills` VALUES (20, 5, '毛茸茸派对', '终结技', NULL);
INSERT INTO `character_skills` VALUES (21, 6, '破飞霞', '普通攻击', NULL);
INSERT INTO `character_skills` VALUES (22, 6, '归穹宇', '战技', NULL);
INSERT INTO `character_skills` VALUES (23, 6, '见天河', '连携技', NULL);
INSERT INTO `character_skills` VALUES (24, 6, '冽风霜', '终结技', NULL);
INSERT INTO `character_skills` VALUES (25, 7, '协议α·突破', '普通攻击', NULL);
INSERT INTO `character_skills` VALUES (26, 7, '协议ω·雷击', '战技', NULL);
INSERT INTO `character_skills` VALUES (27, 7, '即时协议·闪链\r\n即时协议·闪链', '连携技', NULL);
INSERT INTO `character_skills` VALUES (28, 7, '协议ε·70.41κ', '终结技', NULL);
INSERT INTO `character_skills` VALUES (29, 8, '滚刀切！', '普通攻击', NULL);
INSERT INTO `character_skills` VALUES (30, 8, '颠勺！', '战技', NULL);
INSERT INTO `character_skills` VALUES (31, 8, '加料！', '连携技', NULL);
INSERT INTO `character_skills` VALUES (32, 8, '切丝入锅！', '终结技', NULL);
INSERT INTO `character_skills` VALUES (33, 9, '冷却', '普通攻击', NULL);
INSERT INTO `character_skills` VALUES (34, 9, '分布式拒绝服务', '战技', NULL);
INSERT INTO `character_skills` VALUES (35, 9, '压力测试', '连携技', NULL);
INSERT INTO `character_skills` VALUES (36, 9, '栈溢出', '终结技', NULL);
INSERT INTO `character_skills` VALUES (37, 10, '失温猛击', '普通攻击', NULL);
INSERT INTO `character_skills` VALUES (38, 10, '饱和性防御', '战技', NULL);
INSERT INTO `character_skills` VALUES (39, 10, '极地救援', '连携技', NULL);
INSERT INTO `character_skills` VALUES (40, 10, '凛冽寒霜', '终结技', NULL);
INSERT INTO `character_skills` VALUES (41, 11, '雷枪·疾袭', '普通攻击', NULL);
INSERT INTO `character_skills` VALUES (42, 11, '雷枪·截回', '战技', NULL);
INSERT INTO `character_skills` VALUES (43, 11, '雷枪·掣击', '连携技', NULL);
INSERT INTO `character_skills` VALUES (44, 11, '雷枪·决颤', '终结技', NULL);
INSERT INTO `character_skills` VALUES (45, 12, '全面攻势', '普通攻击', NULL);
INSERT INTO `character_skills` VALUES (46, 12, '粉碎阵线', '战技', NULL);
INSERT INTO `character_skills` VALUES (47, 12, '盈月邀击', '连携技', NULL);
INSERT INTO `character_skills` VALUES (48, 12, '盾卫旗队，上前', '终结技', NULL);
INSERT INTO `character_skills` VALUES (49, 13, '摧破', '普通攻击', NULL);
INSERT INTO `character_skills` VALUES (50, 13, '荡浊身', '战技', NULL);
INSERT INTO `character_skills` VALUES (51, 13, '忿怒相', '连携技', NULL);
INSERT INTO `character_skills` VALUES (52, 13, '不动心', '终结技', NULL);
INSERT INTO `character_skills` VALUES (53, 14, '独门射击法', '普通攻击', NULL);
INSERT INTO `character_skills` VALUES (54, 14, '小惊喜', '战技', NULL);
INSERT INTO `character_skills` VALUES (55, 14, '免费赠礼', '连携技', NULL);
INSERT INTO `character_skills` VALUES (56, 14, '巅峰闹剧', '终结技', NULL);

-- ----------------------------
-- Table structure for character_stats
-- ----------------------------
DROP TABLE IF EXISTS `character_stats`;
CREATE TABLE `character_stats`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_id` int NOT NULL,
  `strength` int NULL DEFAULT NULL COMMENT '力量',
  `agility` int NULL DEFAULT NULL COMMENT '敏捷',
  `intelligence` int NULL DEFAULT NULL COMMENT '智识',
  `willpower` int NULL DEFAULT NULL COMMENT '意志',
  `hp` int NULL DEFAULT NULL COMMENT '生命值',
  `attack` int NULL DEFAULT NULL COMMENT '攻击力',
  `defense` int NULL DEFAULT NULL COMMENT '防御力',
  `main_ability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '主能力',
  `secondary_ability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '副能力',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `character_id`(`character_id` ASC) USING BTREE,
  CONSTRAINT `character_stats_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_stats
-- ----------------------------
INSERT INTO `character_stats` VALUES (1, 1, 21, 8, 9, 15, 500, 30, 0, 'strength.png', 'will.png');
INSERT INTO `character_stats` VALUES (2, 2, 8, 14, 24, 10, 500, 30, 0, 'intelligence.png', 'agility.png');
INSERT INTO `character_stats` VALUES (3, 3, 13, 9, 22, 9, 500, 30, 0, 'intelligence.png', 'strength.png');
INSERT INTO `character_stats` VALUES (4, 4, 9, 9, 16, 20, 500, 30, 0, 'will.png', 'intelligence.png');
INSERT INTO `character_stats` VALUES (5, 5, 9, 9, 20, 15, 500, 30, 0, 'intelligence.png', 'will.png');
INSERT INTO `character_stats` VALUES (6, 6, 10, 20, 8, 9, 500, 30, 0, 'agility.png', 'strength.png');
INSERT INTO `character_stats` VALUES (7, 7, 9, 9, 21, 13, 500, 30, 0, 'intelligence.png', 'will.png');
INSERT INTO `character_stats` VALUES (8, 8, 24, 9, 10, 10, 500, 30, 0, 'strength.png', 'will.png');
INSERT INTO `character_stats` VALUES (9, 9, 9, 9, 15, 15, 500, 30, 0, 'intelligence.png', 'will.png');
INSERT INTO `character_stats` VALUES (10, 10, 18, 12, 9, 11, 500, 30, 0, 'strength.png', 'agility.png');
INSERT INTO `character_stats` VALUES (11, 11, 12, 10, 14, 15, 500, 30, 0, 'will.png', 'intelligence.png');
INSERT INTO `character_stats` VALUES (12, 12, 12, 13, 10, 20, 500, 30, 0, 'will.png', 'agility.png');
INSERT INTO `character_stats` VALUES (13, 13, 14, 20, 13, 12, 500, 30, 0, 'agility.png', 'strength.png');
INSERT INTO `character_stats` VALUES (14, 14, 14, 14, 12, 10, 500, 30, 0, 'agility.png', 'strength.png');

-- ----------------------------
-- Table structure for characters
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `spell` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称拼音',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `faction` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '阵营',
  `race` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '种族',
  `star_level` int NULL DEFAULT NULL COMMENT '星级',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '定位',
  `damage_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of characters
-- ----------------------------
INSERT INTO `characters` VALUES (1, 'bieli', '别礼', '塞什卡', '萨卡兹', 6, '2026-02-04 19:45:22', 'profession_4.png', 'property_4.png');
INSERT INTO `characters` VALUES (2, 'yifeng', '伊冯', '终末地工业', '瓦伊凡', 6, '2026-02-09 18:26:21', 'profession_5.png', 'property_4.png');
INSERT INTO `characters` VALUES (3, 'laiwantin', '莱万汀', '罗德岛', '萨卡兹', 6, '2026-02-09 18:26:54', 'profession_4.png', 'property_3.png');
INSERT INTO `characters` VALUES (4, 'jieerpeita', '洁尔佩塔', '罗德岛', '沃尔珀', 6, '2026-02-09 18:27:56', 'profession_6.png', 'property_2.png');
INSERT INTO `characters` VALUES (5, 'aierdaila', '艾尔黛拉', '罗德岛', '卡普里尼', 6, '2026-02-09 18:28:28', 'profession_6.png', 'property_2.png');
INSERT INTO `characters` VALUES (6, 'chenqianyu', '陈千语', '终末地工业', '龙', 5, '2026-02-20 21:52:40', 'profession_1.png', 'property_1.png');
INSERT INTO `characters` VALUES (7, 'peilika', '佩丽卡', '终末地工业', '黎博利', 5, '2026-02-20 21:53:16', 'profession_5.png', 'property_5.png');
INSERT INTO `characters` VALUES (8, 'dapan', '大潘', '宏山科学院', '乌萨斯', 5, '2026-02-20 21:53:57', 'profession_4.png', 'property_1.png');
INSERT INTO `characters` VALUES (9, 'saixi', '赛希', '寂语修会', '萨卡兹', 5, '2026-02-20 23:38:10', 'profession_6.png', 'property_4.png');
INSERT INTO `characters` VALUES (10, 'zhouxue', '昼雪', '罗德岛', '乌萨斯', 5, '2026-02-27 16:14:29', 'profession_2.png', 'property_4.png');
INSERT INTO `characters` VALUES (11, 'aiweiwenna', '艾维文娜', '环塔商会', '卡特斯', 5, '2026-02-27 16:15:32', 'profession_4.png', 'property_5.png');
INSERT INTO `characters` VALUES (12, 'junwei', '骏卫', '罗德岛', '黎博利', 6, '2026-02-27 16:16:29', 'profession_3.png', 'property_1.png');
INSERT INTO `characters` VALUES (13, 'lifeng', '黎风', '宏山科学院', '阿纳萨', 6, '2026-02-27 16:17:25', 'profession_1.png', 'property_1.png');
INSERT INTO `characters` VALUES (14, 'yingshi', '莹石', '终末地工业', '斐迪亚', 4, '2026-02-27 16:20:18', 'profession_5.png', 'property_2.png');

SET FOREIGN_KEY_CHECKS = 1;
