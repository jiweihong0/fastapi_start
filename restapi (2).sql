-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： mysql
-- 產生時間： 2023 年 12 月 05 日 16:49
-- 伺服器版本： 8.1.0
-- PHP 版本： 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `restapi`
--

-- --------------------------------------------------------

--
-- 資料表結構 `correct`
--

CREATE TABLE `correct` (
  `id` int NOT NULL,
  `Qnid` int DEFAULT NULL,
  `Qid` int DEFAULT NULL,
  `Oid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- 傾印資料表的資料 `correct`
--

INSERT INTO `correct` (`id`, `Qnid`, `Qid`, `Oid`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 2),
(5, 1, 5, 1),
(6, 1, 6, 4),
(7, 1, 7, 9),
(8, 1, 8, 14),
(9, 1, 9, 17),
(10, 1, 10, 20),
(11, 1, 11, 26),
(12, 1, 12, 29),
(13, 1, 13, 33),
(14, 1, 14, 36),
(15, 1, 15, 1),
(16, 1, 16, 40),
(17, 1, 17, 45),
(18, 1, 18, 48),
(19, 1, 19, 52),
(20, 1, 20, 56),
(21, 2, 61, 1),
(22, 2, 62, 61),
(23, 2, 63, 65),
(24, 2, 64, 68),
(25, 2, 65, 72),
(26, 2, 66, 78),
(27, 2, 67, 79),
(28, 2, 68, 83),
(29, 2, 69, 88),
(30, 2, 70, 94),
(31, 2, 71, 95),
(32, 2, 72, 101),
(33, 2, 73, 106),
(34, 2, 74, 108),
(35, 2, 75, 112),
(36, 2, 76, 118),
(37, 2, 77, 122),
(38, 2, 78, 124),
(39, 2, 79, 127),
(40, 2, 80, 129);

-- --------------------------------------------------------

--
-- 資料表結構 `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `Uid` int DEFAULT NULL,
  `Q1` varchar(500) DEFAULT NULL,
  `Q2` varchar(500) DEFAULT NULL,
  `Q3` varchar(500) DEFAULT NULL,
  `Q4` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4 _general_ci;

--
-- 傾印資料表的資料 `news`
--

INSERT INTO `news` (`id`, `Uid`, `Q1`, `Q2`, `Q3`, `Q4`) VALUES
(1, 1, 'string', 'string', 'string', 'string');

-- --------------------------------------------------------

--
-- 資料表結構 `options`
--

CREATE TABLE `options` (
  `Oid` int NOT NULL,
  `option` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4 _general_ci;

--
-- 傾印資料表的資料 `options`
--

INSERT INTO `options` (`Oid`, `option`) VALUES
(1, '是'),
(2, '否'),
(3, '僅包括心理健康'),
(4, '包括水源性疾病、食源性疾病、蟲媒傳染疾病等'),
(5, '僅包括腹瀉疾病'),
(6, '並未對健康產生影響'),
(7, '氣候變遷對經濟影響非常有利'),
(8, '氣候變遷僅對農業有經濟影響'),
(9, '氣候變遷對農業、林業、漁業、能源及旅遊業等產業有區域性影響'),
(10, '氣候變遷對經濟沒有任何影響'),
(11, '京都議定書'),
(12, '柏林授權'),
(13, '蒙特婁議定書'),
(14, '聯合國氣候變遷綱要公約'),
(15, '永續發展是只關注環境保護的概念。'),
(16, '永續發展強調經濟的繁榮和社會的和諧。'),
(17, '永續發展要求平衡生態、生活和生產的關係。'),
(18, '永續發展主要關注全球政治問題。'),
(19, '經濟、科學、政治'),
(20, '環境、社會、公司治理\r\n'),
(21, '技術、文化、倫理\r\n'),
(22, '教育、健康、科技'),
(23, '降低環境保護成本\r\n'),
(24, '優化資源使用\r\n'),
(25, '提高風險管理\r\n'),
(26, '所有選項都正確\r\n'),
(27, '因為它能確保高度盈利\r\n\r\n'),
(28, '因為它是法律要求的\r\n'),
(29, '因為它有助於應對氣候變遷和社會問題\r\n'),
(30, '因為它能降低企業成本'),
(31, '碳排放\r\n'),
(32, '國際協議\r\n\r\n'),
(33, '個人的環保生活方式改變\r\n'),
(34, '碳關稅'),
(35, '增加碳排放\r\n\r\n'),
(36, '減少碳排放\r\n'),
(37, '增加溫室氣體排放\r\n'),
(38, '不關心排放'),
(39, '降低稅收\r\n\r\n'),
(40, '激勵企業減少碳足跡\r\n'),
(41, '促進碳排放\r\n'),
(42, '不影響企業'),
(43, '增加碳排放\r\n\r\n'),
(44, '讓環境變得更糟\r\n'),
(45, '創造更可持續的明天\r\n'),
(46, '放棄環保'),
(47, '天氣的瞬時變化\r\n'),
(48, '長期氣候趨勢的改變\r\n'),
(49, '地球的自轉速度\r\n'),
(50, '太陽能的使用\r\n'),
(51, '太陽的輻射\r\n\r\n'),
(52, '溫室氣體\r\n'),
(53, '海洋變化\r\n'),
(54, '地球的自轉'),
(55, '因為它使地球變得更冷\r\n\r\n'),
(56, '因為它使地球變得更熱\r\n'),
(57, '因為它和溫室無關\r\n'),
(58, '因為它和花園有關'),
(59, '二氧化碳、甲烷'),
(60, '氧化亞氮、氧氣'),
(61, '二氧化碳、甲烷、氧化亞氮'),
(62, '二氧化碳、甲烷、氧化亞氮、氧氣'),
(63, '環境保護的唯一方式'),
(64, '高度盈利的保證'),
(65, '長期競爭力和可持續發展的關鍵因素'),
(66, '社會效益的主要来源'),
(67, '高度盈利的保證\r\n\r\n'),
(68, '需保護大氣、水 資源、土地資源、海洋及海岸濕地、生物多樣性等社會效益的主要来源\r\n'),
(69, '提升國家經濟的繁榮和社會績效。\r\n'),
(70, '永續發展主要關注全球政治問題。'),
(71, '產品碳足跡標籤上所標示的數值代表產品的二氧化碳（CO2）排放量。\r\n'),
(72, '減少碳足跡除了是企業的重要責任，我們則可以以每天開車替代大眾交通工具來減少碳足跡的排放。\r\n'),
(73, '廠商分析碳足跡可以瞭解該產品在各生命週期階段產生的溫室氣體，並採取減少碳足跡的措施，透過減碳方案的實施，也可能產生節能效益。\r\n'),
(74, '各國正在推動碳排放交易，企業可以善用碳足跡評估以爭取經濟和環保的雙贏機會。\r\n'),
(75, '在全世界消除一切形式的貧困。\r\n\r\n'),
(76, '提高自然環境的保護水準。\r\n'),
(77, '確保包容和公平的優質教育。\r\n'),
(78, '以上皆是。'),
(79, '化石燃料的使用\r\n\r\n'),
(80, '增加綠地覆蓋面積\r\n'),
(81, '建立污水處理廠\r\n'),
(82, '購買環保標章商品。'),
(83, '珊瑚白化\r\n\r\n'),
(84, '產生酸雨\r\n'),
(85, '產生煙霧\r\n'),
(86, '臭氧層稀薄。'),
(87, '產品無法回收\r\n\r\n'),
(88, '資源有限度的利用\r\n'),
(89, '資源浪費\r\n'),
(90, '能源過度使用。'),
(91, '數值大代表溫室氣體含量愈低\r\n\r\n'),
(92, '數值小代表溫室氣體含量愈高\r\n'),
(93, '代表通通是環保產品\r\n'),
(94, '可以瞭解並優先選購碳排放量較低的替代品。'),
(95, '鼓勵高耗能產品開發\r\n\r\n'),
(96, '加強教育宣導\r\n'),
(97, '碳權交易\r\n'),
(98, '個人生活型態的改變。'),
(99, '極端氣候增加\r\n\r\n'),
(100, '生物棲息地改變\r\n'),
(101, '糧食產量不受影響\r\n'),
(102, '病媒傳染特性改變。'),
(103, '極地冰原融化，海 平面上升，淹沒較低窪之沿海陸地，衝擊低地國及多數國家沿海精華區\r\n\r\n'),
(104, '全球氣候變遷，導致不正常暴雨及乾旱現象，衝擊水土資源、環境衛 生及人類生命等\r\n'),
(105, '沙漠化現象擴大，生態體系改變，衝擊農林漁牧、社 經活動及全球生存環境等\r\n'),
(106, '全球暖化及氣候變遷對位處熱帶或亞熱帶的 臺灣影響較小。'),
(107, '減少氣候變化的影響\r\n\r\n'),
(108, '保護或恢復30%的陸地\r\n'),
(109, '減少化石燃料的使用\r\n'),
(110, '增加海洋保護區的數量'),
(111, '網路安全和資料隱私\r\n'),
(112, '土地資源和水資源保護\r\n\r\n'),
(113, '增加公司的營業額\r\n'),
(114, '改善員工福利和工作條件'),
(115, '建議使用蠟作為包裝用途\r\n'),
(116, '不建議使用循環箱（袋）\r\n'),
(117, '使用深色顏料印刷\r\n'),
(118, '揭露碳足跡'),
(119, '50%\r\n\r\n'),
(120, '60%\r\n'),
(121, '90%\r\n'),
(122, '95%'),
(123, '減少政府的責任\r\n'),
(124, '呼籲政府、企業和個人更清楚該承擔塑膠垃圾管理的責任\r\n'),
(125, '增加塑膠垃圾的生產\r\n'),
(126, '推動塑膠用量增加'),
(127, '正確\r\n\r\n'),
(128, '錯誤'),
(129, '美國、韓國、印度、南非'),
(130, '中國、巴西、俄羅斯、澳大利亞\r\n\r\n'),
(131, '加拿大、德國、法國、英國\r\n'),
(132, '日本、墨西哥、加納、尼日利亞');

-- --------------------------------------------------------

--
-- 資料表結構 `question`
--

CREATE TABLE `question` (
  `Qid` int NOT NULL,
  `question` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4 _general_ci DEFAULT NULL,
  `Qnid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4 _general_ci;

--
-- 傾印資料表的資料 `question`
--

INSERT INTO `question` (`Qid`, `question`, `Qnid`) VALUES
(1, '政府應該采取緊急措施來應對海岸侵蝕問題', 1),
(2, '氣候變遷不僅是一個科學概念，更是一個現實的挑戰，直接影響著我們的生活、社會和經濟', 1),
(3, '溫室效應是造成氣候變遷的重要原因之一', 1),
(4, '溫室效應是導致氣候變遷的唯一原因', 1),
(5, '溫室氣體不斷增加所造成的全球暖化現象，其影響有海平面上升、生態系統失衡 及氣候變遷', 1),
(6, '根據平台所提供的內容，「氣候變遷」對健康的衝擊包括哪些方面？', 1),
(7, '綠色和平組織提到，過度依賴煤炭及石油乃問題之本，導致極端天氣、乾旱、氣溫升高、冰川融化及海平面上升。「氣候變遷」對經濟的影響包括哪些方面？', 1),
(8, '哪個國際公約旨在處理人類活動溫室氣體排放與全球氣候變遷危機之關聯性？', 1),
(9, '永續發展的核心理念，下面哪個描述最準確？', 1),
(10, '什麼是「ESG永續發展」的三大要素？', 1),
(11, '「ESG永續發展」為企業帶來了哪些好處？', 1),
(12, '為什麼「ESG永續發展」對企業和社會重要？', 1),
(13, '「氣候行動」的核心是什麼？', 1),
(14, '什麼是「淨零排放」的目標？', 1),
(15, '溫室效應中，當太陽的輻射進入大氣層時，一部分能量被地表吸收並轉化為熱能', 1),
(16, '為了解決碳洩漏的情況，歐盟設立CBAM，制訂進口產品碳含量等規範。請問設立碳關稅後可促進何種改善？', 1),
(17, '「氣候行動」的目標是什麼？', 1),
(18, '「氣候變遷」主要指的是什麼？', 1),
(19, '什麼是「溫室效應」的主要原因？', 1),
(20, '為什麼溫室效應被稱為「溫室效應」？', 1),
(61, '溫室效應中，地表釋放的熱能波長較長，會被溫室氣體阻擋，不容易散失於大氣外，以致地球上的溫度逐年增高。', 2),
(62, '溫室氣體包括哪些呢？', 2),
(63, '「ESG永續發展」不僅僅是企業的道義責任，還是什麼？', 2),
(64, '下列有關永續發展議題敘述何者正確?', 2),
(65, '為促進產業及民眾節能減碳，政府推廣產品碳足跡的概念，請問下列敘述\r\n何者錯誤？\r\n', 2),
(66, '聯合國大會於2015年討論並制定了《2030年永續發展議程（Agenda 2030）》，其中包括詳細列出的17項永續發展目標（Sustainable Development Goals, SDGs）。這些目標包括改善健康和教育、促進經濟成長、保護環境、推動能源發展等，都是全球性問題，需要所有國家攜手解決，請問永續發展的目標包含什麼？', 2),
(67, '溫室效應為一種自然現象，現在由於下列何種原因加速其效應發生時間？', 2),
(68, '下列何者是因為全球暖化使得海水溫度上升所帶來的影響？', 2),
(69, '下列何者是永續發展的理念？', 2),
(70, '碳足跡標章上的數值意義為何？', 2),
(71, '下列何者不是國際溫室氣體減量的施行方向？', 2),
(72, '氣候變遷對台灣的影響何者錯誤？', 2),
(73, '全球暖化及氣候變遷對環境的衝擊影響何者為非？', 2),
(74, '《生物多樣性公約》第15次締約方大會（COP15）通過的《昆明-蒙特婁全球生物多樣性框架》的核心目標是什麼？', 2),
(75, '「科學基礎目標聯盟」（Science Based Targets Network）計畫在2023年上半年發佈的指南將主要關注以下哪些因素？', 2),
(76, '請問依據上述圖表，在「網購包裝減量指引2.0」。中可以看見那些目標？', 2),
(77, '「網購包裝減量指引2.0」在115年期望自有物流或實體門市循環箱（袋）使用率逐年提高至多少以上？', 2),
(78, '塑膠超載日的目的是什麼？', 2),
(79, '報告指出富裕國家的塑膠超載日通常比較晚，因為它們的垃圾處理量能相對足夠。這個敘述是？', 2),
(80, '報告中提到了哪些國家被歸類為「廢棄海綿」（Waste sponges）國家？', 2);

-- --------------------------------------------------------

--
-- 資料表結構 `questionnaire`
--

CREATE TABLE `questionnaire` (
  `Qnid` int NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4 _general_ci;

--
-- 傾印資料表的資料 `questionnaire`
--

INSERT INTO `questionnaire` (`Qnid`, `title`, `content`) VALUES
(1, '前測', NULL),
(2, '後測', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `questionnaire_to_user`
--

CREATE TABLE `questionnaire_to_user` (
  `id` int NOT NULL,
  `Qnid` int DEFAULT NULL,
  `Uid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4 _general_ci;

--
-- 傾印資料表的資料 `questionnaire_to_user`
--

INSERT INTO `questionnaire_to_user` (`id`, `Qnid`, `Uid`) VALUES
(1, 1, 1),
(2, 1, 5),
(3, 2, 5),
(4, 1, 6),
(5, 2, 6),
(6, 1, 7),
(7, 2, 7);

-- --------------------------------------------------------

--
-- 資料表結構 `questiontooption`
--

CREATE TABLE `questiontooption` (
  `id` int NOT NULL,
  `Qid` int DEFAULT NULL,
  `Oid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4 _general_ci;

--
-- 傾印資料表的資料 `questiontooption`
--

INSERT INTO `questiontooption` (`id`, `Qid`, `Oid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2),
(5, 3, 1),
(6, 3, 2),
(7, 4, 1),
(8, 4, 2),
(9, 5, 1),
(10, 5, 2),
(11, 6, 3),
(12, 6, 4),
(13, 6, 5),
(14, 6, 6),
(15, 7, 7),
(16, 7, 8),
(17, 7, 9),
(18, 7, 10),
(19, 8, 11),
(20, 8, 12),
(21, 8, 13),
(22, 8, 14),
(23, 9, 15),
(24, 9, 16),
(25, 9, 17),
(26, 9, 18),
(27, 10, 19),
(28, 10, 20),
(29, 10, 21),
(30, 10, 22),
(31, 11, 23),
(32, 11, 24),
(33, 11, 25),
(34, 11, 26),
(35, 12, 27),
(36, 12, 28),
(37, 12, 29),
(38, 12, 30),
(39, 13, 31),
(40, 13, 32),
(41, 13, 33),
(42, 13, 34),
(43, 14, 35),
(44, 14, 36),
(45, 14, 37),
(46, 14, 38),
(47, 15, 1),
(48, 15, 2),
(49, 16, 39),
(50, 16, 40),
(51, 16, 41),
(52, 16, 42),
(53, 17, 43),
(54, 17, 44),
(55, 17, 45),
(56, 17, 46),
(57, 18, 47),
(58, 18, 48),
(59, 18, 49),
(60, 18, 50),
(61, 19, 51),
(62, 19, 52),
(63, 19, 53),
(64, 19, 54),
(65, 20, 55),
(66, 20, 56),
(67, 20, 57),
(68, 20, 58),
(69, 61, 2),
(70, 61, 1),
(71, 62, 61),
(72, 63, 65),
(73, 64, 68),
(74, 65, 72),
(75, 66, 78),
(76, 67, 79),
(77, 68, 83),
(78, 69, 88),
(79, 70, 94),
(80, 71, 95),
(81, 72, 101),
(82, 73, 106),
(83, 74, 108),
(84, 75, 112),
(85, 76, 118),
(86, 77, 122),
(87, 78, 124),
(88, 79, 127),
(89, 80, 129),
(90, 62, 59),
(91, 62, 62),
(92, 62, 60),
(93, 63, 63),
(94, 63, 64),
(95, 63, 66),
(96, 64, 67),
(97, 64, 69),
(98, 64, 70),
(99, 65, 71),
(100, 65, 73),
(101, 65, 74),
(102, 66, 75),
(103, 66, 76),
(104, 66, 77),
(105, 67, 80),
(106, 67, 81),
(107, 67, 82),
(108, 68, 84),
(109, 68, 85),
(110, 68, 86),
(111, 69, 87),
(112, 69, 89),
(113, 69, 90),
(114, 70, 91),
(115, 70, 92),
(116, 70, 93),
(117, 71, 96),
(118, 71, 97),
(119, 71, 98),
(120, 72, 99),
(121, 72, 100),
(122, 72, 102),
(123, 73, 103),
(124, 73, 104),
(125, 73, 105),
(126, 74, 107),
(127, 74, 109),
(128, 74, 110),
(129, 75, 111),
(130, 75, 113),
(131, 75, 114),
(132, 76, 115),
(133, 76, 116),
(134, 76, 117),
(135, 77, 119),
(136, 77, 120),
(137, 77, 121),
(138, 78, 123),
(139, 78, 125),
(140, 78, 126),
(141, 79, 127),
(142, 79, 128),
(143, 80, 130),
(144, 80, 131),
(145, 80, 132);

-- --------------------------------------------------------

--
-- 資料表結構 `record`
--

CREATE TABLE `record` (
  `Rid` int NOT NULL,
  `Uid` int DEFAULT NULL,
  `Qid` int DEFAULT NULL,
  `Oid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4 _general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `saveqn`
--

CREATE TABLE `saveqn` (
  `id` int NOT NULL,
  `Uid` int DEFAULT NULL,
  `Qnid` int DEFAULT NULL,
  `Qid` int DEFAULT NULL,
  `Oid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- 傾印資料表的資料 `saveqn`
--

INSERT INTO `saveqn` (`id`, `Uid`, `Qnid`, `Qid`, `Oid`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 1, 2, 1),
(3, 1, 1, 3, 1),
(4, 1, 1, 4, 1),
(5, 1, 1, 5, 1),
(6, 1, 1, 6, 3),
(7, 1, 1, 7, 7),
(8, 1, 1, 8, 14),
(9, 1, 1, 9, 15),
(10, 1, 1, 10, 19),
(11, 1, 1, 11, 24),
(12, 1, 1, 12, 27),
(13, 1, 1, 13, 31),
(14, 1, 1, 14, 35),
(15, 1, 1, 15, 1),
(16, 1, 1, 16, 39),
(17, 1, 1, 17, 44),
(18, 1, 1, 18, 47),
(19, 1, 1, 19, 52),
(20, 1, 1, 20, 55),
(21, 2, 1, 1, 1),
(22, 2, 1, 2, 1),
(23, 2, 1, 3, 1),
(24, 2, 1, 4, 1),
(25, 2, 1, 5, 1),
(26, 2, 1, 6, 3),
(27, 2, 1, 7, 7),
(28, 2, 1, 8, 14),
(29, 2, 1, 9, 15),
(30, 2, 1, 10, 19),
(31, 2, 1, 11, 24),
(32, 2, 1, 12, 27),
(33, 2, 1, 13, 31),
(34, 2, 1, 14, 35),
(35, 2, 1, 15, 1),
(36, 2, 1, 16, 39),
(37, 2, 1, 17, 44),
(38, 2, 1, 18, 47),
(39, 2, 1, 19, 52),
(40, 2, 1, 20, 55),
(41, 3, 1, 1, 1),
(42, 3, 1, 2, 1),
(43, 3, 1, 3, 1),
(44, 3, 1, 4, 1),
(45, 3, 1, 5, 1),
(46, 3, 1, 6, 3),
(47, 3, 1, 7, 7),
(48, 3, 1, 8, 14),
(49, 3, 1, 9, 15),
(50, 3, 1, 10, 19),
(51, 3, 1, 11, 24),
(52, 3, 1, 12, 27),
(53, 3, 1, 13, 31),
(54, 3, 1, 14, 35),
(55, 3, 1, 15, 1),
(56, 3, 1, 16, 39),
(57, 3, 1, 17, 44),
(58, 3, 1, 18, 47),
(59, 3, 1, 19, 52),
(60, 3, 1, 20, 55),
(61, 5, 1, 1, 1),
(62, 5, 1, 2, 1),
(63, 5, 1, 3, 1),
(64, 5, 1, 4, 1),
(65, 5, 1, 5, 1),
(66, 5, 1, 6, 3),
(67, 5, 1, 7, 7),
(68, 5, 1, 8, 14),
(69, 5, 1, 9, 15),
(70, 5, 1, 10, 19),
(71, 5, 1, 11, 24),
(72, 5, 1, 12, 27),
(73, 5, 1, 13, 31),
(74, 5, 1, 14, 35),
(75, 5, 1, 15, 1),
(76, 5, 1, 16, 39),
(77, 5, 1, 17, 44),
(78, 5, 1, 18, 47),
(79, 5, 1, 19, 52),
(80, 5, 1, 20, 55);

-- --------------------------------------------------------

--
-- 資料表結構 `theme`
--

CREATE TABLE `theme` (
  `id` int NOT NULL,
  `Uid` int DEFAULT NULL,
  `Q1` varchar(500) DEFAULT NULL,
  `Q2` varchar(500) DEFAULT NULL,
  `Q3` varchar(500) DEFAULT NULL,
  `Q4` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4 _general_ci;

--
-- 傾印資料表的資料 `theme`
--

INSERT INTO `theme` (`id`, `Uid`, `Q1`, `Q2`, `Q3`, `Q4`) VALUES
(1, 1, 'string', 'string', 'string', 'string');

-- --------------------------------------------------------

--
-- 資料表結構 `trailer`
--

CREATE TABLE `trailer` (
  `id` int NOT NULL,
  `Uid` int DEFAULT NULL,
  `Q1` varchar(500) DEFAULT NULL,
  `Q2` varchar(500) DEFAULT NULL,
  `Q3` varchar(500) DEFAULT NULL,
  `Q4` varchar(500) DEFAULT NULL,
  `Q5` varchar(500) DEFAULT NULL,
  `Q6` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4 _general_ci;

--
-- 傾印資料表的資料 `trailer`
--

INSERT INTO `trailer` (`id`, `Uid`, `Q1`, `Q2`, `Q3`, `Q4`, `Q5`, `Q6`) VALUES
(1, 1, 'string', 'string', 'string', 'string', 'string', 'string'),
(2, 1, 'string', 'string', 'string', 'string', 'string', 'string');

-- --------------------------------------------------------

--
-- 資料表結構 `user_info`
--

CREATE TABLE `user_info` (
  `Uid` int NOT NULL,
  `age` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `auth` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4 _general_ci;

--
-- 傾印資料表的資料 `user_info`
--

INSERT INTO `user_info` (`Uid`, `age`, `email`, `department`, `username`, `password`, `type`, `auth`) VALUES
(1, 12, 'test001@gmail.com', 'test001', 'test001', '$2b$12$otWc9N3Hv1jM8WJ3NnIw/OkybRRuk6YMaIKS6L/JHDg67GhVyi.OC', '詞雲學習', '訪客'),
(2, 12, 'test002@gmail.com', 'test002', 'test002', '$2b$12$hhNC0kTzpcr2iYqKAkzuQ.vav8FKLG7QHBsQVuihR0hSyThnbVb/e', '詞雲學習', '訪客'),
(3, 12, 'test005@gmail.com', 'test005', 'test005', '$2b$12$lFESH1Z0hNp3/uiRC70soOeCz0zGaNEbuLWcqLY3uYk/RVeEKtgWm', '詞雲學習', '訪客'),
(5, 12, 'test006@gmail.com', 'test006', 'test006', '$2b$12$H6LRKdWCKOBadFPcL.x1mOZeeAz9XdELdYl0KsdmE.8rw2srYb9xm', '詞雲學習', '訪客'),
(6, 12, 'test007@gmail.com', 'test007', 'test007', '$2b$12$B4tG2bv1BLXfUr305PTGcOLlrsrrfAydLjPz59dGH9PGsJWPJ46O6', '詞雲學習', '訪客'),
(7, 12, 'test008@gmail.com', 'test008', 'test008', '$2b$12$D/XUd/eU9FiMF2pfvcxihuwBgLqATtjbg6LYnA8O8y0cTiemFG67y', '詞雲學習', '訪客');

-- --------------------------------------------------------

--
-- 資料表結構 `wordcloud`
--

CREATE TABLE `wordcloud` (
  `id` int NOT NULL,
  `Uid` int DEFAULT NULL,
  `Q1` varchar(500) DEFAULT NULL,
  `Q2` varchar(500) DEFAULT NULL,
  `Q3` varchar(500) DEFAULT NULL,
  `Q4` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- 傾印資料表的資料 `wordcloud`
--

INSERT INTO `wordcloud` (`id`, `Uid`, `Q1`, `Q2`, `Q3`, `Q4`) VALUES
(1, 5, 'string', 'string', 'string', 'string'),
(2, 7, 'string', 'string', 'string', 'string');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `correct`
--
ALTER TABLE `correct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Qnid` (`Qnid`),
  ADD KEY `Qid` (`Qid`),
  ADD KEY `Oid` (`Oid`),
  ADD KEY `ix_correct_id` (`id`);

--
-- 資料表索引 `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Uid` (`Uid`),
  ADD KEY `ix_news_id` (`id`);

--
-- 資料表索引 `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`Oid`),
  ADD KEY `ix_options_Oid` (`Oid`);

--
-- 資料表索引 `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`Qid`),
  ADD KEY `Qnid` (`Qnid`),
  ADD KEY `ix_question_Qid` (`Qid`);

--
-- 資料表索引 `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD PRIMARY KEY (`Qnid`),
  ADD KEY `ix_questionnaire_Qnid` (`Qnid`);

--
-- 資料表索引 `questionnaire_to_user`
--
ALTER TABLE `questionnaire_to_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Qnid` (`Qnid`),
  ADD KEY `Uid` (`Uid`),
  ADD KEY `ix_questionnaire_to_user_id` (`id`);

--
-- 資料表索引 `questiontooption`
--
ALTER TABLE `questiontooption`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Qid` (`Qid`),
  ADD KEY `Oid` (`Oid`),
  ADD KEY `ix_questiontooption_id` (`id`);

--
-- 資料表索引 `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`Rid`),
  ADD KEY `Uid` (`Uid`),
  ADD KEY `Qid` (`Qid`),
  ADD KEY `Oid` (`Oid`),
  ADD KEY `ix_record_Rid` (`Rid`);

--
-- 資料表索引 `saveqn`
--
ALTER TABLE `saveqn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Uid` (`Uid`),
  ADD KEY `Qnid` (`Qnid`),
  ADD KEY `Qid` (`Qid`),
  ADD KEY `Oid` (`Oid`),
  ADD KEY `ix_saveqn_id` (`id`);

--
-- 資料表索引 `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Uid` (`Uid`),
  ADD KEY `ix_theme_id` (`id`);

--
-- 資料表索引 `trailer`
--
ALTER TABLE `trailer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Uid` (`Uid`),
  ADD KEY `ix_trailer_id` (`id`);

--
-- 資料表索引 `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`Uid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `ix_user_info_Uid` (`Uid`);

--
-- 資料表索引 `wordcloud`
--
ALTER TABLE `wordcloud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Uid` (`Uid`),
  ADD KEY `ix_wordcloud_id` (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `correct`
--
ALTER TABLE `correct`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `options`
--
ALTER TABLE `options`
  MODIFY `Oid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `question`
--
ALTER TABLE `question`
  MODIFY `Qid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `questionnaire`
--
ALTER TABLE `questionnaire`
  MODIFY `Qnid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `questionnaire_to_user`
--
ALTER TABLE `questionnaire_to_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `questiontooption`
--
ALTER TABLE `questiontooption`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `record`
--
ALTER TABLE `record`
  MODIFY `Rid` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `saveqn`
--
ALTER TABLE `saveqn`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `theme`
--
ALTER TABLE `theme`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `trailer`
--
ALTER TABLE `trailer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_info`
--
ALTER TABLE `user_info`
  MODIFY `Uid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `wordcloud`
--
ALTER TABLE `wordcloud`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `correct`
--
ALTER TABLE `correct`
  ADD CONSTRAINT `correct_ibfk_1` FOREIGN KEY (`Qnid`) REFERENCES `questionnaire` (`Qnid`),
  ADD CONSTRAINT `correct_ibfk_2` FOREIGN KEY (`Qid`) REFERENCES `question` (`Qid`),
  ADD CONSTRAINT `correct_ibfk_3` FOREIGN KEY (`Oid`) REFERENCES `options` (`Oid`);

--
-- 資料表的限制式 `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`Uid`) REFERENCES `user_info` (`Uid`);

--
-- 資料表的限制式 `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`Qnid`) REFERENCES `questionnaire` (`Qnid`);

--
-- 資料表的限制式 `questionnaire_to_user`
--
ALTER TABLE `questionnaire_to_user`
  ADD CONSTRAINT `questionnaire_to_user_ibfk_1` FOREIGN KEY (`Qnid`) REFERENCES `questionnaire` (`Qnid`),
  ADD CONSTRAINT `questionnaire_to_user_ibfk_2` FOREIGN KEY (`Uid`) REFERENCES `user_info` (`Uid`);

--
-- 資料表的限制式 `questiontooption`
--
ALTER TABLE `questiontooption`
  ADD CONSTRAINT `questiontooption_ibfk_1` FOREIGN KEY (`Qid`) REFERENCES `question` (`Qid`),
  ADD CONSTRAINT `questiontooption_ibfk_2` FOREIGN KEY (`Oid`) REFERENCES `options` (`Oid`);

--
-- 資料表的限制式 `record`
--
ALTER TABLE `record`
  ADD CONSTRAINT `record_ibfk_1` FOREIGN KEY (`Uid`) REFERENCES `user_info` (`Uid`),
  ADD CONSTRAINT `record_ibfk_2` FOREIGN KEY (`Qid`) REFERENCES `question` (`Qid`),
  ADD CONSTRAINT `record_ibfk_3` FOREIGN KEY (`Oid`) REFERENCES `options` (`Oid`);

--
-- 資料表的限制式 `saveqn`
--
ALTER TABLE `saveqn`
  ADD CONSTRAINT `saveqn_ibfk_1` FOREIGN KEY (`Uid`) REFERENCES `user_info` (`Uid`),
  ADD CONSTRAINT `saveqn_ibfk_2` FOREIGN KEY (`Qnid`) REFERENCES `questionnaire` (`Qnid`),
  ADD CONSTRAINT `saveqn_ibfk_3` FOREIGN KEY (`Qid`) REFERENCES `question` (`Qid`),
  ADD CONSTRAINT `saveqn_ibfk_4` FOREIGN KEY (`Oid`) REFERENCES `options` (`Oid`);

--
-- 資料表的限制式 `theme`
--
ALTER TABLE `theme`
  ADD CONSTRAINT `theme_ibfk_1` FOREIGN KEY (`Uid`) REFERENCES `user_info` (`Uid`);

--
-- 資料表的限制式 `trailer`
--
ALTER TABLE `trailer`
  ADD CONSTRAINT `trailer_ibfk_1` FOREIGN KEY (`Uid`) REFERENCES `user_info` (`Uid`);

--
-- 資料表的限制式 `wordcloud`
--
ALTER TABLE `wordcloud`
  ADD CONSTRAINT `wordcloud_ibfk_1` FOREIGN KEY (`Uid`) REFERENCES `user_info` (`Uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
