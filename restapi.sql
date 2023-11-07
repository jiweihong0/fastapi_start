-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： mysql
-- 產生時間： 2023 年 11 月 07 日 07:19
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
-- 資料表結構 `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `Uid` int DEFAULT NULL,
  `Q1` varchar(500) DEFAULT NULL,
  `Q2` varchar(500) DEFAULT NULL,
  `Q3` varchar(500) DEFAULT NULL,
  `Q4` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(58, '因為它和花園有關');

-- --------------------------------------------------------

--
-- 資料表結構 `question`
--

CREATE TABLE `question` (
  `Qid` int NOT NULL,
  `question` varchar(100) DEFAULT NULL,
  `Qnid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(20, '為什麼溫室效應被稱為「溫室效應」？', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `questionnaire`
--

CREATE TABLE `questionnaire` (
  `Qnid` int NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `questionnaire_to_user`
--

INSERT INTO `questionnaire_to_user` (`id`, `Qnid`, `Uid`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `questiontooption`
--

CREATE TABLE `questiontooption` (
  `id` int NOT NULL,
  `Qid` int DEFAULT NULL,
  `Oid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(68, 20, 58);

-- --------------------------------------------------------

--
-- 資料表結構 `record`
--

CREATE TABLE `record` (
  `Rid` int NOT NULL,
  `Uid` int DEFAULT NULL,
  `Qid` int DEFAULT NULL,
  `Oid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `user_info`
--

INSERT INTO `user_info` (`Uid`, `age`, `email`, `department`, `username`, `password`, `type`, `auth`) VALUES
(1, 12, 'test001@gmail.com', 'test001', 'test001', '$2b$12$otWc9N3Hv1jM8WJ3NnIw/OkybRRuk6YMaIKS6L/JHDg67GhVyi.OC', '詞雲學習', '訪客');

-- --------------------------------------------------------

--
-- 資料表結構 `wordcloud`
--

CREATE TABLE `wordcloud` (
  `id` int NOT NULL,
  `Uid` int DEFAULT NULL,
  `Q1` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `wordcloud`
--

INSERT INTO `wordcloud` (`id`, `Uid`, `Q1`) VALUES
(1, 1, 'string');

--
-- 已傾印資料表的索引
--

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
-- 使用資料表自動遞增(AUTO_INCREMENT) `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `options`
--
ALTER TABLE `options`
  MODIFY `Oid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `question`
--
ALTER TABLE `question`
  MODIFY `Qid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `questionnaire`
--
ALTER TABLE `questionnaire`
  MODIFY `Qnid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `questionnaire_to_user`
--
ALTER TABLE `questionnaire_to_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `questiontooption`
--
ALTER TABLE `questiontooption`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `record`
--
ALTER TABLE `record`
  MODIFY `Rid` int NOT NULL AUTO_INCREMENT;

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
  MODIFY `Uid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `wordcloud`
--
ALTER TABLE `wordcloud`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 已傾印資料表的限制式
--

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
