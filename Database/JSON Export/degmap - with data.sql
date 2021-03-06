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

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`ID`, `Code`, `Name`, `Description`, `Credits`, `SemestersRequired`) VALUES
(1, 'EECS4088', 'Computer Science Cap', 'A project in computer science chosen in consultation with, and supervised by, a member of the department. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; permission of the Instructor. Normally restricted to students who have taken 36 credits in computer science. Course credit exclusions: LE/EECS 4080 3.00, LE/EECS 4081 6.00, LE/EECS 4082 6.00, LE/EECS 4084 6.00, LE/EECS 4480 3.00, LE/EECS 4700 6.00, LE/ENG 4000 6.00. PRIOR TO FALL 2014: course credit exclusions: LE/CSE 4080 3.00, LE/CSE 4081 6.00, LE/CSE 4082 6.00, LE/CSE 4084 6.00, LE/CSE 4480 3.00, LE/CSE 4700 6.00. PRIOR TO SUMMER 2013: course credit exclusions: SC/CSE 4080 3.00, SC/CSE 4081 6.00, SC/CSE 4082 6.00, SC/CSE 4084 6.00, SC/CSE 4480 3.00, , SC/ENG 4000 6.00.', 6, 2),
(2, 'EECS4413', 'Building E-Commerce ', 'A study of the technical infrastructure that underlies Electronic Commerce on the Internet. The foundational concepts are presented through a series of projects that use an industrial-strength framework on the server side, standard-compliant technologies on the client side, and a variety of messaging protocols on the network side. Best practices, security concerns, and performance issues are emphasized throughout. Prerequisite: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2011 3.00. Previously offered as: LE/CSE 4413 3.00.', 3, 1),
(3, 'EECS1570', 'Introduction to Comp', 'An introduction to computing concepts with applications to problems drawn from psychology, including concepts of computer programming in an integrated computing and visualization environment. Prerequisite: SC/MATH 1505 6.00. Course credit exclusions: LE/EECS 1541 3.00, LE/EECS 1560 3.00. PRIOR TO FALL 2014: course credit exclusions: LE/CSE 1541 3.00, LE/CSE 1560 3.00. PRIOR TO SUMMER 2013: course credit exclusions: SC/CSE 1541 3.00, SC/CSE 1560 3.00.', 3, 1),
(4, 'EECS3611', 'Analog Integrated Ci', 'This course focuses on the analysis and design of analog integrated circuit in CMOS technology. It covers the aspects of circuit design from single transistor operation to complex amplifiers and layout techniques as well as the process and modeling background. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'\'5\'\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2210 3.00.', 4, 1),
(5, 'EECS3000', 'Professional Practic', 'Professional, legal and ethical issues in the development, deployment and use of computer systems; their impact on society including privacy and security, computer crime, malware, and intellectual property; professional ethics and responsibilities; guest lecturers from industry, government and university. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00. Course credit exclusions: LE/ENG 4000 6.00, SC/ENG 4000 6.00 (prior to Summer 2013).', 3, 1),
(6, 'EECS2011', 'Fundamentals of Data', 'A study of fundamental data structures and their use in the efficient implementation of algorithms. Topics include abstract data types, lists, stacks, queues, trees and graphs. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 1030 3.00 or LE/EECS 2030 3.00; LE/EECS 1028 3.00 OR SC/MATH 1028 3.00 or LE/EECS 1019 3.00 or SC/MATH 1019 3.00. Previously offered as: LE/CSE 2011 3.00.', 3, 1),
(7, 'EECS4480', 'Computer Security Pr', 'This is a capstone project course for computer security students. The students engage in a significant research and/or development project that has major computer security considerations. Prerequisites: Restricted to students in the Computer Security degree. Students must have passed 40 EECS or CSE credits. Permission of the Instructor is needed. Course credit exclusions: LE/EECS 4080 3.00; LE/EECS 4081 6.00; LE/EECS 4082 6.00; LE/EECS 4084 6.00; LE/EECS 4088 6.00; LE/EECS 4700 6.00. PRIOR TO FALL 2014: course credit exclusions: LE/CSE 4080 3.00, LE/CSE 4081 6.00, LE/CSE 4084 6.00, LE/CSE 4088 6.00, LE/CSE 4700 6.00, LE/CSE 4082 6.00. PRIOR TO SUMMER 2013: course credit exclusions: SC/CSE 4080 3.00, SC/CSE 4081 6.00, SC/CSE 4084 6.00, SC/CSE 4088 6.00, SC/CSE 4700 6.00, SC/CSE 4082 6.00.', 3, 1),
(8, 'EECS4221', 'Operating System Des', 'An operating system has four major components: process management, input/output, memory management, file system. This project-oriented course puts OS principles into action: design and implementation of components of an OS, interaction with existing system software (using C under Unix). Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 3221 3.00. Previously offered as: LE/CSE 4221 3.00.', 3, 1),
(9, 'EECS2030', 'Advanced Object Orie', 'This course continues the separation of concern theme introduced in LE/EECS 1020 3.00 and LE/EECS1021 3.00. While 1020 and 1021 focuses on the client concern, this course focuses on the concern of the implementer. Hence, rather than using an API (Application Programming Interface) to build an application, the student is asked to implement a given API. Topics include implementing classes (non-utilities, delegation within the class definition, documentation and API generation, implementing contracts), aggregations (implementing aggregates versus compositions and implementing collections), inheritance hierarchies (attribute visibility, overriding methods, abstract classes versus interfaces, inner classes); applications of aggregation and inheritance in concurrent programming and event-driven programming; recursion; searching and sorting including quick and merge sorts); stacks and queues; linked lists; binary trees. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS1021 3.00 or LE/EECS 1020 (prior to Fall 2015) 3.00 or LE/EECS1022 3.00 or LE/EECS 1720 3.00. Course credit exclusions: AP/ITEC 2620 3.00. Previously offered as: LE/EECS1030 3.00, LE/CSE 1030 3.00.', 3, 1),
(10, 'EECS1028', 'Discrete Mathematics', 'An introduction to propositional logic and application to switching circuits; sets, relations and functions; predicate logic and proof techniques; induction with applications to program correctness; basic counting techniques with applications; graphs and trees with applications in circuit analysis, information storage and retrieval, Huffman coding; automata and applications in software engineering. Prerequisites: MHF4U (Advanced Function) and MCV4U (Calculus and Vectors). Course Credit exclusions: LE/CSE 1019 3.00 (prior to Fall 2014), LE/EECS 1019 3.00, SC/CSE 1019 3.00 (prior to Summer 2013), SC/MATH 1019 3.00, SC/MATH 2320 3.00.', 3, 1),
(11, 'EECS4471', 'Introduction to Virt', 'Introduction to the basic principles of Virtual Reality and its applications. The necessary hardware and software components of interactive 3D systems as well as human factors are discussed. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); SC/MATH 1025 3.00; SC/MATH 1310 3.00; LE/EECS 3431 3.00', 3, 1),
(12, 'EECS2602', 'Signals and Systems ', 'Introduces continuous-time (analogue) signals including an analysis and design of continuous-time systems. After reviewing core concepts in complex numbers, trigonometry, and functions, the course considers three alternate representations (differential equations, impulse response, and Laplace/Fourier transfer function) for linear, time invariant (LTI) systems in the continuous-time domain. The analysis of LTI systems is covered for each of the three representations. Frequency-selective filters are introduced as a special class of LTI systems for which design techniques based on Butterworth, Chebyshev, and Elliptic filters are covered. Applications of continuous-time systems in communications and controls are also presented. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); SC/MATH 1014 3.00, SC/MATH 1025 3.00. Course credit exclusions: LE/EECS 3451 4.00, LE/CSE 3451 4.00 (prior to Fall 2014), SC/CSE 3451 4.00 (prior to Summer 2013).', 4, 1),
(13, 'EECS1710', 'Programming for Digi', 'Introduction to program design and implementation focusing on digital media projects including sound, images, and animation; includes algorithms, simple data structures, control structures, and debugging techniques. Course credit exclusions: LE/EECS 1530 3.00, LE/CSE 1530 3.00, SC/CSE 1530 3.00, AP/ITEC 1620 3.00. NCR: Students who completed or are taking LE/EECS 1021 3.00 or LE/EECS 1022 3.00 or LE/EECS 1020 3.00 or LE/CSE 1020 3.00, SC/CSE 1020 3.00.', 3, 1),
(14, 'EECS4412', 'Data Mining', 'Introduces and presents basic concepts of data mining, data mining techniques, models and applications. Topics include association rule mining, classification models, sequential pattern mining and clustering. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 3101 3.00, LE/EECS 3421 3.00 and one of SC/MATH 2030 3.00 or SC/MATH 2930 3.00 or SC/MATH 1131 3.00. Previously offered as: LE/CSE 4412 3.00.', 3, 1),
(15, 'EECS3482', 'Introduction to Comp', 'Introduces fundamental computer security concepts. Topics include security goals and terminology, an overview of the various security domains, an introduction to cryptography, security policies, risk management and auditing. Laboratory exercises emphasize these topics in a practical manner. Prerequisites: Any 12 university credits at the 2000-level in any discipline.', 3, 1),
(16, 'EECS3604', 'Electromagnetic theo', 'Provides the student with an introduction to partial differential equations and the mathematics of wave propagation. Specific applications to electromagnetic waves are discussed. Guided waves, transmission lines, and antennas are also introduced. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; SC/MATH 1014 3.00 or SC/MATH 1025 3.00 or SC/PHYS 2020 3.00.', 4, 1),
(17, 'EECS4090', 'Software Development', 'Large-scale project involving all stages of the software development life cycle: requirements, analysis and design, implementation, testing and delivery. Team work. Open only to students in the Software Development Stream. Prerequisites: LE/EECS 3311 3.00 (with minimum grade of B), LE/EECS 3101 3.00, LE/EECS 3342 3.00. Corequisites: LE/EECS 4312 3.00, LE/EECS 4313 3.00.', 6, 2),
(18, 'EECS3431', 'Introduction to 3D C', 'Introduces the fundamental concepts and algorithms of three-dimensional computer graphics, including object modelling, transformations, cameras, visibility and shading. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2031 3.00, SC/MATH 1025 3.00. PRIOR TO FALL 2011: course credit exclusions: GL/CSLA 3635 3.00.', 3, 1),
(19, 'EECS3481', 'Applied Cryptography', 'An overview of cryptographic algorithms and the main cryptosystems in use today, emphasizing the application of cryptographic algorithms to designing secure protocols. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2011 3.00.', 3, 1),
(20, 'EECS4482', 'Computer Security Ma', 'Examines the organizational policy and management aspects of computer security. It covers topics such as policies, procedures, and standards related to access and use, compliance and privacy, risk management and incident response. Prerequisites: 12 credits at the 3000-level.', 3, 1),
(21, 'EECS4700', 'Digital Media Projec', 'This course involves the completion of a significant body of work in the area of Digital Media. The project will normally be a team project involving the development and analysis of a digital media work potentially having elements of interactivity, animation, 3-D graphics, and sound for example. The project will be presented at a public workshop towards the end of the year. Prerequisites: Only open to students in the final year of the Digital Media program. Course credit exclusions: LE/EECS 4080 3.00; LE/EECS 4081 6.00; LE/EECS 4082 6.00; LE/EECS 4084 6.00; LE/EECS 4088 6.00; LE/EECS 4480 3.00. PRIOR TO FALL 2014: course credit exclusions: LE/CSE 4080 3.00, LE/CSE 4081 6.00, LE/CSE 4082 6.00, LE/CSE 4084 6.00, LE/CSE 4088 6.00, LE/CSE 4480 3.00. PRIOR TO SUMMER 2013: course credit exclusions: SC/CSE 4080 3.00, SC/CSE 4081 6.00, SC/CSE 4082 6.00, SC/CSE 4084 6.00, SC/CSE 4088 6.00, SC/CSE 4480 3.00.', 6, 2),
(22, 'EECS1019', 'Discrete Mathematics', 'Introduction to abstraction. Use and development of precise formulations of mathematical ideas. Informal introduction to logic; introduction to naïve set theory; induction; relations and functions; big O-notation; recursive definitions, recurrence relations and their solutions; graphs and trees. Prerequisites: SC/MATH 1190 3.00, or two 4U Math courses, including MHF4U (Advanced Function). Course credit exclusions: LE/EECS 1028 3.00, SC/MATH 1028 3.00, SC/MATH 2320 3.00.', 3, 1),
(23, 'EECS3121', 'Numerical Methods I', 'An introductory course in computational linear algebra. Topics include simple error analysis, linear systems of equations, non-linear equations, linear least squares and interpolation. Prerequisites: One of SC/MATH 1010 3.00, SC/MATH 1014 3.00, SC/MATH 1310 3.00; one of SC/MATH 1021 3.00, SC/MATH 1025 3.00, SC/MATH 2221 3.00; one of LE/EECS 1540 3.00, LE/EECS 2031 3.00, or LE/EECS 2501 1.00. Course credit exclusions: LE/EECS 3121 3.00, LE/CSE 3121 3.00 (prior to Fall 2014), SC/CSE 3121 3.00 (prior to Summer 2013).', 3, 1),
(24, 'EECS3213', 'Communication Networ', 'Introduces the basics of communications and networking. Topics include transmission media; fundamental limits; protocols and hierarchies; the OSI model; encoding of data as signals; error and flow control; medium access; routing; internetworking; transport services; high-level applications. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; SC/MATH 1310 3.00. Previously offered as: LE/CSE 3213 3.00. PRIOR TO SUMMER 2013: SC/CSE 3213 3.00.', 3, 1),
(25, 'EECS4462', 'Digital Audio', 'This course introduces the basic principles of digital audio, and presents several of its applications. Students will learn the physics of sound and the human auditory system, how analog audio is converted to digital, and the properties of different digital audio formats. They will also get hands-on experience with creating audio plugins for digital audio workstations, as well as creating sound engines for games. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'), LE/EECS 2031 3.00', 3, 1),
(26, 'EECS3451', 'Signals and Systems', 'An introduction to the mathematical background in signals and systems; signal and image processing: sampling, discrete Fourier transform, filtering; linear system theory; Kalman filtering; feedback. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2021 4.00, SC/MATH 1310 3.00. Course credit exclusions: SC/MATH 4130B 3.00, SC/PHYS 4060 3.00. Previously offered as: LE/CSE 3451 4.00. PRIOR TO FALL 2014: course credit exclusions: SC/MATH 4830 3.00. PRIOR TO SUMMER 2013: course credit exclusions: SC/CSE 3451 4.00, SC/EATS 4020 3.00.', 4, 1),
(27, 'EECS3215', 'Embedded Systems', 'Introduction to the design of embedded systems using both hardware and software. Topics include microcontrollers; their architecture, and programming; design and implementation of embedded systems using field programmable gate arrays. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2031 3.00, LE/EECS 3201 4.00. Previously offered as: LE/CSE 3215 4.00. PRIOR TO SUMMER 2013: course credit exclusion: SC/CSE 3215 4.00.', 4, 1),
(28, 'EECS4443', 'Mobile User Interfac', 'The design and implementation of user interfaces for touchscreen devices and tablet computers. Students develop user interfaces that include touch, multi-touch, vibration, device motion, position, and orientation, environment sensing, video capture, and audio capture. Twelve Supervised laboratory hours that emphasize these topics in a practical manner. Prerequisites: General prerequisite; LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 3461 3.00. (NOTE: The General Prerequisite is a cumulative GPA of 4.50 or better over all major EECS courses. EECS courses with the second digit \'5\' are not major courses.)', 3, 1),
(29, 'EECS3221', 'Operating System Fun', 'Principles of operating systems. Concurrent processes, CPU scheduling, deadlocks, memory management, file systems, protection and security, and case studies. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2021 4.00 and LE/EECS 2031 3.00. Previously offered as: LE/CSE 3221 3.00', 3, 1),
(30, 'EECS1910', 'Industry Practicum', 'This course is only available to students in the Industry Partnership Stream of the Computer Science Honours BSc (enrollment by permission). Students in the stream may enroll in the course during a term for which they are employed by the industrial partner. The learning outcomes of the course will be approved by the instructor prior to enrollment.', 3, 1),
(31, 'EECS1720', 'Building Interactive', 'A second course teaching more advanced programming concepts within the context of image, sound and interaction using an object-oriented language; introduction to interactive systems, user interfaces, event-driven programming, object design and inheritance; implementation using debuggers, integrated development environments, user interface builders. Pre-requisites: LE/EECS 1710 3.00. Course credit exclusions: LE/EECS 1020 3.00, LE/EECS 1022 3.00, AP/ITEC 1620 3.00. PRIOR TO FALL 2014: course credit exclusions: LE/CSE 1020 3.00. PRIOR TO SUMMER 2013: course credit exclusions: SC/CSE 1020 3.00.', 3, 1),
(32, 'EECS3201', 'Digital Logic Design', 'Theory and design of logic circuits used in digital systems. Students will be introduced to transistors as devices, will learn how a transistor can be used as a switch, how to design switching circuits to implement logic gates, and how to use logic gates to construct combinational and sequential logic circuits and functional blocks. It also introduces the students to hardware description languages and modern CAD tools. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2021 4.00, LE/EECS 2200 3.00.', 4, 1),
(33, 'EECS4415', 'Big Data Systems', 'Storing, managing, and processing datasets are foundational to both computer science and data science. The enormous size of today\'s data sets and the specific requirements of modern applications necessitated the growth of a new generation of data management systems, where the emphasis is put on distributed and fault-tolerant processing. New programming paradigms have evolved, an abundance of information platforms offering data management and analysis solutions appeared and a number of novel methods and tools have been developed. This course introduces the fundamentals of big data storage, retrieval, and processing systems. As these fundamentals are introduced, exemplary technologies are used to illustrate how big data systems can leverage very large data sets that become available through multiple sources and are characterized by diverse levels of volume (terabytes; billion records), velocity (batch; real-time; streaming) and variety (structured; semi-structured; unstructured). The course aims to provide students with both theoretical knowledge and practical experience of the field by covering recent research on big data systems and their basic properties. Students consider both small and large datasets because both are equally important and justify different trade-offs. Topics include: software frameworks for distributed storage and processing of very large data sets, MapReduce programming model, querying of structured data sets, column stores, key-value stores, document stores, graph databases, distributed stream processing frameworks. Prerequisites: Cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'). General Prerequisites; LE/EECS 3421 3.00; LE/EECS 3101 3.00.', 3, 1),
(34, 'EECS1011', 'Computational Thinki', 'The Objectives of 1011 are threefold: providing a first exposure to procedural programming, teaching students a set of soft computing skills (such as reasoning about algorithms, tracing programs, test-driven development), and demonstrating how computers are used in a variety of engineering disciplines. It uses problem-based pedagogy to expose the underlying concepts and an experiential laboratory to implement them. An integrated computing environment (such as MATLAB) is used so that students can pick up key programming concepts(such as variables and control flow) without being exposed to complex or abstract constructs. The problems are chosen with consultation with the various engineering disciplines in the Faculty with a view of exposing how computing is used in these disciplines. Course credit exclusions: LE/EECS1541 3.00.', 3, 1),
(35, 'EECS4214', 'Digital Communicatio', 'Introduces fundamental principles underlying design and analysis of digital communication systems. Develops mathematical/physical understanding from the information source through the transmitter, channel, receiver, and information sink. Topics include baseband transmission, matched filtering, modulation, channel coding, and spread spectrum. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 3213 3.00; One of SC/MATH 2030 3.00 or SC/MATH 2930 3.00; One of LE/EECS 3451 4.00, LE/EECS 3602 4.00, LE/ESSE 4020 3.00, SC/MATH 4830 3.00, SC/PHYS 4060 3.00 or SC/PHYS 4250 3.00. Previously offered as: LE/CSE 4214 4.00. PRIOR TO SUMMER 2013: course credit exclusion: SC/CSE 4214 4.00.', 4, 1),
(36, 'EECS2200', 'Electrical Circuits', 'This course covers the basic principles of linear circuits. Kirchhoff\'s laws, circuit equations, RL, RC, and RLC circuits, three-phase circuits, power analysis and power factor, and magnetically coupled circuits. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit\'\'5\'); SC/PHYS 1010 6.00 or SC/PHYS 1801 3.00. Course credit exclusions: SC/PHYS 3050 3.00.', 3, 1),
(37, 'EECS3311', 'Software Design', 'A study of design methods and their use in the correct implementation, maintenance and evolution of software systems. Topics include design, implementation, testing, documentation needs and standards, support tools. Students design and implement components of a software system. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2011 3.00; SC/MATH 1090 3.00; LE/EECS 2031 3.00. Previously offered as: LE/CSE 3311 3.00. PRIOR TO SUMMER 2013: SC/CSE 3311 3.00.', 3, 1),
(38, 'EECS3122', 'Numerical Methods II', 'Algorithms and computer methods for solving problems of differentiation, integration, systems of non-linear equations and matrix eigenvalues. Prerequisite: SC/MATH 3241 3.00 or LE/EECS 3121 3.00. Course credit exclusions: LE/EECS 3122 3.00, LE/CSE 3122 3.00 (prior to Fall 2014), SC/CSE 3.00 (prior to Summer 2013).', 3, 1),
(39, 'EECS1541', 'Introduction to Comp', 'An introduction to scientific computing using an integrated computing and visualization platform. Elements of procedural programming such as: control structures, data types, program modules. Visualization in two and three dimensions. Applications to numerical computation and simulations relevant to the physical sciences. Prerequisite: SC/MATH 1013 3.00 or equivalent; Corequisites: SC/PHYS 1010 6.00 or SC/PHYS 1410 6.00 or SC/PHYS 1420 6.00; and SC/MATH 1021 3.00 or SC/MATH 1025 3.00. Course credit exclusions: LE/EECS 1011 3.00, LE/ EECS 1560 3.00, LE/EECS 1570 3.00. PRIOR TO FALL 2014: course credit exclusions: LE/CSE 1560 3.00, LE/SE1570 3.00. PRIOR TO SUMMER 2013: course credit exclusions: SC/CSE 1560 3.00, SC/CSE1570 3.00.', 3, 1),
(40, 'EECS3101', 'Design and Analysis ', 'Review of fundamental data structures. Analysis of algorithms: time and space complexity. Algorithm design paradigms: divide-and-conquer, exploring graphs, greedy methods, local search, dynamic programming, probabilistic algorithms, computational geometry. NP-complete problems. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2011 3.00; SC/MATH 1090 3.00; SC/MATH 1310 3.00. Previously offered as: LE/CSE 3101 3.00. PRIOR TO SUMMER 2013: course credit exclusion: SC/CSE 3101 3.00.', 3, 1),
(41, 'EECS4481', 'Computer Security La', 'Provides a thorough understanding of the technical aspects of computer security. It covers network, operating systems, and application software security. Computer laboratory projects provide exposure to various tools in a hands-on setting. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 3221 3.00; LE/EECS 3214 3.00. Note: Students with background equivalent to the stated prerequisites are encouraged to seek permission to enrol.', 4, 1),
(42, 'EECS3980', 'Computer Security In', 'This experiential education course reflects the work term component of the Technology Internship Program (TIP). Qualified Honours students gain relevant work experience as an integrated complement to their academic studies, reflected in the requirements of a learning agreement and work term report. Students are required to register in this course for each four month work term, with the maximum number of work term courses being four (i.e. 16 months). Students in this course receive assistance from the Career Centre prior to and during their internship, and are also assigned a Faculty Supervisor/Committee. Prerequisites: Enrolment is by permission only. Criteria for permission include: 1. that students have successfully completed at least nine EECS or CSE credits at the 3000-level including LE/EECS 3482 3.00 or LE/CSE 3482 3.00 or SC/CSE 3482 3.00, with a GPA of at least 6.00 in all mathematics and computer science courses completed; 2. that students are enrolled full-time in the Honours program prior to beginning their internship and have attended the mandatory preparatory sessions as outlined by the Career Centre; 3. that students have not been absent for more than two consecutive years as a full-time student from their Honours degree studies; 4. that upon enrolling in this course students have a minimum of nine credits remaining toward their Honours degree and need to return as a full-time student for at least one academic term to complete their degree after completion of their final work term. Registration in LE/EECS 3980 0.00 (formerly LE/CSE 3980 0.00, SC/CSE 3980 0.00) provides a record on the transcript for each work term.', 0, 1),
(43, 'EECS3421', 'Introduction to Data', 'Concepts, approaches and techniques in database management systems (DBMS). Logical model of relational databases. An introduction to relational database design. Other topics such as query languages, crash recovery and concurrency control. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; Course credit exclusions: AP/ITEC 3220 3.00. Previously offered as: LE/CSE 3421 3.00. PRIOR TO SUMMER 2013: SC/CSE 3421 3.00.', 3, 1),
(44, 'EECS1520', 'Computer Use: Fundam', 'An introduction to the use of computers focusing on concepts of computer technology and organization (hardware and software) and the use of applications such as spreadsheets and information retrieval tools for problem solving. This course is designed for students who are not engineering or computer science majors. Students who plan to major in engineering or computer science are advised to take LE/EECS 1011 3.00 or LE/EECS 1012 3.00, respectively. Course credit exclusions: LE/CSE 1520 3.00, AK/AS/SC/CSE 1520 3.00. NCR Note: This course is not open to any student who has passed or is taking LE/EECS 1020 3.00, LE/CSE 1020 3.00, AK/AS/SC/CSE 1020 3.00, LE/EECS 1021 3.00, LE/EECS 1022 3.00.', 3, 1),
(45, 'EECS4314', 'Advanced Software En', 'Advanced software engineering methods, processes and measurements (from requirements through to system evolution) for managing and delivering reliable software on time and within budget. Understanding the different types of systems and their associated technical, ethical and professional issues. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 3311 3.00.', 3, 1),
(46, 'EECS1560', 'Introduction to Comp', 'An introduction to scientific computing using an integrated computing and visualization environment. The course presents computer-based problem-solving techniques through a series of applications rooted in Mathematics and Statistics. Prerequisite: SC/MATH 1300 3.00: Corequisites: SC/MATH 1310 3.00; SC/MATH 1131 3.00 or SC/MATH 2030 3.00. Course credit exclusions: LE/EECS 1541 3.00, LE/EECS 1570 3.00. This course is not open to any student who has passed or is taking SC/PHYS 2030 3.00. PRIOR TO FALL 2014: course credit exclusions: LE/CSE 1541 3.00, LE/CSE 1570 3.00. PRIOR TO SUMMER 2013: course credit exclusions: SC/CSE 1541 3.00, SC/CSE 1570 3.00.', 3, 1),
(47, 'EECS1911', 'Industry Practicum', 'This course is only available to students in the Industry Partnership Stream of the Computer Science Honours BSc (enrollment by permission). Students in the stream may enroll in the course during a term for which they are employed by the industrial partner. The learning outcomes of the course will be approved by the instructor prior to enrollment.', 3, 1),
(48, 'EECS1001', 'Research Directions ', 'An introduction to research directions within the department and more broadly within the field. Students will attend lectures and other events organised by the department. Note: This course is expected to be completed in the first-year of study.', 1, 1),
(49, 'EECS3505', 'Electrical Systems f', 'Many mechanical systems today are integrated with electrical systems. This course will prepare students to work on electromechanical systems by introducing them to topics such as: The basics of circuit analysis and setup, as well as electronics; power systems including 3-phase; DC and AC motors; electro-mechanical actuators; and, time permitting, basics of communication protocols. Prerequisites: SC/PHYS 1801 3.00, LE/MECH 2502 3.00.', 3, 1),
(50, 'EECS4452', 'Digital Signal Proce', 'This course introduces fundamental concepts, principles and algorithms of digital signal processing (DSP), including DFT, FFT, digital filter design and analysis of digital systems. It also covers some selected DSP applications, such as embedded DSP system design, speech and audio processing, image processing, etc. Three lecture hours per week. Twelve supervised laboratory hours. Prerequisites: General prerequisite; LE/EECS 3451 4.00 or LE/EECS 3602 4.00. (NOTE: The General Prerequisite is a cumulative GPA of 4.50 or better over all major EECS courses. EECS courses with the second digit \'5\' are not major courses.)', 3, 1),
(51, 'EECS1530', 'Computer Use: Progra', 'Concepts of computer systems and technology - e.g. software engineering, algorithms, programming languages, theory of computation. Practical work focuses on problem solving using a high-level programming language. The course requires extensive laboratory work. This course is designed for students who are not Computer Science majors, but may be used as preparation by those who wish to major in Computer Science but lack programming background. Course credit exclusions: LE/EECS 1540 3.00, LE/CSE 1540 3.00 (prior to Fall 2014), SC/CSE 1540 3.00 prior to Summer 2013). Previously offered as: LE/CSE 1530 3.00, SC/CSE 1530 3.00. NCR: any student who has passed or is taking LE/EECS 1020 3.00 or LE/CSE 1020 3.00 or SC/CSE 1020 3.00 or LE/EECS 1021 3.00 or LE/EECS 1022 3.00 or AP/ITEC 1620 3.00.', 3, 1),
(52, 'EECS1022', 'Programming for Mobi', 'Provides a first exposure to object-oriented programming and enhances student understanding of key computing skills such as reasoning about algorithms, designing user interfaces, and working with software tools. It uses problem-based approach to expose the underlying concepts and an experiential laboratory to implement them. A mature mobile software infrastructure (such as Java and the Android programming environment) is used to expose and provide context to the underlying ideas. Laboratory exercises expose students to a range of real-world problems with a view of motivating computational thinking and grounding the material covered in lectures. Prerequisite: LE/EECS 1012 3.00. Course credit exclusions: LE/EECS 1021 3.00, LE/EECS 1020 3.00 (prior to Fall 2014), LE/CSE 1020 3.00 (prior to Fall 2014), SC/CSE 1020 3.00 (prior to Summer 2013), AP/ITEC 1620 3.00.', 3, 1),
(53, 'EECS4161', 'Mathematics of Crypt', 'Probability, information theory and number theory and applications to cryptography. Classical codes such as Caesar shift, Vigenere, ADFGVX, rectangular substitution, and others. Other topics: comma free codes, perfect secrecy, index of coincidence, public key systems, primality testing and factorization algorithms. Prerequisites: At least 12 credits from 2000-level (or higher) MATH courses (without second digit \'5\', or second digit \'7\'); or LE/EECS 3101 3.00 or permission of the Instructor.', 3, 1),
(54, 'EECS4101', 'Advanced Data Struct', 'Amortized and worst-case analysis of data structures. Data structuring paradigms: self-adjustment and persistence. Lists: self-adjustment with the move-to-front heuristic. Search trees: splay trees, finger search trees. Heaps: skew heaps, Fibonacci heaps. Union-find trees. Link-and-cut trees. Multidimensional data structures and dynamization. Integrated with: GS/CSE 5101 3.00. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2001 3.00, LE/EECS 3101 3.00. Previously offered as: LE/CSE 4101 3.00. PRIOR TO SUMMER 2013: SC/CSE 4101 3.00.', 3, 1),
(55, 'EECS4422', 'Computer Vision', 'Fundamental concepts of Computer vision and including aspects of biological vision, image formation process, image processing, feature extraction and matching, 3-D parameter estimation, applications and statistical techniques. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; SC/MATH 1025 3.00; SC MATH 1310 3.00, LE/EECS 2031 3.00. Previously offered as: LE/CSE 4422 3.00.', 3, 1),
(56, 'EECS4201', 'Computer Architectur', 'The internal structure and design ideas embodied in many computers and the techniques for evaluating them. Fast arithmetic algorithms, memory system designs, pipeline techniques, input-output subsystems and parallel computing structures. Future trends in computer architecture. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 3201 4.00, LE/EECS 3221 3.00. Previously offered as: LE/CSE 4201 3.00.', 3, 1),
(57, 'EECS4641', 'Introduction to Medi', 'This course builds on the foundation in measurement techniques by developing the students\' understanding of electrophysiological sensing systems and biosensors used within the medical and biological fields. This course applies the classical knowledge of electronic circuits and systems techniques to the development of medical devices and biological instruments. Background in electronic circuit design, basic knowledge of human physiology and body system, and basic knowledge of cellular and molecular biology are required before taking the course. Topics include the design of medical devices such as Electro-Encephalography (EEG) and Electromyography (EMG) devices used for disease diagnostics; biological instruments such as cell counter; handheld sensing devices used for various point-of-care (PoC) applications such as glucose measurement, blood pressure monitoring and early detection of cancer; and wearable sensing devices used for fitness applications. In the design of each medical device or biological instrument, students are also introduced the related theoretical and practical issues with a focus on needs assessment, creativity, and innovation as they seek to identify market opportunities. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2210 4.00, LE/EECS 3215 4.00, SC/BIOL 1000 3.00.', 4, 1),
(58, 'EECS4313', 'Software Engineering', 'An introduction to systematic methods of testing and verification, covering a range of static and dynamic techniques and their use within the development process; emphasizes the view that design should be carried out with verification in mind to achieve overall project goals. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 3311 3.00. Previously offered as: LE/CSE 4313 3.00.', 3, 1),
(59, 'EECS4612', 'Digital Very Large S', 'An introductory course on the design of VLSI CMOS chips. Key elements of complex digital system design are presented including nanoscale MOS fundamentals, CMOS combinational and sequential logic design, datapath and control system design, memories, testing, packaging, l/O, scalability, reliability, and IC design economics. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2200 3.00, LE/EECS 2210 3.00, LE/EECS 3201 4.00.', 4, 1),
(60, 'EECS4411', 'Database Management ', 'A study of principles of database management systems. A thorough analysis of theory of normal, relational algebra and calculus and query languages based on these concepts. Other topics: security and integrity issues, concurrency control, distributed systems, query optimization. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2011 3.00; LE/EECS 2021 4.00, LE/EECS 2031 3.00, LE/EECS 3421 3.00. Previously offered as: LE/CSE 4411 3.00.', 3, 1),
(61, 'EECS2021', 'Computer Organizatio', 'Introduction to computer organization and instruction set architecture, covering assembly language, machine language and encoding, addressing modes, single/multicycle datapaths (including functional units and controls), pipelining, memory segments and memory hierarchy. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 1021 3.00 or LE/EECS 1022 3.00 or LE/EECS 1720 3.00 or LE/EECS 1030 3.00. Previously offered as: LE/CSE 2021 4.00, SC/CSE 2021 4.00.', 4, 1),
(62, 'EECS3461', 'User Interfaces', 'Introduces user interfaces and the tools and mechanisms to create and prototype them. Students work in small groups and learn how to design user interfaces, how to realize them and how to evaluate the end result. Prerequisite: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00. Course credit exclusions: AP/ITEC 3230 3.00. Previously offered as: LE/CSE 3461 3.00. PRIOR TO SUMMER 2013: SC/CSE 3461 3.00.', 3, 1),
(63, 'EECS1021', 'Object Oriented Prog', '\'Introduces student to computational thinking - a process-based approach to problem solving. It uses a problem-based pedagogy to expose the underlying concepts and an experiential laboratory to implement them. The programming language is chosen so that it is widely used in a variety of applications, is object-oriented, and is of industrial strength (Java is an example of such a language). The problems are chosen in order to expose abstract programming concepts by immersing them in relevant and engaging applications. The experiential laboratory is based on sensors and actuators that connect to a computer. The problems are chosen with consultation with the various engineering disciplines in the Faculty with a view of exposing how computing is used in these disciplines. Prerequisites: LE/EECS1011 3.00. Course credit exclusions: LE/EECS 1022 3.00. Previously offered as: LE/EECS1020 3.00, LE/CSE 1020 3.00.', 3, 1),
(64, 'EECS4404', 'Introduction to Mach', 'Machine learning is the study of algorithms that learn how to perform a task from prior experience. This course introduces the student to machine learning concepts and techniques applied to pattern recognition problems in a diversity of application areas. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; one of SC/MATH 2030 3.00 or SC/MATH 2930 3.00 or SC/MATH 1131 3.00.', 3, 1),
(65, 'EECS2001', 'Introduction to the ', 'Introduction to the theory of computing, including automata theory, formal languages and Turing machines; theoretical models and their applications in various fields of computer science. The emphasis is on practical applications of the theory and concepts rather than formal rigour. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 1021 3.00 or LE/EECS 1022 3.00 or LE/EECS 1720 3.00 or LE/EECS 1030 3.00; LE/EECS 1028 3.00 or SC/MATH 1028 3.00 or LE/EECS 1019 3.00 or SC/MATH 1019 3.00. Previously offered as: LE/CSE 2001 3.00. PRIOR TO SUMMER 2013: SC/CSE 2001 3.00.', 3, 1),
(66, 'EECS2311', 'Software Development', 'This course allows students to develop a significant piece of software utilizing all the skills they have acquired so far. This includes requirement elicitation, system specification, implementation, testing, deployment, and user documentation. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 1030 3.00 or LE/EECS 2030 3.00.', 3, 1),
(67, 'EECS2501', 'Fortran and Scientif', 'Covers computer-base problem solving in a variety of scientific and engineering settings. Introduces the FORTRAN programming language and its interface with scientific libraries. Applications are drawn mainly from scientific areas such as numerical methods, processing experimental data, simulation and data visualization. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (EECS courses without second digit \'5\' are not major courses); One of LE/EECS 1020 3.00 or LE/EECS 1021 3.00 or LE/EECS 1022 3.00 or LE/EECS 1530 3.00.', 1, 1),
(68, 'EECS2031', 'Software Tools', 'Tools commonly used in the software development process: the C language; shell programming; filters and pipes; version control systems and \'make\'; debugging and testing. Prerequisites: General prerequisites; LE/EECS 1021 3.00 or LE/EECS 1022 3.00 or LE/EECS 1030 3.00', 3, 1),
(69, 'EECS4421', 'Introduction to Robo', 'An introduction to robotic manipulators and autonomous vehicles. The course covers the kinematics and dynamics of manipulators and autonomous platforms, robot sensors and navigation. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; SC/MATH 1025 3.00, SC/MATH 1310 3.00, LE/EECS 2031 3.00. Previously offered as: LE/CSE 4421 3.00.', 3, 1),
(70, 'EECS4315', 'Mission-Critical Sys', 'Theory and practical tools underlying deductive and algorithmic methods for ensuring the safety and correctness of mission critical systems (e.g. medical systems, nuclear reactors and train systems) with the practical ability to use verification tools to perform software certification. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 3342 3.00.', 3, 1),
(71, 'EECS4401', 'Artificial Intellige', 'This is a second course in Artificial intelligence that covers selected topics in this area such as: reasoning about action and planning, uncertain and fuzzy reasoning, knowledge representation, automated reasoning, non-monotonic reasoning and answer set programming, ontologies and description logic, local search methods, Markov decision processes, autonomous agents and multi-agent systems, machine learning, reasoning about beliefs and goals, and expert systems. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 3401 3.00.', 3, 1),
(72, 'EECS3603', 'Electromechanical En', 'This course covers the basic construction and principles of operation of different types of electric machines; magnetic circuit analysis, single-phase and poly-phase transformers, principles of electromechanical energy conversion, DC machines, three-phase induction machines, synchronous machines, and special machines (stepper motors, linear motors and brushless DC (BLDC) motors). The transients and dynamics of machines are analyzed. Introduction of Solid-State control of motors. In addition to lectures and tutorials, field trip: six hours. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00;LE/EECS 2200 3.00, SC/PHYS 2020 3.00.', 4, 1),
(73, 'EECS4215', 'Mobile Communication', 'Provides an overview of the latest developments and trends in wireless mobile communications, and addresses the impact of wireless transmission and user mobility on the design and management of wireless mobile systems. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 3213 3.00.', 3, 1),
(74, 'EECS3900', 'Computer Science Int', 'This experiential education course reflects the work term component of the Technology Internship Program (TIP). Qualified Honours students gain relevant work experience as an integrated complement to their academic studies, reflected in the requirements of a learning agreement and work term report. Students are required to register in this course for each four month work term, with the maximum number of work term courses being four (i.e. 16 months). Students in this course receive assistance from the Career Centre prior to and during their internship, and are also assigned a Faculty Supervisor/Committee. Prerequisites: Enrolment is by permission only. Criteria for permission include: 1. that students have successfully completed at least nine EECS or CSE credits at the 3000-level including LE/EECS 3311 3.00 or LE/CSE 3311 3.00 or SC/CSE 3311 3.00, with a GPA of at least 6.0 in all mathematics and computer science courses completed; 2. that students are enrolled full-time in the Honours program prior to beginning their internship and have attended the mandatory preparatory sessions as outlined by the Career Centre; 3. that students have not been absent for more than two consecutive years as a full-time student from their Honours degree studies; 4. that upon enrolling in this course students have a minimum of 9 credits remaining toward their Honours degree and need to return as a full-time student for at least one academic term to complete their degree after completion of their final work term. Registration in LE/EECS 3900 0.00 (formerly LE/CSE 3900 0.00, SC/CSE 3900 0.00) provides a record on the transcript for each work term.', 0, 1),
(75, 'EECS3610', 'Semiconductor Physic', 'This course is intended to teach students the basic working principles and modern challenges of semiconductor devices. The main topics will be: (i) Semiconductor physics, (ii) Diodes including p-nand metal-semiconductor junctions, (iii) Metal-oxide-semiconductor capacitors (MOSCAPs), (iv) Metaloxide-semiconductor field-effect transistors (MOSFETs) and related field-effect transistors, (v) Introduction to microfabrication illustrated by the basic MOSFET process, and (vi) State-of-the-art MOSFET scaling challenges and solutions such as high-k dielectrics, strain and FinFET in the context of the International Technology Roadmap for Semiconductors (ITRS) and its successor the International Roadmap for Devices and Systems (IRDS). The students use device simulation software to model device behavior. Prerequisites: A cumulative grade point average of 4.50 or better over all previously completed Major EECS courses; LE/EECS 2210 3.00 or SC/PHYS 3050 3.00', 4, 1);
INSERT INTO `course` (`ID`, `Code`, `Name`, `Description`, `Credits`, `SemestersRequired`) VALUES
(76, 'EECS4312', 'Software Engineering', 'This course deals with the elicitation, specification and analysis of software requirements and provides a critical description of available methods and tools, and practical exercises on applying these methods and tools to realistic problems. Three lecture hours per week. One laboratory hour per week. One term. Three credits. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 3311 3.00. Course credit exclusions: LE/CSE 4312 3.00, AK/AS/SC/CSE 4312 3.00.', 3, 1),
(77, 'EECS4613', 'Power Electronics', 'The objective of this course is to understand the basic operating principles of power conversion using advanced electronic devices. The structure and characteristics of several switching devices are reviewed. Basic power electronic converters and inverters such as AC/DC rectifiers, DC/DC switch mode converters and voltage source DC/AC inverters are studied. Resonant DC/DC converters are introduced. Computation of circuit quantities such as average and RMS value, average power, power factor, total harmonics distortion and power efficiency are also studied. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2210 3.00. Corequisite: LE/EECS 3603 4.00.', 4, 1),
(78, 'EECS4080', 'Computer Science Pro', 'A project in computer science chosen in consultation with, and supervised by, a member of the department. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; permission of the Instructor. Normally restricted to students who have taken 36 credits in computer science. Course credit exclusions: LE/EECS 4081 6.00, LE/EECS 4082 6.00, LE/EECS 4084 6.00, LE/EECS 4088 6.00, LE/EECS 4480 6.00, LE/ENG 4000 6.00. PRIOR TO FALL 2014: Course credit exclusions: LE/CSE 4081 6.00, SC/CSE 4081 6.00, LE/CSE 4082 6.00, SC/CSE 4082 6.00, LE/CSE 4084 6.00, SC/CSE 4084 6.00, LE/CSE 4088 6.00, SC/CSE 4088 6.00, LE/CSE 4480 3.00, SC/CSE 4480. LE/EECS 4700 6.00, LE/CSE 4700 6.00, LE/ENG 4000 6.00, SC/ENG 4000 6.00.', 3, 1),
(79, 'EECS3342', 'System Specification', 'Theory and tools for specifying computer systems (sequential, concurrent and embedded). Specification (via set theory and predicate logic), modelling, abstraction, refinement and formal reasoning are undertaken before code development so that systems are correct by construction under the stated assumptions. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2011 3.00; SC/MATH 1090 3.00.', 3, 1),
(80, 'EECS1012', 'Net-centric Introduc', 'The objectives of 1012 are threefold: providing a first exposure to event-driven programming, teaching students a set of computing skills (including reasoning about algorithms, tracing programs, test-driven development, unit testing), and providing an introduction to computing within a mobile, net-centric context. It uses problem-based approach to expose the underlying concepts and an experiential laboratory to implement them. A mature mobile software infrastructure (such as HTML, CSS, and JavaScript) is used so that students can pick up key programming concepts (such as variables and control flow) within a client-server context without being bogged down in complex or abstract constructs. Laboratory exercises expose students to a range of real-world problems with a view of motivating computational thinking and grounding the material covered in lecture. Prerequisites: One of (1)-(3) below must be met: (1) (New high school curriculum): One 4U Math course with a grade of at least 75%. (2) Completion of six credits from York University MATH courses (not including courses with second digit 5) with a GPA of 5.00 or better over these credits; (3) Completion of six credits from York University mathematics courses whose second digit is 5, with an average grade not below 7.00 (B+). Course credit exclusions: AP/ITEC 3020 3.00, SC/CSE 2041 4.00 (prior to Summer 2013) Previously offered as: LE/CSE 2041 4.00, LE/EECS 2041 4.00.', 3, 1),
(81, 'EECS4425', 'Introductory Computa', 'An introduction to basic notions in molecular biology; sequence analysis algorithms; heuristic algorithms for search in biological databases; algorithms for the reconstruction of phylogenetic trees; algorithms for microarray data analysis for gene expression. Prerequisites: General prerequisite; LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2011 3.00. (NOTE: The General Prerequisite is a cumulative GPA of 4.50 or better over all major EECS courses. EECS courses with the second digit \'5\' are not major courses.)', 3, 1),
(82, 'EECS3214', 'Computer Network Pro', 'This course focuses on the higher-level network protocols, security issues, network programming, and applications. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; NCR: This course is not open for credit to students who passed LE/EECS 4213 3.00, LE/CSE 4213 3.00, SC/CSE 4213 3.00, LE/CSE 4213 3.00, SC/CSE 4213 3.00.', 3, 1),
(83, 'EECS3401', 'Introduction to Arti', 'Artificial Intelligence (AI) deals with how to build intelligent systems. In this course, we examine fundamental concepts in AI: knowledge representation and reasoning, search, constraint satisfaction, reasoning under uncertainty, etc. The course also introduces logic programming and Prolog. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2011 3.00; MATH 1090 3.00. Previously offered as: LE/CSE 3401 3.00. PRIOR TO FALL 2014: course credit exclusion: LE/CSE 3402 3.00. PRIOR TO SUMMER 2013: course credit exclusions: SC/CSE 3401 3.00, SC/CSE 3402 3.00.', 3, 1),
(84, 'EECS4441', 'Human-Computer Inter', 'Introduces the concepts and technology necessary to design, manage and implement interactive software. Students work in small groups and learn how to design user interfaces, how to realize them and how to evaluate the end result. Both design and evaluation are emphasized. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 3461 3.00. Previously offered as: LE/CSE 4441 3.00.', 3, 1),
(85, 'EECS2210', 'Electronic Circuits ', 'This course covers the basic material required in the design of both analog and digital electronic circuits. Diodes, transistors (both BJT and FET), amplifiers, rectifiers, frequency response, feedback amplifiers, switching circuits and introduction to VLSI. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/ENG 2200 3.00. Course credit exclusion: SC/PHYS 3150 3.00.', 3, 1),
(86, 'EECS4111', 'Automata and Computa', 'Introduction to more advanced topics in theoretical foundations of computer science, including the study of formal languages and automata, formal models of computation, and computational complexity measures. Integrated with: GS/CSE 5111 3.00. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2001 3.00, LE/EECS 3101 3.00. Previously offered as: LE/CSE 4111 3.00.', 3, 1),
(87, 'EECS4115', 'Computational Comple', 'Study of time and space and other computational resources required for efficient solution of classes of computational problems, including P and NP, PSPACE. Proof techniques including diagonalization, simulation, reduction and completeness. Models of computation, nondeterminism, randomness. Intractability. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2001 3.00; LE/EECS 3101 3.00. Previously offered as: LE/CSE 4115 3.00.', 3, 1),
(88, 'EECS4622', 'Introduction to Ener', 'Introduction to basic modeling and analysis techniques in electricity generation, transmission and distribution. Introduction to 3-phase systems, single line diagrams and Per Unit system of calculations. Functional descriptions and modeling of generators, transformers, transmission lines, motors and other loads are discussed. Load Flow study, Gauss-Seidel and Newton-Raphson iterative methods; Symmetrical fault analysis, symmetrical components, unsymmetrical fault analysis; introduction of protection relays and Circuit Breakers; power systems stability analysis; introduction to distribution systems and distributed generation. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS2200 3.00, LE/EECS3603 4.00, SC/PHY2020 3.00.', 4, 1),
(89, 'EECS1540', 'Computer Use for the', 'Introduction to problem solving using computers - top down and modular design; implementation in a procedural programming language - control structures, data structures, subprograms; application to simple numerical methods, modelling and simulation in the sciences; use of library subprograms. Course credit exclusions: LE/EECS 1530 3.00. NCR: any student who has passed or is taking LE/EECS 1020 3.00, LE/CSE 1020 3.00 or LE/EECS 1021 3.00 or LE/EECS 1022 3.00 or AP/ITEC 1620 3.00. Previously offered as: LE/CSE 1540 3.00. PRIOR TO FALL 2014: course credit exclusions: LE/CSE 1530 3.00. PRIOR TO SUMMER 2013: course credit exclusions: SC/CSE 1540 3.00.', 3, 1),
(90, 'EECS4642', 'Medical Imaging Syst', 'This course will provide an introduction to several of the major imaging modalities ranging from X-ray projection radiography to magnetic resonance imaging (MRI). This course applies the classical knowledge of physics, circuits, and signal and systems techniques to the development of medical imaging systems. Background in medical devices, electronic circuit, signal and systems, basic knowledge of human physiology and body system, and basic knowledge of physics are required before taking the course. Topics include the physics of radiography; fundamental of X-ray projection radiography and X-ray computed tomography (CT); Fundamental of ultrasound imaging techniques and ultrasound imaging systems; and introduction of magnetic resonance imaging (MRI) system. Three lecture hours per week. Three laboratory hours per week. Prerequisites: General Prerequisite; LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/ EECS 2210 3.00, LE/EECS 3602 4.00 or LE/EECS 3451 4.00. (NOTE: The General Prerequisite is a cumulative GPA of 4.50 or better over all major EECS courses. EECS courses with the second digit \'5\' are not major courses.)', 4, 1),
(91, 'EECS4070', 'Directed Studies', 'By special arrangement, a student may carry out independent study in a specialized area of computer science or engineering under the direction of a member of the EECS department. The student will be expected to meet regularly with the supervisor throughout the term. In addition to regular meetings with the supervisor, a student is expected to do about 10 hours per week on reading and preparation of assigned work. Prerequisites: cumulative GPA of 4.50 or better over all major EECS courses (without second digit \'5\'); LE/EECS 2030 3.00 or LE/EECS 1030 3.00; successful completion of 24 credits in EECS and permission of course coordinator.', 3, 1),
(92, 'EECS3602', 'Systems and Random P', 'Discrete signals are obtained by sampling continuous signals. Starting with a continuous time signal, the course reviews the concept of a discrete signal, the conditions under which a continuous signal is completely represented by its discrete version, and discusses the analysis and design of linear time-invariant, discrete-time systems. In particular, frequency selective filters in the discrete time domain are developed. The second half of the course will cover advanced topics of random processes, noise, and their applications in the real world including the effect of linear systems on the statistical properties of random signals. Prerequisites: General prerequisite;SC/MATH 2930 3.00; LE/EECS 2030 3.00 or LE/EECS 1030 3.00; LE/EECS 2602 4.00, LE/SC/CSE2602 4.00 Course credit exclusions: LE/SC/EECS 3451 4.00, LE/SC/CSE 3451 4.00.', 4, 1),
(93, 'EECS1030', '', '', 0, 1),
(94, 'MATH1505', '', '', 0, 1),
(95, 'MATH1028', '', '', 0, 1),
(96, 'MATH1019', '', '', 0, 1),
(97, 'EECS1020', '', '', 0, 1),
(98, 'MATH1025', '', '', 0, 1),
(99, 'MATH1310', '', '', 0, 1),
(100, 'MATH1014', '', '', 0, 1),
(101, 'MATH2030', '', '', 0, 1),
(102, 'MATH2930', '', '', 0, 1),
(103, 'MATH1131', '', '', 0, 1),
(104, 'PHYS2020', '', '', 0, 1),
(105, 'MATH1190', '', '', 0, 1),
(106, '4UMATH', '', '', 0, 1),
(107, 'MATH1010', '', '', 0, 1),
(108, 'MATH1021', '', '', 0, 1),
(109, 'MATH2221', '', '', 0, 1),
(110, 'ESSE4020', '', '', 0, 1),
(111, 'MATH4830', '', '', 0, 1),
(112, 'PHYS4060', '', '', 0, 1),
(113, 'PHYS4250', '', '', 0, 1),
(114, 'PHYS1010', '', '', 0, 1),
(115, 'PHYS1801', '', '', 0, 1),
(116, 'MATH1090', '', '', 0, 1),
(117, 'MATH3241', '', '', 0, 1),
(118, 'MATH1013', '', '', 0, 1),
(119, 'PHYS1410', '', '', 0, 1),
(120, 'PHYS1420', '', '', 0, 1),
(121, 'ITEC3220', '', '', 0, 1),
(122, 'MATH1300', '', '', 0, 1),
(123, 'MECH2502', '', '', 0, 1),
(124, 'BIOL1000', '', '', 0, 1),
(125, 'PHYS3050', '', '', 0, 1),
(126, 'EECS4213', '', '', 0, 1),
(127, 'CSE4213', '', '', 0, 1),
(128, 'ENG2200', '', '', 0, 1),
(129, 'CSE3451', '', '', 0, 1);

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

--
-- Dumping data for table `prerequisite_option`
--

INSERT INTO `prerequisite_option` (`ID`, `PrerequisiteReqID`, `CourseID`) VALUES
(1, 1, 9),
(2, 1, 93),
(3, 2, 9),
(4, 2, 93),
(5, 3, 6),
(6, 4, 94),
(7, 5, 9),
(8, 5, 93),
(9, 6, 85),
(10, 7, 9),
(11, 7, 93),
(12, 8, 93),
(13, 8, 9),
(14, 9, 10),
(15, 9, 95),
(16, 9, 22),
(17, 9, 96),
(18, 10, 9),
(19, 10, 93),
(20, 11, 29),
(21, 12, 63),
(22, 12, 97),
(23, 12, 52),
(24, 12, 31),
(25, 13, 98),
(26, 14, 99),
(27, 15, 18),
(28, 16, 100),
(29, 16, 98),
(30, 17, 9),
(31, 17, 93),
(32, 18, 40),
(33, 18, 43),
(34, 18, 101),
(35, 18, 102),
(36, 18, 103),
(37, 19, 9),
(38, 19, 93),
(39, 20, 100),
(40, 20, 98),
(41, 20, 104),
(42, 21, 37),
(43, 21, 40),
(44, 21, 79),
(45, 22, 9),
(46, 22, 93),
(47, 23, 68),
(48, 23, 98),
(49, 24, 9),
(50, 24, 93),
(51, 25, 6),
(52, 26, 105),
(53, 26, 106),
(54, 27, 107),
(55, 27, 100),
(56, 27, 99),
(57, 28, 108),
(58, 28, 98),
(59, 28, 109),
(60, 29, 89),
(61, 29, 68),
(62, 29, 67),
(63, 30, 9),
(64, 30, 93),
(65, 31, 99),
(66, 32, 68),
(67, 33, 9),
(68, 33, 93),
(69, 34, 61),
(70, 34, 99),
(71, 35, 9),
(72, 35, 93),
(73, 36, 68),
(74, 36, 32),
(75, 37, 9),
(76, 37, 93),
(77, 38, 61),
(78, 38, 68),
(79, 39, 13),
(80, 40, 9),
(81, 40, 93),
(82, 41, 61),
(83, 41, 36),
(84, 42, 43),
(85, 43, 40),
(86, 44, 24),
(87, 45, 101),
(88, 45, 102),
(89, 46, 26),
(90, 46, 92),
(91, 46, 110),
(92, 46, 111),
(93, 46, 112),
(94, 46, 113),
(95, 47, 114),
(96, 47, 115),
(97, 48, 9),
(98, 48, 93),
(99, 49, 6),
(100, 50, 116),
(101, 51, 68),
(102, 52, 117),
(103, 52, 23),
(104, 53, 118),
(105, 54, 114),
(106, 54, 119),
(107, 54, 120),
(108, 55, 108),
(109, 55, 98),
(110, 56, 9),
(111, 56, 93),
(112, 57, 6),
(113, 58, 116),
(114, 59, 99),
(115, 60, 9),
(116, 60, 93),
(117, 61, 29),
(118, 62, 82),
(119, 63, 9),
(120, 63, 93),
(121, 64, 121),
(122, 65, 9),
(123, 65, 93),
(124, 66, 37),
(125, 67, 122),
(126, 67, 99),
(127, 68, 103),
(128, 68, 101),
(129, 69, 115),
(130, 69, 123),
(131, 70, 80),
(132, 71, 40),
(133, 72, 9),
(134, 72, 93),
(135, 73, 65),
(136, 73, 40),
(137, 74, 9),
(138, 74, 93),
(139, 75, 98),
(140, 76, 99),
(141, 76, 68),
(142, 77, 9),
(143, 77, 93),
(144, 78, 32),
(145, 78, 29),
(146, 79, 9),
(147, 79, 93),
(148, 80, 85),
(149, 80, 27),
(150, 80, 124),
(151, 81, 9),
(152, 81, 93),
(153, 82, 37),
(154, 83, 9),
(155, 83, 93),
(156, 84, 36),
(157, 84, 85),
(158, 84, 32),
(159, 85, 9),
(160, 85, 93),
(161, 86, 6),
(162, 87, 61),
(163, 87, 68),
(164, 87, 43),
(165, 88, 63),
(166, 88, 52),
(167, 88, 31),
(168, 88, 93),
(169, 89, 9),
(170, 89, 93),
(171, 90, 34),
(172, 91, 9),
(173, 91, 93),
(174, 92, 101),
(175, 92, 102),
(176, 92, 103),
(177, 93, 63),
(178, 93, 52),
(179, 93, 31),
(180, 93, 93),
(181, 94, 10),
(182, 94, 95),
(183, 94, 22),
(184, 94, 96),
(185, 95, 93),
(186, 95, 9),
(187, 96, 97),
(188, 96, 63),
(189, 96, 52),
(190, 96, 51),
(191, 97, 63),
(192, 97, 52),
(193, 97, 93),
(194, 98, 9),
(195, 98, 93),
(196, 99, 98),
(197, 99, 99),
(198, 99, 68),
(199, 100, 9),
(200, 100, 93),
(201, 101, 79),
(202, 102, 9),
(203, 102, 93),
(204, 103, 83),
(205, 104, 9),
(206, 104, 93),
(207, 105, 36),
(208, 105, 104),
(209, 106, 9),
(210, 106, 93),
(211, 107, 24),
(212, 108, 85),
(213, 108, 125),
(214, 109, 9),
(215, 109, 93),
(216, 110, 37),
(217, 111, 9),
(218, 111, 93),
(219, 112, 85),
(220, 113, 9),
(221, 113, 93),
(222, 114, 9),
(223, 114, 93),
(224, 115, 6),
(225, 116, 116),
(226, 117, 106),
(227, 118, 9),
(228, 118, 93),
(229, 119, 126),
(230, 119, 127),
(231, 119, 127),
(232, 119, 127),
(233, 119, 127),
(234, 120, 9),
(235, 120, 93),
(236, 121, 6),
(237, 122, 116),
(238, 123, 9),
(239, 123, 93),
(240, 124, 62),
(241, 125, 128),
(242, 126, 9),
(243, 126, 93),
(244, 127, 65),
(245, 127, 40),
(246, 128, 9),
(247, 128, 93),
(248, 129, 65),
(249, 130, 40),
(250, 131, 9),
(251, 131, 93),
(252, 132, 36),
(253, 132, 72),
(254, 133, 9),
(255, 133, 93),
(256, 134, 102),
(257, 135, 9),
(258, 135, 93),
(259, 136, 12),
(260, 136, 26),
(261, 136, 129);

-- --------------------------------------------------------

--
-- Table structure for table `prerequisite_req`
--

CREATE TABLE `prerequisite_req` (
  `ID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Prerequisite Groups for a course';

--
-- Dumping data for table `prerequisite_req`
--

INSERT INTO `prerequisite_req` (`ID`, `CourseID`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 4),
(6, 4),
(7, 5),
(8, 6),
(9, 6),
(10, 8),
(11, 8),
(12, 9),
(13, 11),
(14, 11),
(15, 11),
(16, 12),
(17, 14),
(18, 14),
(19, 16),
(20, 16),
(21, 17),
(22, 18),
(23, 18),
(24, 19),
(25, 19),
(26, 22),
(27, 23),
(28, 23),
(29, 23),
(30, 24),
(31, 24),
(32, 25),
(33, 26),
(34, 26),
(35, 27),
(36, 27),
(37, 29),
(38, 29),
(39, 31),
(40, 32),
(41, 32),
(42, 33),
(43, 33),
(44, 35),
(45, 35),
(46, 35),
(47, 36),
(48, 37),
(49, 37),
(50, 37),
(51, 37),
(52, 38),
(53, 39),
(54, 39),
(55, 39),
(56, 40),
(57, 40),
(58, 40),
(59, 40),
(60, 41),
(61, 41),
(62, 41),
(63, 43),
(64, 43),
(65, 45),
(66, 45),
(67, 46),
(68, 46),
(69, 49),
(70, 52),
(71, 53),
(72, 54),
(73, 54),
(74, 55),
(75, 55),
(76, 55),
(77, 56),
(78, 56),
(79, 57),
(80, 57),
(81, 58),
(82, 58),
(83, 59),
(84, 59),
(85, 60),
(86, 60),
(87, 60),
(88, 61),
(89, 62),
(90, 63),
(91, 64),
(92, 64),
(93, 65),
(94, 65),
(95, 66),
(96, 67),
(97, 68),
(98, 69),
(99, 69),
(100, 70),
(101, 70),
(102, 71),
(103, 71),
(104, 72),
(105, 72),
(106, 73),
(107, 73),
(108, 75),
(109, 76),
(110, 76),
(111, 77),
(112, 77),
(113, 78),
(114, 79),
(115, 79),
(116, 79),
(117, 80),
(118, 82),
(119, 82),
(120, 83),
(121, 83),
(122, 83),
(123, 84),
(124, 84),
(125, 85),
(126, 86),
(127, 86),
(128, 87),
(129, 87),
(130, 87),
(131, 88),
(132, 88),
(133, 91),
(134, 92),
(135, 92),
(136, 92);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;

--
-- AUTO_INCREMENT for table `prerequisite_req`
--
ALTER TABLE `prerequisite_req`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

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
