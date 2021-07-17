-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2020 at 12:25 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payroll_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `aid` int(10) NOT NULL,
  `designation` varchar(10) DEFAULT NULL,
  `department` varchar(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `bid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`aid`, `designation`, `department`, `name`, `bid`) VALUES
(101, 'manager', 'it', 'arun', 100001),
(102, 'hod', 'marketing', 'mahesh', 100002),
(103, 'hod', 'finance', 'rajesh', 100003),
(201, 'manager', 'it', 'ashul', 155001),
(202, 'dean', 'marketing', 'aman', 155002),
(203, 'hod', 'finance', 'pooja', 155003);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `bname` varchar(20) DEFAULT NULL,
  `bid` int(10) NOT NULL,
  `cid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`bname`, `bid`, `cid`) VALUES
('it', 100001, 100),
('marketing', 100002, 100),
('finance', 100003, 100),
('it', 155001, 155),
('marketing', 155002, 155),
('finance', 155003, 155),
('it', 285001, 285),
('marketing', 285002, 285),
('finance', 285003, 285);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `cname` varchar(10) DEFAULT NULL,
  `cid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`cname`, `cid`) VALUES
('sony', 100),
('dell', 125),
('lg', 155),
('samsung', 285),
('hp', 395);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ename` varchar(20) DEFAULT NULL,
  `eid` int(10) NOT NULL,
  `designation` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone_no` int(12) DEFAULT NULL,
  `basic` int(10) DEFAULT NULL,
  `aid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ename`, `eid`, `designation`, `dob`, `phone_no`, `basic`, `aid`) VALUES
('tanya', 2508, 'agm', '1995-10-29', 887958980, 45000, 201),
('aditya', 3562, 'dgm', '1995-04-14', 942727265, 55000, 101),
('surya', 4001, 'am', '1998-10-21', 987958977, 55000, 101),
('rishabh', 8129, 'gm', '1995-07-04', 887558963, 75000, 202),
('anish', 9860, 'gm', '1995-01-18', 940850256, 40000, 101);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `medical_allowance` int(10) DEFAULT NULL,
  `basic` int(10) NOT NULL,
  `hra` int(10) DEFAULT NULL,
  `ta` int(10) DEFAULT NULL,
  `da` int(10) DEFAULT NULL,
  `incentive` int(10) DEFAULT NULL,
  `aid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`medical_allowance`, `basic`, `hra`, `ta`, `da`, `incentive`, `aid`) VALUES
(5000, 25000, 2500, 1000, 1500, 500, 101),
(5000, 40000, 3000, 1500, 1800, 800, 101),
(6500, 45000, 4000, 1500, 1900, 1000, 201),
(7500, 55000, 5000, 5500, 1000, 500, 201),
(9500, 75000, 8000, 2500, 4000, 2500, 202);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `aid` int(20) NOT NULL,
  `id` int(20) NOT NULL,
  `pswd` int(20) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`aid`, `id`, `pswd`, `role`) VALUES
(102, 15, 0, 'b'),
(101, 65, 0, 'a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`eid`),
  ADD KEY `fk_aid` (`aid`),
  ADD KEY `fk_basic` (`basic`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`basic`),
  ADD KEY `aid` (`aid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aid` (`aid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `branch` (`bid`);

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `company` (`cid`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_aid` FOREIGN KEY (`aid`) REFERENCES `administrator` (`aid`),
  ADD CONSTRAINT `fk_basic` FOREIGN KEY (`basic`) REFERENCES `salary` (`basic`);

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `administrator` (`aid`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `administrator` (`aid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
