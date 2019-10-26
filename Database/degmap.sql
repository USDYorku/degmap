-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2019 at 07:19 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `degmap`
--
CREATE DATABASE IF NOT EXISTS `degmap` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `degmap`;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `ID` int(11) NOT NULL,
  `Code` varchar(8) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Description` text NOT NULL COMMENT 'Paragraph about course',
  `Credits` tinyint(4) NOT NULL,
  `SemestersRequired` tinyint(4) NOT NULL COMMENT 'Mainly to help identify year courses'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course_list`
--

CREATE TABLE `course_list` (
  `ID` int(11) NOT NULL,
  `Name` varchar(20) DEFAULT NULL COMMENT 'For Internal Reference'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='List of courses that fulfill a program requirement';

-- --------------------------------------------------------

--
-- Table structure for table `course_list_items`
--

CREATE TABLE `course_list_items` (
  `ID` int(11) NOT NULL,
  `CourseListID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Links Courses to Course Lists';

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `ID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prerequisite_option`
--

CREATE TABLE `prerequisite_option` (
  `ID` int(11) NOT NULL,
  `PrerequisiteReqID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Courses that can satisfy a prerequisite requirement';

-- --------------------------------------------------------

--
-- Table structure for table `prerequisite_req`
--

CREATE TABLE `prerequisite_req` (
  `ID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Prerequisite Groups for a course';

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `ID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `FacultyID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `program_req`
--

CREATE TABLE `program_req` (
  `ID` int(11) NOT NULL,
  `Description` varchar(20) NOT NULL COMMENT 'Text to display to user',
  `ProgramID` int(11) NOT NULL,
  `CourseListID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Requirement for a program';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Code` (`Code`);

--
-- Indexes for table `course_list`
--
ALTER TABLE `course_list`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `course_list_items`
--
ALTER TABLE `course_list_items`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CourseID` (`CourseID`),
  ADD KEY `CourseListID` (`CourseListID`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `prerequisite_option`
--
ALTER TABLE `prerequisite_option`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PrerequisiteReqID` (`PrerequisiteReqID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `prerequisite_req`
--
ALTER TABLE `prerequisite_req`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD KEY `FacultyID` (`FacultyID`);

--
-- Indexes for table `program_req`
--
ALTER TABLE `program_req`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ReqCourseListID` (`CourseListID`),
  ADD KEY `ProgramID` (`ProgramID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `course_list`
--
ALTER TABLE `course_list`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_list_items`
--
ALTER TABLE `course_list_items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prerequisite_option`
--
ALTER TABLE `prerequisite_option`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prerequisite_req`
--
ALTER TABLE `prerequisite_req`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program_req`
--
ALTER TABLE `program_req`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_list_items`
--
ALTER TABLE `course_list_items`
  ADD CONSTRAINT `course_list_items_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`ID`),
  ADD CONSTRAINT `course_list_items_ibfk_2` FOREIGN KEY (`CourseListID`) REFERENCES `course_list` (`ID`);

--
-- Constraints for table `prerequisite_option`
--
ALTER TABLE `prerequisite_option`
  ADD CONSTRAINT `prerequisite_option_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`ID`),
  ADD CONSTRAINT `prerequisite_option_ibfk_2` FOREIGN KEY (`PrerequisiteReqID`) REFERENCES `prerequisite_req` (`ID`);

--
-- Constraints for table `prerequisite_req`
--
ALTER TABLE `prerequisite_req`
  ADD CONSTRAINT `prerequisite_req_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`ID`);

--
-- Constraints for table `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `program_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`ID`);

--
-- Constraints for table `program_req`
--
ALTER TABLE `program_req`
  ADD CONSTRAINT `program_req_ibfk_1` FOREIGN KEY (`CourseListID`) REFERENCES `course_list` (`ID`),
  ADD CONSTRAINT `program_req_ibfk_2` FOREIGN KEY (`ProgramID`) REFERENCES `program` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
