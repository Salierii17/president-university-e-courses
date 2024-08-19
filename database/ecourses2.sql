-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2024 at 08:03 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecourses2`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountable_receivable`
--

CREATE TABLE `accountable_receivable` (
  `ReceivableID` int(11) NOT NULL,
  `InvoiceID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Status` enum('Pending','Paid','Overdue','Cancelled') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accountable_receivable`
--

INSERT INTO `accountable_receivable` (`ReceivableID`, `InvoiceID`, `OrderID`, `Amount`, `Status`) VALUES
(1, 1, 1, '29000.00', 'Pending'),
(2, 2, 2, '29000.00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_payable`
--

CREATE TABLE `accounts_payable` (
  `ap_id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `amount_due` decimal(10,2) NOT NULL,
  `amount_paid` decimal(10,2) DEFAULT 0.00,
  `payment_date` date DEFAULT NULL,
  `status` enum('Open','Closed','Overdue') NOT NULL DEFAULT 'Open',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_payable`
--

INSERT INTO `accounts_payable` (`ap_id`, `po_id`, `invoice_number`, `invoice_date`, `due_date`, `amount_due`, `amount_paid`, `payment_date`, `status`, `notes`) VALUES
(10, 59, 'INV-7', '2024-05-13', '2024-06-12', '500000.00', '1.00', NULL, 'Overdue', NULL),
(11, 60, 'INV-17', '2024-05-14', '2024-06-13', '1000000.00', '1.00', '2024-05-22', 'Open', NULL),
(12, 6, 'INV-6', '2024-05-14', '2024-06-13', '800000.00', '1.00', NULL, 'Open', NULL),
(13, 61, 'INV-89', '2024-05-15', '2024-06-14', '900000.00', '1.00', NULL, 'Open', NULL),
(19, 70, 'INV-70', '2024-03-05', '2024-04-05', '700000.00', '700000.00', '2024-04-03', 'Closed', NULL),
(20, 71, 'INV-71', '2024-03-10', '2024-04-10', '750000.00', '750000.00', '2024-04-07', 'Closed', NULL),
(21, 72, 'INV-72', '2024-03-15', '2024-04-15', '200000.00', '200000.00', '2024-04-15', 'Closed', NULL),
(22, 73, 'INV-73', '2024-03-20', '2024-04-20', '450000.00', '450000.00', '2024-04-17', 'Closed', NULL),
(23, 74, 'INV-74', '2024-03-25', '2024-04-25', '550000.00', '550000.00', '2024-04-22', 'Closed', NULL),
(24, 75, 'INV-75', '2024-04-05', '2024-05-05', '750000.00', '750000.00', '2024-05-02', 'Closed', 'Payment due in May'),
(25, 76, 'INV-76', '2024-04-10', '2024-05-10', '800000.00', '800000.00', '2024-05-07', 'Closed', 'Payment due in May'),
(26, 77, 'INV-77', '2024-04-15', '2024-05-15', '500000.00', '500000.00', '2024-05-13', 'Closed', 'Payment due in May'),
(27, 78, 'INV-78', '2024-04-20', '2024-05-20', '750000.00', '1.00', NULL, 'Overdue', 'Payment due in May'),
(28, 79, 'INV-79', '2024-04-25', '2024-05-25', '400000.00', '1.00', NULL, 'Overdue', 'Payment due in May');

-- --------------------------------------------------------

--
-- Table structure for table `amount_course`
--

CREATE TABLE `amount_course` (
  `course_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `amount_course`
--

INSERT INTO `amount_course` (`course_id`, `amount`) VALUES
(1, 22);

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `BanksID` int(11) NOT NULL,
  `BanksName` varchar(50) NOT NULL,
  `ImageLink` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`BanksID`, `BanksName`, `ImageLink`) VALUES
(1, 'BCA', 'bca.png'),
(2, 'BNI', 'bni.png'),
(3, 'BRI', 'bri.png'),
(4, 'BSI', 'bsi.png');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories_expenses`
--

CREATE TABLE `categories_expenses` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `balance` float NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories_expenses`
--

INSERT INTO `categories_expenses` (`id`, `category`, `description`, `status`, `balance`, `date_created`, `date_updated`) VALUES
(1, 'Hosting', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper imperdiet tortor et rhoncus. Etiam suscipit egestas faucibus. Aenean condimentum ullamcorper turpis, vestibulum maximus eros sollicitudin ut. Morbi interdum ante quis sollicitudin consectetur. Nulla urna urna, gravida et urna eu, pretium consectetur nunc. Quisque id sem porta, blandit lectus vel, feugiat ante. Pellentesque at suscipit tellus, eget posuere augue. Etiam tristique sit amet erat ut porttitor. Duis ut tortor sagittis, mattis mauris non, luctus mauris. Phasellus nec quam a augue eleifend varius nec vel tellus. Integer cursus in nibh in semper.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 19905, '2024-04-24 02:21:36', '2024-05-15 14:41:52'),
(2, 'Maintenance', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Nullam sed ipsum ut ligula ullamcorper ornare nec et tortor. Suspendisse dui erat, pulvinar ut sapien et, varius convallis tellus. Nulla facilisi. In ante felis, lacinia a ornare nec, interdum nec enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec venenatis orci in laoreet consectetur. Sed lobortis at sapien et fermentum. Pellentesque eros turpis, tincidunt id enim eu, lobortis laoreet neque. Quisque ut justo risus.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 4700, '2024-04-24 02:21:52', '2024-04-24 02:54:06'),
(3, 'Electricity', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Nullam sed ipsum ut ligula ullamcorper ornare nec et tortor. Suspendisse dui erat, pulvinar ut sapien et, varius convallis tellus. Nulla facilisi. In ante felis, lacinia a ornare nec, interdum nec enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec venenatis orci in laoreet consectetur. Sed lobortis at sapien et fermentum. Pellentesque eros turpis, tincidunt id enim eu, lobortis laoreet neque. Quisque ut justo risus.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 5000, '2024-04-24 02:22:22', '2024-04-24 03:47:13'),
(4, 'Water', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Praesent dignissim ante id sem semper scelerisque. Maecenas ac lacus egestas, cursus odio quis, tristique diam. Donec maximus congue metus at tincidunt. Suspendisse potenti. Nunc vel quam in metus aliquam placerat sed vitae lectus. Vivamus est nisl, consequat tincidunt blandit feugiat, sagittis sit amet risus. Curabitur congue est in risus mattis, malesuada tincidunt eros sodales. Donec convallis efficitur tincidunt. Etiam tellus nulla, sollicitudin tristique lacus ac, tincidunt placerat sapien.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 3000, '2024-04-24 02:23:22', '2024-04-24 03:47:28'),
(5, 'Others', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;Nulla libero urna, sodales id justo sed, feugiat semper neque. Quisque sollicitudin tellus a condimentum sagittis. Nunc aliquet libero nec justo semper, ut condimentum neque mattis. Donec tincidunt, ipsum vel pulvinar pulvinar, leo ante lobortis justo, et ultricies quam sem vitae metus. Aliquam vel sagittis lorem. Curabitur ac sem orci. Nulla nec varius turpis.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;Pellentesque quis tristique augue. In convallis, ipsum nec pellentesque scelerisque, libero nunc auctor urna, nec hendrerit mauris ante a dolor. Vivamus scelerisque magna vitae massa tristique, vel eleifend odio condimentum. Nullam suscipit ornare imperdiet. Aliquam eu orci eu nisl pharetra sagittis varius eu nisi. Nullam nec ligula tellus. Ut magna odio, imperdiet id rutrum at, pretium sit amet felis.&lt;/p&gt;', 1, 6000, '2024-04-24 02:23:53', '2024-04-24 04:34:44');

-- --------------------------------------------------------

--
-- Table structure for table `category_material`
--

CREATE TABLE `category_material` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_material`
--

INSERT INTO `category_material` (`category_id`, `category_name`) VALUES
(1, 'Book'),
(2, 'Journal'),
(3, 'Software'),
(4, 'Hardware');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `major_id` int(11) NOT NULL,
  `material_id` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL,
  `price` enum('Free','Paid') NOT NULL,
  `duration` varchar(50) NOT NULL,
  `difficulty` enum('Beginner','Intermediate','Advanced','') NOT NULL,
  `time` varchar(50) NOT NULL,
  `language` varchar(50) NOT NULL,
  `objective` varchar(800) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `description`, `faculty_id`, `major_id`, `material_id`, `img`, `start_date`, `price`, `duration`, `difficulty`, `time`, `language`, `objective`) VALUES
(1, 'Introduction to Information System', 'Millions of health-related data points are captured every day, from individual-level information collected by our personal devices and tests at the doctor\'s office to population-level data about disease prevalence and treatment outcomes. Digital technologies have transformed how we buy and listen to music and how we plan our travel. Can health care be next?\r\n\r\nThroughout this online course, you\'ll take part in a fictional hackathon, working alongside other learners to determine which digital tools to invest in. With the help of real-world case studies and protagonists, you will become the judge and evaluate how well the hackathon competitors fit the needs of patients, physicians, payers, and, ultimately, future health care ecosystems. In doing so, you\'ll consider the impact digital tools have on patients, providers, and payers to understand how data tracking and digital technologies can improve patient care, enhance communications between doctors and patients, increase employee benefits and happiness, and share data to track health trends and develop solutions.\r\nCan you transform health care with the touch of a mouse?\r\n\r\nThe Harvard Medical School is accredited by the Accreditation Council for Continuing Medical Education (ACCME) to provide continuing medical education for physicians.\r\n\r\nThis activity has been approved for AMA PRA Category 1 Credits™. Physicians should claim only the credit commensurate with the extent of their participation in the activity.\r\n\r\nUpon successful completion of the course, participants will have access to claim their credits through the Harvard Medical School\'s continuing education platform.', 3, 11, 1001, 'CS_MGT.png', '2024-03-25', 'Free', '8 weeks long', 'Beginner', '3 – 4 hours per week', 'English', 'Understand how digital technologies can address critical pain points in health care; Learn how to think about applications of collecting and using data to inform health care, and the privacy risks and analytical pitfalls unique to health care data; Explore the opportunities and difficulties of enabling digital approaches, such as artificial intelligence, machine learning, apps, and sensors; Navigate the systemic barriers and often conflicting needs of health care stakeholders in bringing digital technologies to market; Become adept at analyzing gaps in health care that can be closed with technology and data.'),
(2, 'Manufacturing Resource Planning', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 3, 11, 1001, 'SCM.png', '2024-03-25', 'Paid', '16 weeks long', 'Advanced', '7 – 9 hours per week', 'English', 'Lorem ipsum dolor sit amet consectetur.'),
(3, 'Accounting Information System', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 3, 11, 1003, 'AIS.png', '2024-03-25', 'Free', '8 weeks long', 'Beginner', '5 – 7 hours per week', 'English', 'Lorem ipsum dolor sit amet consectetur.'),
(4, 'Management Information System', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 3, 11, 1001, 'MIS.png', '2024-03-25', 'Paid', '12 weeks long', 'Intermediate', '3 – 6 hours per week', 'English', 'Lorem ipsum dolor sit amet consectetur. '),
(5, 'Financial Management', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 1, 3, 1002, 'FM_MGT.png', '2024-03-25', 'Paid', '8 weeks long', 'Intermediate', '3 – 6 hours per week', 'English', 'Lorem ipsum dolor sit amet consectetur.'),
(6, 'Consumer Behaviour', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 1, 3, 1002, 'CS_MGT.png', '2024-03-25', 'Free', '4 weeks long', 'Beginner', '2 – 4 hours per week', 'English', 'Lorem ipsum dolor sit amet consectetur.'),
(7, 'Macroeconomics', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 1, 3, 1003, 'M_MGT.png', '2024-03-25', 'Paid', '16 weeks long', 'Advanced', '9 – 11 hours per week', 'English', 'Lorem ipsum dolor sit amet consectetur.'),
(8, 'Marketing Management', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 1, 3, 2001, 'M_MGT.png', '2024-03-25', 'Paid', '6 weeks long', 'Intermediate', '5 – 7 hours per week', 'English', 'Lorem ipsum dolor sit amet consectetur.'),
(10, 'Professional English', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 1, 1, 1003, 'FM_MGT.png', '2024-05-07', 'Free', '8 week', 'Beginner', '7 – 9 hours per week', 'English', 'Lorem ipsum dolor sit amet consectetur.'),
(11, 'Economic Survival', 'ewcfwjkbfjkdfbjkwdn', 1, 1, 3001, 'FM_MGT.png', '2024-05-14', 'Free', '8 week', 'Beginner', '7 – 9 hours per week', 'English', 'wjqhdbhjkqwdjk'),
(12, 'bacot', 'WADUH', 3, 4, 3001, 'wp8281628-suisei-hoshimachi-wallpapers.jpg', '2024-05-15', 'Free', '4 week', 'Beginner', '4 hour', 'en', 'OKEDEH'),
(14, 'bacot2222', 'waduh', 3, 5, 3003, '6642da8d53c40_2.jpg', '2024-05-31', 'Paid', '4 week', 'Intermediate', '4 hour', 'en', 'okedeh'),
(15, 'bacot3428035y7th', 'waduh', 3, 2, 3002, '6642dbb958d5d_3月壁紙.png', '2024-05-15', 'Paid', '4 week', 'Intermediate', '4 hour', 'en', 'oke dah bisa'),
(16, 'tutor testing', 'okedeh', 1, 5, 4001, '6642dbf2681b4_1137053.jpg', '2024-05-17', 'Free', '4 week', 'Advanced', '4 hour', 'en', 'testing tross'),
(17, 'tutor testing32', 'iduivu', 3, 8, 3001, '664460f954027_12月壁紙.png', '2024-06-01', 'Paid', '4 week', 'Beginner', '4 hour', 'English', 'u8932deid');

-- --------------------------------------------------------

--
-- Table structure for table `databanks`
--

CREATE TABLE `databanks` (
  `DatabankID` int(11) NOT NULL,
  `BanksID` int(11) NOT NULL,
  `CardNumber` varchar(50) NOT NULL,
  `ExpiredDate` varchar(50) NOT NULL,
  `CVV` varchar(4) NOT NULL,
  `CardOwner` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `databanks`
--

INSERT INTO `databanks` (`DatabankID`, `BanksID`, `CardNumber`, `ExpiredDate`, `CVV`, `CardOwner`) VALUES
(1, 1, '1234 5678 9012 3456', '12/25', '123', 'PUEC'),
(2, 2, '9876 5432 1098 7654', '06/28', '456', 'PUEC'),
(3, 3, '5678 1234 5678 9012', '09/23', '789', 'PUEC'),
(4, 4, '1234 5678 1290 5634', '12/25', '246', 'Dummy'),
(5, 3, '3123312', '12/26', '155', 'Tata'),
(6, 3, '3123312', '12/26', '155', 'Tata'),
(7, 3, '3123312', '12/26', '155', 'Tata'),
(8, 3, '3123312', '12/26', '155', 'Tata'),
(9, 3, '3123312', '12/26', '155', 'Tata'),
(10, 3, '3123312', '12/26', '155', 'Tata'),
(11, 1, '2133', '1234', '155', 'Tata'),
(12, 3, '21324314', '10/27', '177', 'Tata'),
(13, 1, '123123', '12/27', '155', 'Tata');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `job_position_id` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `name`, `email`, `phone`, `address`, `job_position_id`, `password`) VALUES
(1, 'Sulthan', 'administrator@admin.com', '123-456-7777', 'Jawa Barat', 1, 'waduh1234'),
(2, 'Jhonson', 'Jhon1234@gmail.com', '1938109381', 'kampus hijau', 2, '1234'),
(3, 'Albert', 'albert123@gmail.com', '1424242', 'kampus hijau', 2, '12345'),
(4, 'Kairi', 'kairi1234@gmail.com', '123456', 'kampus hijau', 2, '12345'),
(5, 'Kiboy', 'Kiboy1234@gmail.com', '114314', 'kampus hijau', 2, '12345'),
(6, 'Jonathan', 'john123456@gmail.com', '224142', 'kamaa', 2, '14242'),
(7, 'Branz', 'branza@gmail.com', '131114', 'kampus hijau', 2, '1232422'),
(8, 'david', 'waduh1234@gmail.com', '0182313414', 'menteng atas', NULL, '2cf1a05395bd9d1d9da5fb9147909fc7'),
(9, 'David flash2', 'focalorss2u28@gmail.com', '082241404988', 'menteng atas', 1, 'c55d48400088fd65a648b61808ad30c2'),
(10, 'David flash23', 'wdfuwfoweu@email.com', '082241404988', 'qdqwdfq', 2, '0c735af81797ee844a6c3ec511b93453'),
(11, 'David flash', 'waudh12293e@gmail.com', '082241404988', 'menteng atas', 3, '2cf1a05395bd9d1d9da5fb9147909fc7'),
(12, 'adqdoqw', 'waudwquqbod3e@gmail.com', '082241404988', 'wdjqbwd', 3, '0b794dc6d9546e3703cb005de7e6f470'),
(13, 'adqdoqw', 'waudwq3ssuqbod3e@gmail.com', '082241404988', 'wdjqbwd', 3, '2cf1a05395bd9d1d9da5fb9147909fc7');

-- --------------------------------------------------------

--
-- Table structure for table `expenditures`
--

CREATE TABLE `expenditures` (
  `expenditure_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL,
  `faculty_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `faculty_name`) VALUES
(1, 'Faculty of Business'),
(2, 'Faculty of Engineering'),
(3, 'Faculty of Computer Science'),
(4, 'Faculty of Humanities');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `InvoiceID` int(11) NOT NULL,
  `PaymentID` int(11) NOT NULL,
  `Status` enum('Paid','Pending','Failed') NOT NULL,
  `TransactionDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`InvoiceID`, `PaymentID`, `Status`, `TransactionDate`) VALUES
(1, 1, 'Paid', '2024-03-27 10:48:02'),
(2, 2, 'Paid', '2024-03-27 15:41:49'),
(3, 3, 'Paid', '2024-03-27 15:41:52'),
(4, 4, 'Paid', '2024-03-27 15:41:53'),
(5, 5, 'Paid', '2024-03-27 15:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `jobpositions`
--

CREATE TABLE `jobpositions` (
  `job_position_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobpositions`
--

INSERT INTO `jobpositions` (`job_position_id`, `title`) VALUES
(1, 'Administrator'),
(2, 'Sales Person'),
(3, 'Procurement Staff');

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `major_id` int(11) NOT NULL,
  `major_name` varchar(50) NOT NULL,
  `faculty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`major_id`, `major_name`, `faculty_id`) VALUES
(1, 'Accounting', 1),
(2, 'Business Administration', 1),
(3, 'Management', 1),
(4, 'Actuarial Science', 1),
(5, 'Civil Engineering', 2),
(6, 'Industrial Engineering', 2),
(7, 'Mechanical Engineering', 2),
(8, 'Electrical Engineering', 2),
(9, 'Environmental Engineering', 2),
(10, 'Information Technology  ', 3),
(11, 'Information System ', 3),
(12, 'Visual Communication Design', 3),
(13, 'Interior Design', 3),
(14, 'International Relations', 4),
(15, 'Communication', 4),
(16, 'Law', 4),
(17, 'Primary School teacher education', 4);

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `material_id` int(11) NOT NULL,
  `material_name` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Active, 0 = Inactive',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`material_id`, `material_name`, `category_id`, `status`, `date_created`, `description`) VALUES
(1001, 'Introduction to IS', 1, 0, '2024-04-23 21:57:35', 'This course provides an introduction to Information Systems.'),
(1002, 'EBusiness', 1, 0, '2024-04-23 21:57:35', 'Learn about conducting business online with this course.'),
(1003, 'Supply Chain', 1, 0, '2024-04-23 21:57:35', 'Explore the concepts and practices of Supply Chain Management.'),
(2001, 'Principle of Psychology ', 2, 0, '2024-04-23 21:57:35', 'Introduction to the fundamental principles of Psychology.'),
(2002, 'Economics', 2, 0, '2024-04-23 21:57:35', 'Study the principles of Economics and their applications.'),
(2003, 'History', 2, 0, '2024-04-23 21:57:35', 'Learn about historical events and their significance.'),
(3001, 'Adobe Premier Pro', 3, 0, '2024-04-23 21:57:35', 'Master the video editing software Adobe Premiere Pro.'),
(3002, 'Canva Pro', 3, 0, '2024-04-23 21:57:35', 'Create stunning designs with the graphic design platform Canva Pro.'),
(3003, 'Microsoft Office', 3, 0, '2024-04-23 21:57:35', 'Learn to use Microsoft Office applications effectively.'),
(4001, 'Camer', 3, 1, '2024-04-23 21:57:35', 'Capture high-quality photos and videos with this cam'),
(4002, 'Webcam', 4, 0, '2024-04-23 21:57:35', 'A webcam for video conferencing and online meetings.'),
(4004, 'BUKU', 1, 1, '2024-05-12 14:58:47', 'DFGERGRG'),
(4005, 'software', 3, 1, '2024-05-12 15:00:52', 't34t3');

-- --------------------------------------------------------

--
-- Table structure for table `membershipplans`
--

CREATE TABLE `membershipplans` (
  `PlanID` int(11) NOT NULL,
  `plan_name` varchar(50) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membershipplans`
--

INSERT INTO `membershipplans` (`PlanID`, `plan_name`, `Price`) VALUES
(1, '3 Months', '29000.00'),
(2, '6 Months', '99000.00'),
(3, '12 Months', '179000.00');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `PaymentID` int(11) NOT NULL,
  `SelectionID` int(11) NOT NULL,
  `MethodID` int(11) NOT NULL,
  `CardNumber` varchar(16) NOT NULL,
  `CardExpirationDate` date NOT NULL,
  `CardOwnerName` varchar(100) NOT NULL,
  `TransactionDate` datetime NOT NULL,
  `Amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`PaymentID`, `SelectionID`, `MethodID`, `CardNumber`, `CardExpirationDate`, `CardOwnerName`, `TransactionDate`, `Amount`) VALUES
(1, 1, 1, '18031737', '2024-03-11', 'salieri', '2024-03-27 10:48:02', '29000.00'),
(2, 1, 1, '2323443', '2024-03-05', 'tata', '2024-03-27 15:41:49', '29000.00'),
(3, 1, 1, '2323443', '2024-03-05', 'tata', '2024-03-27 15:41:52', '29000.00'),
(4, 1, 1, '2323443', '2024-03-05', 'tata', '2024-03-27 15:41:53', '29000.00'),
(5, 1, 1, '2323443', '2024-03-05', 'tata', '2024-03-27 15:41:53', '29000.00'),
(6, 1, 1, '2323443', '2024-03-05', 'tata', '2024-03-27 15:41:54', '29000.00'),
(7, 1, 1, '2323443', '2024-03-05', 'tata', '2024-03-27 15:41:54', '29000.00'),
(8, 1, 1, '2323443', '2024-03-05', 'tata', '2024-03-27 15:41:54', '29000.00'),
(9, 1, 1, '2323443', '2024-03-05', 'tata', '2024-03-27 15:41:58', '29000.00'),
(10, 1, 1, '12345', '2024-03-19', 'tata', '2024-03-27 15:42:43', '29000.00'),
(11, 1, 2, '12q23', '2024-03-21', 'fdgfdg', '2024-03-27 15:52:10', '29000.00'),
(12, 1, 4, '66454433', '2024-03-28', 'tata', '2024-03-28 19:31:30', '29000.00');

-- --------------------------------------------------------

--
-- Table structure for table `payment_category`
--

CREATE TABLE `payment_category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_category`
--

INSERT INTO `payment_category` (`CategoryID`, `CategoryName`) VALUES
(1, 'Debit / Credit Card'),
(2, 'Virtual Account');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `MethodID` int(11) NOT NULL,
  `MethodName` varchar(50) NOT NULL,
  `ImageLink` varchar(50) NOT NULL,
  `CategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`MethodID`, `MethodName`, `ImageLink`, `CategoryID`) VALUES
(1, 'BCA', 'bca.png', 1),
(2, 'BNI', 'bni.png', 1),
(3, 'BRI', 'bri.png', 1),
(4, 'BSI', 'bsi.png', 1),
(5, 'Mandiri', 'mandiri.png', 1),
(6, 'Mandiri Syariah', 'mandirisyariah.png', 1),
(7, 'BCA', 'bca.png', 2),
(8, 'BNI', 'bni.png', 2),
(9, 'BRI', 'bri.png', 2),
(10, 'BSI', 'bsi.png', 2),
(11, 'Mandiri', 'mandiri.png', 2),
(12, 'Mandiri Syariah', 'mandirisyariah.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `po_id` int(11) NOT NULL,
  `po_no` varchar(20) DEFAULT NULL,
  `vendor_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `notes` text NOT NULL,
  `price` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, \r\n1= Approved, \r\n2 = Denied'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_order`
--

INSERT INTO `purchase_order` (`po_id`, `po_no`, `vendor_id`, `material_id`, `quantity`, `notes`, `price`, `date_created`, `date_updated`, `status`) VALUES
(1, '1', 1, 1001, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 300000, '2024-04-01 00:00:00', '2024-05-13 17:43:17', 0),
(2, '2', 1, 1002, 2, 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 250000, '2024-04-01 00:00:00', '2024-05-13 17:43:25', 0),
(3, '3', 3, 2001, 1, 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 300000, '2024-04-01 00:00:00', '2024-05-13 17:43:23', 0),
(4, '4', 4, 2002, 6, 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 400000, '2024-04-01 00:00:00', '2024-05-13 17:43:28', 0),
(5, '5', 5, 3001, 1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 70000, '2024-04-01 00:00:00', '2024-05-13 17:43:30', 0),
(6, '6', 6, 3002, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 800000, '2024-04-01 00:00:00', '2024-05-14 20:26:17', 1),
(59, '7', 6, 2001, 10, 'dwdjweod', 50000, '2024-05-13 17:44:50', '2024-05-13 17:48:00', 1),
(60, '17', 7, 4002, 10, 'obscob', 100000, '2024-05-14 19:09:24', '2024-05-14 19:09:57', 1),
(61, '89', 5, 2001, 12, 'tyftyfytty', 90876, '2024-05-15 13:59:07', '2024-05-15 13:59:35', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `quiz_id` int(11) NOT NULL,
  `quiz_name` varchar(100) NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quiz_id`, `quiz_name`, `topic_id`) VALUES
(1, 'Intoduction to Information System', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `question_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option_a` varchar(100) NOT NULL,
  `option_b` varchar(100) NOT NULL,
  `option_c` varchar(100) NOT NULL,
  `option_d` varchar(100) NOT NULL,
  `correct_answer` enum('a','b','c','d') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`question_id`, `quiz_id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`) VALUES
(1, 1, 'It manages the financial information of the firm and plays two important roles in transaction proces', 'Information Function', 'Management Function', 'Accounting Function', 'Finance Function', 'a'),
(2, 1, 'Activities that shapes an assembles raw materials into financial products.', 'Primary Manufacturing Activities', 'Material Management', 'Products Support Activities', 'Data Processing', 'a'),
(3, 1, 'This supports operations-level tasks with highly detailed information about the many business transa', 'Horizontal Flow', 'Outside Flow', 'Vertical Flow', 'Downward Flow', 'c'),
(4, 1, 'Which of the following is not one of the three major classes of information systems?', 'Decision support system', 'Collaboration system', 'Management information system', 'Transaction processing system', 'b');

-- --------------------------------------------------------

--
-- Table structure for table `receive_goods`
--

CREATE TABLE `receive_goods` (
  `receive_id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Delivery, 1=Received,\r\n2=Late Delivery',
  `employee_id` int(11) DEFAULT NULL,
  `due_date` date NOT NULL,
  `received_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receive_goods`
--

INSERT INTO `receive_goods` (`receive_id`, `po_id`, `status`, `employee_id`, `due_date`, `received_date`) VALUES
(19, 59, 2, 11, '2024-05-20', '2024-05-14 20:08:25'),
(20, 60, 2, 11, '2024-05-21', '2024-05-14 20:10:53'),
(21, 6, 0, 12, '2024-05-21', NULL),
(22, 61, 2, 11, '2024-05-22', '2024-05-15 15:01:33');

-- --------------------------------------------------------

--
-- Table structure for table `running_balance`
--

CREATE TABLE `running_balance` (
  `id` int(30) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `balance_type` tinyint(1) NOT NULL COMMENT '1=budget, 2=expense',
  `category_id` int(30) NOT NULL,
  `amount` float NOT NULL,
  `remarks` text NOT NULL,
  `user_id` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `running_balance`
--

INSERT INTO `running_balance` (`id`, `vendor_id`, `balance_type`, `category_id`, `amount`, `remarks`, `user_id`, `date_created`, `date_updated`) VALUES
(1, NULL, 1, 1, 30000, '&lt;p&gt;Sample entry&lt;/p&gt;', '1', '2024-04-24 02:31:03', NULL),
(2, NULL, 1, 5, 1500, '&lt;p&gt;test&lt;/p&gt;', '1', '2024-04-24 02:33:29', NULL),
(3, NULL, 1, 5, 1500, '&lt;p&gt;test&lt;/p&gt;', '1', '2024-04-24 02:33:56', NULL),
(4, NULL, 1, 5, 1500, '&lt;p&gt;test&lt;/p&gt;', '1', '2024-04-24 02:34:17', NULL),
(5, NULL, 1, 5, 1500, '&lt;p&gt;test&lt;/p&gt;', '1', '2024-04-24 02:34:44', NULL),
(6, NULL, 1, 1, 2500, '&lt;p&gt;test&lt;/p&gt;', '1', '2024-04-24 02:36:32', NULL),
(7, NULL, 2, 1, 250, '&lt;p&gt;Sample expense&lt;/p&gt;', '', '2024-04-24 03:07:34', '2024-04-29 06:43:44'),
(8, NULL, 1, 1, 2555, '&lt;p&gt;test&lt;/p&gt;', '1', '2024-04-24 03:17:32', NULL),
(9, NULL, 2, 1, 2000, '&lt;p&gt;Sample expense&lt;/p&gt;', '1', '2024-04-24 03:36:10', NULL),
(10, NULL, 1, 3, 5000, '&lt;p&gt;Sample&lt;/p&gt;', '1', '2024-04-24 03:47:02', NULL),
(11, NULL, 1, 4, 3000, '&lt;p&gt;Test 103&lt;/p&gt;', '1', '2024-04-24 03:47:28', NULL),
(12, NULL, 1, 2, 2000, '&lt;p&gt;Test 103&lt;/p&gt;', '1', '2024-04-24 03:47:46', NULL),
(13, NULL, 1, 2, 3500, '&lt;p&gt;Test 106&lt;/p&gt;', '1', '2024-04-24 03:48:03', NULL),
(14, NULL, 2, 2, 800, '&lt;p&gt;Expense for Maintenance 105&lt;/p&gt;', '1', '2024-04-24 03:51:31', NULL),
(17, 6, 2, 1, 12900, '6', '', '2024-05-15 14:41:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_orders`
--

CREATE TABLE `sales_orders` (
  `OrderID` int(11) NOT NULL,
  `OrderDate` datetime NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `MembershipPlanID` int(11) NOT NULL,
  `InvoiceID` int(11) NOT NULL,
  `Status` enum('Processing','Active','Cancelled') NOT NULL DEFAULT 'Processing',
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_orders`
--

INSERT INTO `sales_orders` (`OrderID`, `OrderDate`, `Amount`, `MembershipPlanID`, `InvoiceID`, `Status`, `employee_id`) VALUES
(1, '2024-03-27 10:48:02', '29000.00', 1, 1, 'Active', 7),
(2, '2024-03-27 15:41:49', '29000.00', 2, 2, 'Active', 3),
(3, '2024-03-27 15:41:52', '29000.00', 3, 3, 'Processing', NULL),
(4, '2024-03-27 15:41:53', '29000.00', 1, 4, 'Active', 2),
(5, '2024-03-27 15:41:53', '29000.00', 2, 5, 'Processing', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_target`
--

CREATE TABLE `sales_target` (
  `id` int(11) NOT NULL,
  `employee` int(11) NOT NULL,
  `target_sales` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_target`
--

INSERT INTO `sales_target` (`id`, `employee`, `target_sales`) VALUES
(1, 1, 5),
(2, 2, 5),
(3, 3, 5),
(4, 4, 5),
(5, 5, 5),
(6, 6, 5),
(7, 7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `summary`
--

CREATE TABLE `summary` (
  `summary_id` int(11) NOT NULL,
  `summary_title` varchar(50) NOT NULL,
  `summary_content` text NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `summary`
--

INSERT INTO `summary` (`summary_id`, `summary_title`, `summary_content`, `topic_id`) VALUES
(1, 'Summary of Introduction to Information System', 'Information Systems (IS) form the backbone of modern organizations, providing the infrastructure necessary for managing, processing, and disseminating information effectively. In essence, IS represent the intersection of people, processes, and technology, enabling organizations to achieve their objectives efficiently and competitively in today\'s dynamic business environment.\n\nAt its core, an Information System comprises hardware, software, data, procedures, and people. These components work together to collect, store, process, and distribute information to support decision-making, coordination, control, analysis, and visualization within an organization.\n\nUnderstanding the various types of Information Systems is crucial. These include Transaction Processing Systems (TPS), which handle routine transactions; Management Information Systems (MIS), providing middle management with reports and summaries; Decision Support Systems (DSS), aiding in complex decision-making processes; and Executive Information Systems (EIS), catering to the strategic information needs of top-level executives.\n\nThe functions of Information Systems within organizations are diverse and critical. They streamline business processes, enhance decision-making capabilities, improve collaboration and communication, and enable strategic planning and innovation. Moreover, Information Systems play a pivotal role in gaining competitive advantages, fostering customer relationships, and ensuring data security and privacy.\n\nDespite their immense benefits, implementing and managing Information Systems pose challenges. Organizations must navigate issues related to technological complexity, data integrity, security threats, and organizational change management to fully leverage the potential of Information Systems.\n\nNevertheless, Information Systems continue to evolve rapidly, driven by emerging technologies such as artificial intelligence, big data analytics, and the Internet of Things. These innovations promise to revolutionize how organizations operate, offering new opportunities for growth, efficiency, and value creation.\n\nIn conclusion, a strong foundation in Information Systems is essential for understanding the pivotal role technology plays in modern organizations. By harnessing the power of Information Systems effectively, organizations can unlock new levels of productivity, innovation, and competitive advantage in today\'s digital age.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_list`
--

CREATE TABLE `supplier_list` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `contact_person` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = Inactive, 1 = Active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_list`
--

INSERT INTO `supplier_list` (`id`, `name`, `address`, `contact_person`, `contact`, `email`, `status`, `date_created`) VALUES
(1, 'wRR3', '524524', 'ryan', '12345678', 'flash@gmail.com', 1, '2024-04-24 14:50:38');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Admin Dashboard'),
(6, 'short_name', 'PUEC'),
(11, 'logo', 'uploads/logopresident.png'),
(13, 'user_avatar', 'uploads/doge.png'),
(14, 'cover', 'uploads/PU.PNG'),
(15, 'company_name', 'President University'),
(16, 'company_email', 'puecourses@academic.com'),
(17, 'company_address', 'Sample Address, 23rd St., Sample City, ####');

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL,
  `topic_name` varchar(50) NOT NULL,
  `week_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`topic_id`, `topic_name`, `week_id`, `status`) VALUES
(1, 'Introduction  to Information System', 1, 1),
(3, 'Introduction of Information System', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `usermembershipselections`
--

CREATE TABLE `usermembershipselections` (
  `SelectionID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `PlanID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usermembershipselections`
--

INSERT INTO `usermembershipselections` (`SelectionID`, `UserID`, `PlanID`) VALUES
(1, 1, 3),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `LastLogin` datetime DEFAULT NULL,
  `DateCreated` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `Username`, `Email`, `Password`, `Phone`, `LastLogin`, `DateCreated`) VALUES
(1, 'Salieri', 'Salieri@example.com', 'waduh1234', '123-456-7890', '2024-03-24 08:30:00', '2024-03-25 07:25:05'),
(2, 'Salieri', 'salieri1@example.com', 'waduh1234', '123-456-7890', '2024-03-24 08:30:00', '2024-03-25 07:25:05'),
(3, 'Salieri', 'Salieri@gmail.com', 'waduh1234', '123-456-7890', '2024-03-24 08:30:00', '2024-03-25 07:25:05'),
(4, 'Salieri', 'salieri1@gmail.com', 'waduh1234', '123-456-7890', '2024-03-24 08:30:00', '2024-03-25 07:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(50) NOT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = Inactive, 1 = Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_id`, `vendor_name`, `contact_person`, `email`, `address`, `contact`, `date_created`, `status`) VALUES
(1, 'ABC Book', 'John Doe', 'info@ABCBook.com', '123 Main Street, Cityville', '123-456-7890', '2024-04-23 21:59:09', 1),
(2, 'XYZ Sains', 'Jane Smith', 'info@XYZSains.com', '456 Elm Street, Townsville', '456-789-0123', '2024-04-23 21:59:09', 1),
(3, 'Springer', 'Michael Johnson', 'info@Springer.com', '789 Oak Street, Villagetown', '789-012-3456', '2024-04-23 21:59:09', 1),
(4, 'Willey', 'Emily Davis', 'info@Willey.com', '101 Pine Street, Hamletsville', '101-112-1314', '2024-04-23 21:59:09', 1),
(5, 'Adobe Inc', 'David Wilson', 'info@AdobeInc.com', '202 Cedar Street, Metropolis', '202-212-2223', '2024-04-23 21:59:09', 1),
(6, 'Canva Pty Ltd', 'Sarah Brown', 'info@CanvaPtyLtd.com', '303 Maple Street, Megacity', '303-313-3234', '2024-04-23 21:59:09', 1),
(7, 'Sony', 'Matthew Taylor', 'info@Sony.com', '404 Birch Street, Downtown', '404-414-4245', '2024-04-23 21:59:09', 1),
(8, 'Microsoft', 'Olivia Martinez', 'info@Microsoft.com', '505 Walnut Street, Suburbia', '505-515-5256', '2024-04-23 21:59:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `video_id` int(11) NOT NULL,
  `video_title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `video_link` varchar(255) NOT NULL,
  `upload_date` date NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`video_id`, `video_title`, `description`, `video_link`, `upload_date`, `topic_id`) VALUES
(1, 'Importance of Information Systems in modern organi', 'Discover the core of modern business technology in our \"Introduction to Information Systems\" course. Explore the essential concepts, from the backbone of Information Technology infrastructure to the dynamics of data management and the transformative power of Enterprise Systems. Delve into emerging trends and ethical considerations, equipping yourself with the insights to thrive in today\'s digital landscape. Join us on this enlightening journey and unlock the potential of Information Systems in driving organizational success. Enroll now and embark on a path to technological proficiency and strategic thinking', '../assets/video/videoIIS.mp4', '2024-03-26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `week`
--

CREATE TABLE `week` (
  `week_id` int(11) NOT NULL,
  `week_name` varchar(50) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `week`
--

INSERT INTO `week` (`week_id`, `week_name`, `course_id`) VALUES
(1, 'Week 1', 1),
(2, 'Week 2', 1),
(3, 'Week 3', 1),
(4, 'Week 4', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountable_receivable`
--
ALTER TABLE `accountable_receivable`
  ADD PRIMARY KEY (`ReceivableID`),
  ADD KEY `InvoiceID` (`InvoiceID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `accounts_payable`
--
ALTER TABLE `accounts_payable`
  ADD PRIMARY KEY (`ap_id`),
  ADD UNIQUE KEY `unique_po_id` (`po_id`),
  ADD KEY `po_id` (`po_id`);

--
-- Indexes for table `amount_course`
--
ALTER TABLE `amount_course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`BanksID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `categories_expenses`
--
ALTER TABLE `categories_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_material`
--
ALTER TABLE `category_material`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `faculty_id` (`faculty_id`),
  ADD KEY `major_id` (`major_id`),
  ADD KEY `fk_material_id_course` (`material_id`);

--
-- Indexes for table `databanks`
--
ALTER TABLE `databanks`
  ADD PRIMARY KEY (`DatabankID`),
  ADD KEY `BanksID` (`BanksID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD KEY `job_position_id` (`job_position_id`);

--
-- Indexes for table `expenditures`
--
ALTER TABLE `expenditures`
  ADD PRIMARY KEY (`expenditure_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`InvoiceID`),
  ADD KEY `PaymentID` (`PaymentID`);

--
-- Indexes for table `jobpositions`
--
ALTER TABLE `jobpositions`
  ADD PRIMARY KEY (`job_position_id`);

--
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`major_id`),
  ADD KEY `faculty_id` (`faculty_id`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`material_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `membershipplans`
--
ALTER TABLE `membershipplans`
  ADD PRIMARY KEY (`PlanID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `SelectionID` (`SelectionID`),
  ADD KEY `MethodID` (`MethodID`);

--
-- Indexes for table `payment_category`
--
ALTER TABLE `payment_category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`MethodID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`po_id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `material_id` (`material_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quiz_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `receive_goods`
--
ALTER TABLE `receive_goods`
  ADD PRIMARY KEY (`receive_id`),
  ADD UNIQUE KEY `unique_po_id` (`po_id`),
  ADD KEY `po_id` (`po_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `running_balance`
--
ALTER TABLE `running_balance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vendor` (`vendor_id`);

--
-- Indexes for table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `MembershipPlanID` (`MembershipPlanID`),
  ADD KEY `InvoiceID` (`InvoiceID`),
  ADD KEY `fk_sales_orders_employee` (`employee_id`);

--
-- Indexes for table `sales_target`
--
ALTER TABLE `sales_target`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_employee` (`employee`);

--
-- Indexes for table `summary`
--
ALTER TABLE `summary`
  ADD PRIMARY KEY (`summary_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `supplier_list`
--
ALTER TABLE `supplier_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `week_id` (`week_id`);

--
-- Indexes for table `usermembershipselections`
--
ALTER TABLE `usermembershipselections`
  ADD PRIMARY KEY (`SelectionID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `PlanID` (`PlanID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`video_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `week`
--
ALTER TABLE `week`
  ADD PRIMARY KEY (`week_id`),
  ADD KEY `course_id` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountable_receivable`
--
ALTER TABLE `accountable_receivable`
  MODIFY `ReceivableID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `accounts_payable`
--
ALTER TABLE `accounts_payable`
  MODIFY `ap_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `BanksID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories_expenses`
--
ALTER TABLE `categories_expenses`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `databanks`
--
ALTER TABLE `databanks`
  MODIFY `DatabankID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `expenditures`
--
ALTER TABLE `expenditures`
  MODIFY `expenditure_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobpositions`
--
ALTER TABLE `jobpositions`
  MODIFY `job_position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `major`
--
ALTER TABLE `major`
  MODIFY `major_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `material_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4006;

--
-- AUTO_INCREMENT for table `membershipplans`
--
ALTER TABLE `membershipplans`
  MODIFY `PlanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment_category`
--
ALTER TABLE `payment_category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `MethodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `po_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `receive_goods`
--
ALTER TABLE `receive_goods`
  MODIFY `receive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `running_balance`
--
ALTER TABLE `running_balance`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sales_orders`
--
ALTER TABLE `sales_orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sales_target`
--
ALTER TABLE `sales_target`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `summary`
--
ALTER TABLE `summary`
  MODIFY `summary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier_list`
--
ALTER TABLE `supplier_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usermembershipselections`
--
ALTER TABLE `usermembershipselections`
  MODIFY `SelectionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `week`
--
ALTER TABLE `week`
  MODIFY `week_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accountable_receivable`
--
ALTER TABLE `accountable_receivable`
  ADD CONSTRAINT `fk_accountable_receivable_invoice` FOREIGN KEY (`InvoiceID`) REFERENCES `invoices` (`InvoiceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_accountable_receivable_order` FOREIGN KEY (`OrderID`) REFERENCES `sales_orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `amount_course`
--
ALTER TABLE `amount_course`
  ADD CONSTRAINT `fk_course_id_amount` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_faculty_id_course` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_major_id_course` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material_id_course` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `databanks`
--
ALTER TABLE `databanks`
  ADD CONSTRAINT `databanks_ibfk_1` FOREIGN KEY (`BanksID`) REFERENCES `banks` (`BanksID`) ON DELETE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_job_position_id_employee` FOREIGN KEY (`job_position_id`) REFERENCES `jobpositions` (`job_position_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenditures`
--
ALTER TABLE `expenditures`
  ADD CONSTRAINT `fk_category_id_expenditures` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_employee_id_expenditures` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`PaymentID`) REFERENCES `payments` (`PaymentID`);

--
-- Constraints for table `major`
--
ALTER TABLE `major`
  ADD CONSTRAINT `fk_faculty_id_major` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `fk_category_id_material` FOREIGN KEY (`category_id`) REFERENCES `category_material` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_method_id` FOREIGN KEY (`MethodID`) REFERENCES `payment_methods` (`MethodID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_payments_selection_id` FOREIGN KEY (`SelectionID`) REFERENCES `usermembershipselections` (`SelectionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `fk_payment_methods_category_id` FOREIGN KEY (`CategoryID`) REFERENCES `payment_category` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `fk_po_material` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_po_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `fk_quiz_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `fk_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`) ON DELETE CASCADE;

--
-- Constraints for table `running_balance`
--
ALTER TABLE `running_balance`
  ADD CONSTRAINT `fk_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD CONSTRAINT `fk_sales_orders_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sales_orders_invoice` FOREIGN KEY (`InvoiceID`) REFERENCES `invoices` (`InvoiceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sales_orders_membership_plan` FOREIGN KEY (`MembershipPlanID`) REFERENCES `membershipplans` (`PlanID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_target`
--
ALTER TABLE `sales_target`
  ADD CONSTRAINT `fk_employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `summary`
--
ALTER TABLE `summary`
  ADD CONSTRAINT `fk_summary_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`week_id`) REFERENCES `week` (`week_id`);

--
-- Constraints for table `usermembershipselections`
--
ALTER TABLE `usermembershipselections`
  ADD CONSTRAINT `fk_usermembershipselections_plan` FOREIGN KEY (`PlanID`) REFERENCES `membershipplans` (`PlanID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usermembershipselections_user` FOREIGN KEY (`UserID`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `fk_video_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `week`
--
ALTER TABLE `week`
  ADD CONSTRAINT `fk_week_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
