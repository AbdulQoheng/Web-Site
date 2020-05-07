-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 07, 2020 at 11:42 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_website`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `username` varchar(50) NOT NULL,
  `name_authors` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`username`, `name_authors`, `password`) VALUES
('admin', 'ABD. Qohar', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id_category`, `category_name`) VALUES
(1, 'JAVA'),
(2, 'PHP'),
(3, 'MySQL');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id_comments` int(11) NOT NULL,
  `name_coments` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `id_posts` int(11) NOT NULL,
  `comments_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id_comments`, `name_coments`, `body`, `id_posts`, `comments_date`) VALUES
(1, 'Joni', 'Sangat membantu Gan', 1, '2020-05-08 00:28:07'),
(2, 'Deny', 'Mantab Gan !', 1, '2020-05-08 00:43:16');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id_posts` int(11) NOT NULL,
  `title_posts` varchar(150) NOT NULL,
  `body_posts` text NOT NULL,
  `date_posts` datetime NOT NULL,
  `image_posts` varchar(50) DEFAULT NULL,
  `id_category` int(11) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id_posts`, `title_posts`, `body_posts`, `date_posts`, `image_posts`, `id_category`, `username`) VALUES
(1, 'Apa itu JAVA?', 'Java sebagai salah satu bahasa pemrograman yang sudah berumur dari era 1990-an, kian berkembang dan melebarkan dominasinya di berbagai bidang. Salah satu penggunaan terbesar Java adalah dalam pembuatan aplikasi native untuk Android. Selain itu Java pun menjadi pondasi bagi berbagai bahasa pemrograman seperti Kotlin, Scala, Clojure, Groovy, JRuby, Jython, dan lainnya yang memanfaatkan Java Virtual Machine sebagai rumahnya.\r\n<br>\r\n<br>\r\nJava pun akrab dengan dunia saintifik dan akademik. Cukup banyak akademisi di Indonesia yang menggunakan Java sebagai alat bantu untuk menyelesaikan skripsi atau tugas akhir dengan berbagai topik yang didominasi kecerdasan buatan, data mining, enterprise architecture, aplikasi mobile, dan lainnya. Di dunia web development sendiri, Java memiliki berbagai web framework unggulan seperti Spring, Play Framework, Spark, Jakarta Struts, dan Java Server Pages.\r\n<br>\r\n<br>\r\nAnda dapat menggunakan salah satu dari tiga IDE populer seperti NetBeans, Eclipse, atau IntellijIDEA. Java pun memiliki package manager yang mulai populer sejak digunakan di Android Studio yang bernama Gradle. Yah Java yang diciptakan oleh James Gosling ini memang diambil dari sebuah nama pulau dimana James berlibur di Indonesia. Bahkan ada beberapa package Java yang diambil dari nama - nama daerah di Indonesia seperti Jakarta Struts dan Lombok.', '2020-05-07 10:26:13', 'assets/image/java.png', 1, 'admin'),
(2, 'Apa itu PHP?', 'Bahasa pemrograman PHP biasanya tidak digunakan pada keseluruhan pengembangan website, melainkan dikombinasikan dengan beberapa bahasa pemrograman lain. Misalnya saja untuk mengatur tampilan, layout, dan berbagai macam menu menggunakan CSS.\r\n<br>\r\n<br>\r\nSelain itu, terdapat juga beberapa framework PHP; Laravel, Phalcon, Codigniter, Symfoni yang saat ini banyak tersedia di internet untuk memudahkan proses pengembangan website menggunakan bahasa pemrograman tersebut.\r\n<br>\r\n<br>\r\nBahasa pemrograman ini menggunakan sistem server-side. Server-side programming adalah jenis bahasa pemrograman yang nantinya script/program tersebut akan dijalankan/diproses oleh server. Kelebihannya adalah mudah digunakan, sederhana, dan mudah untuk dimengerti dan dipelajari.\r\n\r\nSemenjak PHP menjadi bahasa pemrograman yang open source, pengembang tidak perlu menunggu sampai dengan update terbaru rilis.\r\n\r\nPengguna PHP akan lebih baik jika menggunakan versi terbaru. Sehingga jika ada rilis terbaru Anda harus menyesuaikan sistem Anda dengan versi PHP yang paling baru. Meskipun harus menggunakan versi terbaru, biaya untuk maintenance dan web development sangat terjangkau.\r\n<br>\r\n<br>\r\nBahasa pemrograman PHP membantu Anda untuk mengembangkan aplikasi berbasis web yang cukup kompleks, handal, dan cepat. Tergantung dari spesifikasi bisnis, penggunaan hosting, tingkat pengalaman, kebutuhan aplikasi, dan pengembangan timeframe. Selain itu ada banyak PHP frameworks yang dapat Anda pilih.', '2020-05-06 10:29:20', 'assets/image/php.jpg', 2, 'admin'),
(3, 'Apa itu MySQL?', 'Pada tahun 1979 merupakan awal pertama kali MySQL diciptakan, oleh Michael Monthy Widenius, seorang programmer komputer asal Swedia. Monty mengembangkan sebuah sistem database sederhana yang dinamakan UNIREG yang menggunakan koneksi low-level ISAM database engine dengan indexing. Ketika saat itu juga Monty bekerja pada perusahaan bernama TcX di Swedia.\r\n<br>\r\n<br>\r\nSelanjutnya, pada tahun 1994 TcX pada tahun mulai mengembangkan aplikasi berbasis web, dan berencana menggunakan UNIREG sebagai sistem database. Namun sayangnya, UNIREG dianggagap tidak cocok untuk database yang dinamis seperti web. Hingga akhirnya TcX mencoba memperbaiki sistem database miliknya salah satunya ialah mSQL (miniSQL) . Namun mSQL versi 1 ini juga memiliki kekurangan, yaitu tidak mendukung indexing, sehingga performanya tidak terlalu bagus.\r\n<br>\r\n<br>\r\nDengan tujuan memperbaiki performa mSQL, Monty mencoba menghubungi David Hughes (programmer yang mengembangkan mSQL) untuk menanyakan apakah ia tertarik mengembangkan sebuah konektor di mSQL yang dapat dihubungkan dengan UNIREG ISAM sehingga mendukung indexing. Namun saat itu Hughes menolak, dengan alasan sedang mengembangkan teknologi indexing yang independen untuk mSQL versi 2.\r\n<br>\r\n<br>\r\nDikarenakan penolakan tersebut, David Hughes, TcX (dan juga Monty) akhirnya memutuskan untuk merancang dan mengembangkan sendiri konsep sistem database baru. Sistem ini merupakan gabungan dari UNIREG dan mSQL (yang source codenya dapat bebas digunakan).\r\n<br>\r\n<br>\r\nSehingga pada May 1995, sebuah RDBMS baru, yang dinamakan MySQL dirilis. David Axmark dari Detron HB, rekanan TcX mengusulkan agar MySQL di â€˜jualâ€™ dengan model bisnis baru. Ia mengusulkan agar MySQL dikembangkan dan dirilis dengan gratis. Pendapatan perusahaan selanjutnya di dapat dari menjual jasa â€œsupportâ€ untuk perusahaan yang ingin mengimplementasikan MySQL. Konsep bisnis ini sekarang dikenal dengan istilah Open Source.\r\n<br>\r\n<br>\r\nSetelah mengembangkan MySQL, pada tahun 1995 maka MySQL resmi dirilis. Bahkan hingga kini MySQL dibawah naungan Oracle perusahaan yaitu kerjasama antara pengembang UNIREG (Michael Monty Widenius), mSQL (David Hughes), dan TcX.', '2020-05-05 10:30:17', 'assets/image/mysql.svg', 3, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comments`),
  ADD KEY `fk_posts_comments` (`id_posts`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id_posts`),
  ADD KEY `fk_authors` (`username`),
  ADD KEY `fk_category` (`id_category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comments` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id_posts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_posts_comments` FOREIGN KEY (`id_posts`) REFERENCES `posts` (`id_posts`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_authors` FOREIGN KEY (`username`) REFERENCES `authors` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
