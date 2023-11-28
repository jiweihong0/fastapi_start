-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： mysql
-- 產生時間： 2023 年 11 月 28 日 04:06
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
(20, 1, 20, 56);

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
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `correct`
--
ALTER TABLE `correct`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
