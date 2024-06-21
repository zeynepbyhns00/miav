-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 21 Haz 2024, 10:28:24
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `miav`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `parent` int(11) NOT NULL,
  `Ordering` int(11) DEFAULT NULL,
  `Visibility` tinyint(4) NOT NULL DEFAULT 0,
  `Allow_Comment` tinyint(4) NOT NULL DEFAULT 0,
  `Allow_Ads` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`ID`, `Name`, `Description`, `parent`, `Ordering`, `Visibility`, `Allow_Comment`, `Allow_Ads`) VALUES
(1, 'Hakkımızda', 'Hakkımızda', 0, 1, 0, 0, 0),
(2, 'Ürünler', 'Ürünler', 0, 1, 0, 0, 0),
(3, 'Bağış', '', 0, 1, 0, 0, 0),
(4, 'Bilgi', 'miav', 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

CREATE TABLE `comments` (
  `c_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `comment_date` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `items`
--

CREATE TABLE `items` (
  `Item_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Price` varchar(255) NOT NULL,
  `Add_Date` date NOT NULL,
  `Country_Made` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Rating` smallint(6) NOT NULL,
  `Approve` tinyint(4) NOT NULL DEFAULT 0,
  `Cat_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `items`
--

INSERT INTO `items` (`Item_ID`, `Name`, `Description`, `Price`, `Add_Date`, `Country_Made`, `Status`, `Rating`, `Approve`, `Cat_ID`, `Member_ID`, `picture`, `contact`) VALUES
(16, 'CAT CHOW KİTTEN ', '15KG YAVRU KEDİ MAMASI', '700', '2023-12-15', 'Türkiye', '1', 0, 1, 2, 3, '2995524322_mama.jpg', '05555555555'),
(17, 'N&D ', 'CHİCKEN&NAR AZ TAHILLI KISIR KEDİ 1,5KG', '422', '2023-12-15', 'Türkiye', '1', 0, 1, 2, 3, '1859335420_ma.jpeg', '05555555555'),
(18, 'N&D ', 'TAVUK&NAR 1,5KG TAHILSIZ KİTTEN YAVRU KEDİ MAMASI', '390', '2023-12-15', 'Türkiye', '1', 0, 1, 2, 3, '6794703861_mamaa.jpg', '05555555555'),
(19, 'N&D ', 'MORİNA&PORTAKAL&KABAK TAHILSIZ MEDİUM&MAXİ KÖPEK MAMASI 2,5KG', '610', '2023-12-15', 'Türkiye', '1', 0, 1, 2, 3, '8684102547_as.jpg', '05555555555'),
(20, 'N&D ', 'MORİNA&SOMON&KAVUNLU TAHILSIZ MEDİUM&MAXİ KÖPEK MAMASI 12KG', '1800', '2023-12-15', 'Türkiye', '1', 0, 1, 2, 3, '5526498410_ass.jpg', '05555555555'),
(21, 'deneme', 'MORİNA&PORTAKAL&KABAK TAHILSIZ MEDİUM&MAXİ KÖPEK MAMASI 2,5KG', '390', '2024-01-04', 'Türkiye', '1', 0, 1, 2, 3, '6433012755_kaktus.png', '05555555555');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL COMMENT 'To Identify User',
  `Username` varchar(255) NOT NULL COMMENT 'Username To Login',
  `Password` varchar(255) NOT NULL COMMENT 'Password To Login',
  `Email` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT 0 COMMENT 'Identify User Group',
  `TrustStatus` int(11) NOT NULL DEFAULT 0 COMMENT 'Seller Rank',
  `RegStatus` int(11) NOT NULL DEFAULT 0 COMMENT 'User Approval',
  `Date` date NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `Email`, `FullName`, `GroupID`, `TrustStatus`, `RegStatus`, `Date`, `avatar`) VALUES
(1, 'Admin', '8cb2237d0679ca88db6464eac60da96345513964', 'Admin@gmail.com', 'Admin Admin', 1, 1, 1, '2023-11-27', 'default.png'),
(3, 'Miav Shop', '8cb2237d0679ca88db6464eac60da96345513964', 'miav@miav.com', 'Miav', 0, 0, 1, '2023-12-15', '86871401_1183001430_raw.jpg'),
(4, 'rabia', '8cb2237d0679ca88db6464eac60da96345513964', 'zbeyhansuzuk@gmail.com', 'rabia', 0, 0, 0, '2024-01-04', '5249971821_kaktus.png');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Tablo için indeksler `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `items_comment` (`item_id`),
  ADD KEY `comment_user` (`user_id`);

--
-- Tablo için indeksler `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`Item_ID`),
  ADD KEY `member_1` (`Member_ID`),
  ADD KEY `cat_1` (`Cat_ID`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `comments`
--
ALTER TABLE `comments`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `items`
--
ALTER TABLE `items`
  MODIFY `Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'To Identify User', AUTO_INCREMENT=5;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_comment` FOREIGN KEY (`item_id`) REFERENCES `items` (`Item_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `cat_1` FOREIGN KEY (`Cat_ID`) REFERENCES `categories` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `member_1` FOREIGN KEY (`Member_ID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
