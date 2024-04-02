-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2024 at 01:09 PM
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
-- Database: `ecourses`
--

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
(1, 22),
(2, 12),
(3, 10),
(4, 45),
(5, 21),
(6, 15),
(7, 32),
(8, 39);

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
  `img` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `price` enum('Free','Paid') NOT NULL,
  `duration` varchar(50) NOT NULL,
  `difficulty` enum('Beginner','Intermediate','Advanced','') NOT NULL,
  `time` varchar(50) NOT NULL,
  `language` varchar(50) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `description`, `faculty_id`, `major_id`, `img`, `start_date`, `price`, `duration`, `difficulty`, `time`, `language`, `UserID`) VALUES
(1, 'Introduction to Information System', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 3, 11, 'image/IIS.png', '2024-03-25', 'Free', '8 weeks long', 'Beginner', '', '', 1),
(2, 'Manufacturing Resource Planning', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 3, 11, 'image/SCM.png', '2024-03-25', 'Paid', '16 weeks long', 'Advanced', '', '', 1),
(3, 'Accounting Information System', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 3, 11, 'image/AIS.png', '2024-03-25', 'Free', '8 weeks long', 'Beginner', '', '', 1),
(4, 'Management Information System', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 3, 11, 'image/MIS.png', '2024-03-25', 'Paid', '12 weeks long', 'Intermediate', '', '', 1),
(5, 'Financial Management', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 1, 3, 'image/FM_MGT.PNG', '2024-03-25', 'Paid', '8 weeks long', 'Intermediate', '', '', 1),
(6, 'Consumer Behaviour', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 1, 3, 'image/CS_MGT.PNG', '2024-03-25', 'Free', '4 weeks long', 'Beginner', '', '', 1),
(7, 'Macroeconomics', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 1, 3, 'image/M_MGT.PNG', '2024-03-25', 'Paid', '16 weeks long', 'Advanced', '', '', 1),
(8, 'Marketing Management', 'Lorem ipsum dolor sit amet consectetur. Nec ornare pellentesque eu feugiat purus.', 1, 3, 'image/MM_MGT.PNG', '2024-03-25', 'Paid', '6 weeks long', 'Intermediate', '', '', 1),
(9, 'ggg', 'yghghg', 3, 10, 'img6', '2024-03-26', 'Free', '5 week', 'Beginner', '9000', 'jhgyy', 1);

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
  `Status` enum('Paid','Pending','FcodeQuery #1 fiber_manual_recordailed') NOT NULL,
  `TransactionDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `membershipplans`
--

CREATE TABLE `membershipplans` (
  `PlanID` int(11) NOT NULL,
  `DurationMonths` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membershipplans`
--

INSERT INTO `membershipplans` (`PlanID`, `DurationMonths`, `Price`) VALUES
(1, 1, '29000.00'),
(2, 6, '99000.00'),
(3, 12, '179000.00');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `PaymentID` int(11) NOT NULL,
  `SelectionID` int(11) NOT NULL,
  `PaymentMethod` varchar(50) NOT NULL,
  `CardNumber` varchar(16) NOT NULL,
  `CardExpirationDate` date NOT NULL,
  `CardOwnerName` varchar(100) NOT NULL,
  `TransactionDate` datetime NOT NULL,
  `Amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `quiz_id` int(11) NOT NULL,
  `quiz_name` varchar(100) NOT NULL,
  `quiz_question` varchar(100) NOT NULL,
  `option_a` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `option_b` varchar(100) NOT NULL,
  `option_c` varchar(100) NOT NULL,
  `option_d` varchar(100) NOT NULL,
  `correct_answer` enum('a','b','c','d') NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Introduction  to Information System', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `TransactionID` int(11) NOT NULL,
  `TransactionType` enum('Membership') NOT NULL,
  `TransactionDate` datetime NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `MethodID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `InvoiceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usermembershipselections`
--

CREATE TABLE `usermembershipselections` (
  `SelectionID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `PlanID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
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

INSERT INTO `users` (`UserID`, `Username`, `Email`, `Password`, `Phone`, `LastLogin`, `DateCreated`) VALUES
(1, 'Salieri', 'Salieri@example.com', 'waduh1234', '123-456-7890', '2024-03-24 08:30:00', '2024-03-25 07:25:05'),
(2, 'Salieri', 'salieri1@example.com', 'waduh1234', '123-456-7890', '2024-03-24 08:30:00', '2024-03-25 07:25:05');

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
-- Indexes for table `amount_course`
--
ALTER TABLE `amount_course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `faculty_id` (`faculty_id`),
  ADD KEY `major_id` (`major_id`),
  ADD KEY `UserID` (`UserID`);

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
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`major_id`),
  ADD KEY `faculty_id` (`faculty_id`);

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
  ADD KEY `SelectionID` (`SelectionID`);

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
  ADD KEY `fk_payment_category` (`CategoryID`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quiz_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `summary`
--
ALTER TABLE `summary`
  ADD PRIMARY KEY (`summary_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `week_id` (`week_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `fk_transactions_method` (`MethodID`),
  ADD KEY `fk_transactions_user` (`UserID`),
  ADD KEY `fk_transactions_invoice` (`InvoiceID`);

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
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`);

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
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `major`
--
ALTER TABLE `major`
  MODIFY `major_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `membershipplans`
--
ALTER TABLE `membershipplans`
  MODIFY `PlanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `summary`
--
ALTER TABLE `summary`
  MODIFY `summary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `TransactionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usermembershipselections`
--
ALTER TABLE `usermembershipselections`
  MODIFY `SelectionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amount_course`
--
ALTER TABLE `amount_course`
  ADD CONSTRAINT `amount_course_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`PaymentID`) REFERENCES `payments` (`PaymentID`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`SelectionID`) REFERENCES `usermembershipselections` (`SelectionID`);

--
-- Constraints for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `fk_payment_category` FOREIGN KEY (`CategoryID`) REFERENCES `payment_category` (`CategoryID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_transactions_invoice` FOREIGN KEY (`InvoiceID`) REFERENCES `invoices` (`InvoiceID`),
  ADD CONSTRAINT `fk_transactions_method` FOREIGN KEY (`MethodID`) REFERENCES `payment_methods` (`MethodID`),
  ADD CONSTRAINT `fk_transactions_user` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `usermembershipselections`
--
ALTER TABLE `usermembershipselections`
  ADD CONSTRAINT `usermembershipselections_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `usermembershipselections_ibfk_2` FOREIGN KEY (`PlanID`) REFERENCES `membershipplans` (`PlanID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
