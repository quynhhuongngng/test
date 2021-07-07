-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2021 at 08:06 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webbansach`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `NameVN` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`Id`, `Name`, `NameVN`) VALUES
(1, 'Sách', 'Tiểu Thuyết');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentedDate` date NOT NULL,
  `userId` varchar(50) NOT NULL,
  `contentOfComment` varchar(150) NOT NULL,
  `productId` int(11) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentedDate`, `userId`, `contentOfComment`, `productId`, `ID`) VALUES
('2021-05-14', '1', 'test', 2, 18),
('2021-05-14', 'user4', 'test', 2, 19),
('2021-05-14', 'test123456', 'test', 2, 20);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `Id` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `UnitPrice` float NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Discount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(20) NOT NULL,
  `OrderDate` date NOT NULL,
  `Telephone` int(11) NOT NULL,
  `Address` varchar(60) NOT NULL,
  `Amount` float NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Id` int(11) NOT NULL,
  `Name` varchar(60) NOT NULL,
  `UnitPrice` float NOT NULL,
  `Image` varchar(50) NOT NULL,
  `ProductDate` date NOT NULL,
  `Available` bit(1) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `Discount` float NOT NULL,
  `ViewCount` int(11) NOT NULL,
  `Special` bit(1) NOT NULL,
  `Author` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Id`, `Name`, `UnitPrice`, `Image`, `ProductDate`, `Available`, `CategoryId`, `Quantity`, `Description`, `Discount`, `ViewCount`, `Special`, `Author`) VALUES
(1, 'Namiya', 1500000, 'ok roi.jpg', '2021-04-15', b'0', 1, 3, '<p>Cuốn s&aacute;ch n&agrave;y được bi&ecirc;n soạn cho đối tượng l&agrave; sinh vi&ecirc;n c&aacute;c năm cuối v&agrave; học vi&ecirc;n cao học chuy&ecirc;n ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin của c&aacute;c trường đại học kỹ thuật. S&aacute;ch cung cấp một c&aacute;ch tổng thể c&aacute;c kh&aacute;i niệm cơ bản về c&aacute;c vấn đề xung quanh bảo vệ c&aacute;c hệ thống tin học, đồng thời giới thiệu những kiến thức về lĩnh vực an to&agrave;n bảo vệ m&aacute;y t&iacute;nh ở mức độ chuy&ecirc;n s&acirc;u.</p>\r\n\r\n<p>Cuốn s&aacute;ch bao gồm 11 chương, chia l&agrave;m ba phần:</p>\r\n\r\n<p>Phần I: Cơ sở l&yacute; thuyết mật m&atilde; v&agrave; ứng dụng</p>\r\n\r\n<p>Phần II: Kiểm so&aacute;t hệ thống</p>\r\n\r\n<p>Phần III: Khảo s&aacute;t một số lĩnh vực cụ thể trong thực tế</p>\r\n\r\n<p>Phần IV: Đọc th&ecirc;m về giao thức mật m&atilde; v&agrave; khảo s&aacute;t tổng quan về tấn c&ocirc;ng từ chối dịch vụ.</p>\r\n\r\n<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&', 0.05, 52, b'0', 'Higashino'),
(2, 'Nhà Giả Kim (Tái Bản 2020)', 150000, '9ee0443157de2e51c013ff659c3e374f.jpg', '2021-05-07', b'1', 1, 2, '<p><strong>Sơ lược về t&aacute;c phẩm</strong></p>\r\n\r\n<p>Tất cả những trải nghiệm trong chuyến phi&ecirc;u du theo đuổi vận mệnh của m&igrave;nh đ&atilde; gi&uacute;p Santiago thấu hiểu được &yacute; nghĩa s&acirc;u xa nhất của hạnh ph&uacute;c, h&ograve;a hợp với vũ trụ v&agrave; con người.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 36, b'1', 'Higashino');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` varchar(20) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Fullname` varchar(50) NOT NULL,
  `Telephone` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Photo` varchar(50) NOT NULL,
  `Activated` bit(1) NOT NULL,
  `Admin` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `Password`, `Fullname`, `Telephone`, `Email`, `Photo`, `Activated`, `Admin`) VALUES
('1', '123', 'huongnnq', 111, 'huongnnq@gmail.com', '', b'1', b'1'),
('huongnnq', '123456', 'Ngô Nguyễn Quỳnh Hương', 966726907, 'quynhhuongngng@gmail.com', 'user.png', b'1', b'0'),
('test123456', '123456', 'Ngô Nguyễn Quỳnh Hương', 966726907, 'hhh@mail.com', 'user.png', b'1', b'0'),
('user4', '123', 'user4name', 111, 'user4', '', b'1', b'0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `productId` (`productId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ProductId` (`ProductId`),
  ADD KEY `OrderId` (`OrderId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CategoryId` (`CategoryId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`Id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`Id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `products` (`Id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
