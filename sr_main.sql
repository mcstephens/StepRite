-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2014 at 02:30 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sr_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
CREATE TABLE IF NOT EXISTS `activities` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'AI Key',
  `patient_id` mediumint(9) DEFAULT NULL,
  `protocol_id` mediumint(9) DEFAULT NULL,
  `exercise_id` mediumint(9) DEFAULT NULL,
  `date_time` datetime NOT NULL,
  `foot` tinyint(1) DEFAULT NULL,
  `calc_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=549 ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `email` varchar(60) COLLATE utf8_bin NOT NULL,
  `type` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `first_name`, `last_name`, `password`, `email`, `type`) VALUES
(3, 'mcstephens', 'Matthew', 'Stephens', '8M7eqtCIQpTXMHidxpMIsC5Z7KlzKpyc', 'mcstephens@gmail.com', 1),
(4, 'mgray', 'Mark', 'Gray', 'awJ4X+PbPhn9c0/fV5Bns+4xkqRYT4wX', 'mgray15@angelo.edu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin_types`
--

DROP TABLE IF EXISTS `admin_types`;
CREATE TABLE IF NOT EXISTS `admin_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_types`
--

INSERT INTO `admin_types` (`id`, `type`) VALUES
(1, 'administrator');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `article` text COLLATE utf8_bin NOT NULL,
  `entry_date` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `name`, `article`, `entry_date`) VALUES
(1, 'Article 1', '<p>Fusce sollicitudin lobortis enim, vitae tempus libero lobortis nec. Quisque sit amet porta massa. Phasellus sed\nante ac nibh laoreet tincidunt a in mauris. Donec sit amet enim elementum, volutpat diam at, luctus dolor. Donec \nconvallis mollis pulvinar. Nunc egestas enim leo, ut tempus neque elementum sit amet. Donec elementum condimentum \nipsum, eget facilisis metus facilisis vitae. .</p>', '2013-12-22'),
(2, 'Article 2', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse aliquam consequat ornare. \nPellentesque sodales, sapien ut volutpat feugiat, risus nunc iaculis diam, sed lacinia dolor odio \nvel velit. Sed ut lorem semper, ornare turpis eget, suscipit lorem. Integer varius cursus leo sed \ncursus. Cras diam neque, euismod vitae sapien ut, imperdiet viverra metus.</p>', '2013-12-23'),
(3, 'Article 3', '<p>Sed sit amet bibendum orci. Suspendisse pellentesque aliquam neque, ac rutrum lacus pellentesque vitae.&nbsp;Morbi sed nibh eget risus laoreet volutpat. Integer fermentum aliquet tempus..</p>\n', '2013-12-24'),
(4, 'CitiBizList', '<p><a href="http://107.21.206.109/press/PR_Rising_Venture_Award_Citibiz_6_2011.pdf" target="_blank">MedHab, Coltrix among top five at Rice Alliance competition</a></p>\n', '2013-12-27'),
(5, 'Fort Worth Business Press', '<p><a href="http://107.21.206.109/press/PR_Patent_New_Release_5_2011.pdf" target="_blank">Mansfield firm gets patent for medical product</a></p>\r\n', '2013-12-27'),
(6, 'Star-Telegram', '<p><a href="http://107.21.206.109/press/PR_TECH_awards.pdf" target="_blank">TECH Fort Worth IMPACT Awards Finalists</a></p>\r\n', '2013-12-27'),
(7, 'Neeley School of Business', '<p><a href="http://107.21.206.109/press/PR_Entrepreneur_09102010.pdf" target="_blank">Do You Have What it Takes to be an Entrepreneur?</a></p>\r\n', '2013-12-27'),
(8, 'Star Telegram (Sandra Baker)', '<p><a href="http://107.21.206.109/press/PR_Award_07052010.pdf" target="_blank">Award is step in the right direction for inventors of leg-rehab device</a></p>\r\n', '2013-12-27'),
(9, 'dBusinessNews', '<p><a href="http://107.21.206.109/press/PR_MostPromising_06292010.pdf" target="_blank">Rice Alliance recognizes MedHab as &#39;Most Promising&#39;</a></p>\r\n', '2013-12-27');

-- --------------------------------------------------------

--
-- Table structure for table `authlock`
--

DROP TABLE IF EXISTS `authlock`;
CREATE TABLE IF NOT EXISTS `authlock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Table structure for table `authlock_log`
--

DROP TABLE IF EXISTS `authlock_log`;
CREATE TABLE IF NOT EXISTS `authlock_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `coefficients`
--

DROP TABLE IF EXISTS `coefficients`;
CREATE TABLE IF NOT EXISTS `coefficients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `f1_c1` float DEFAULT NULL,
  `f1_c2` float DEFAULT NULL,
  `f1_c3` float DEFAULT NULL,
  `f1_c4` float DEFAULT NULL,
  `f2_c1` float DEFAULT NULL,
  `f2_c2` float DEFAULT NULL,
  `f2_c3` float DEFAULT NULL,
  `f2_c4` float DEFAULT NULL,
  `f3_c1` float DEFAULT NULL,
  `f3_c2` float DEFAULT NULL,
  `f3_c3` float DEFAULT NULL,
  `f3_c4` float DEFAULT NULL,
  `f4_c1` float DEFAULT NULL,
  `f4_c2` float DEFAULT NULL,
  `f4_c3` float DEFAULT NULL,
  `f4_c4` float DEFAULT NULL,
  `ax_offset` float DEFAULT NULL,
  `ax_sensitivity` float DEFAULT NULL,
  `ay_offset` float DEFAULT NULL,
  `ay_sensitivity` float DEFAULT NULL,
  `az_offset` float DEFAULT NULL,
  `az_sensitivity` float DEFAULT NULL,
  `gx_offset` float DEFAULT NULL,
  `gx_sensitivity` float DEFAULT NULL,
  `gy_offset` float DEFAULT NULL,
  `gy_sensitivity` float DEFAULT NULL,
  `gz_offset` float DEFAULT NULL,
  `gz_sensitivity` float DEFAULT NULL,
  `mx_offset` float DEFAULT NULL,
  `mx_sensitivity` float DEFAULT NULL,
  `my_offset` float DEFAULT NULL,
  `my_sensitivity` float DEFAULT NULL,
  `mz_offset` float DEFAULT NULL,
  `mz_sensitivity` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

DROP TABLE IF EXISTS `exercises`;
CREATE TABLE IF NOT EXISTS `exercises` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `type` char(10) COLLATE utf8_bin NOT NULL COMMENT '1 = gait, 2 = force, 3 = rom',
  `description` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `start_degrees` int(11) DEFAULT NULL,
  `direction` tinyint(1) DEFAULT NULL COMMENT '0 = anti-clockwise, 1 =clockwise',
  `joint` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `isometric` tinyint(1) DEFAULT NULL COMMENT '0 = false, 1 = true',
  `primary_dashboard` int(11) DEFAULT NULL,
  `secondary_dashboard` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=130 ;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `type`, `description`, `name`, `start_degrees`, `direction`, `joint`, `isometric`, `primary_dashboard`, `secondary_dashboard`) VALUES
(1, '2', 'Stand in place as still as possible.  Do this for the hold time recommended by your provider.', 'Standing', 90, 0, NULL, 0, 1, 0),
(2, '1', 'Gait', 'Gait', 90, 0, NULL, 0, 3, 0),
(3, '2', 'Out of Protocol', 'Out of Protocol', 0, 0, NULL, 0, 3, 0),
(4, '1', 'Walk 20 steps.', 'Walk - 20 Steps', 90, 0, NULL, 0, 3, 0),
(5, '1', 'Walk 50 steps.', 'Walk - 5 Minutes', 90, 0, NULL, 0, 3, 0),
(6, '1', 'Walk 100 steps.', 'Walk - 10 Minutes', 90, 0, NULL, 0, 3, 0),
(7, '1', 'Walk 500 steps.', 'Walk - 15 Minutes', 0, 1, NULL, 0, 3, 0),
(8, '1', 'Walk a quarter of a mile.', 'Walk - 30 Minutes', 90, 0, NULL, 0, 3, 0),
(9, '1', 'Walk a half of a mile.', 'Walk - 45 Minutes', 90, 0, NULL, 0, 3, 0),
(10, '1', 'Walk a mile.', 'Walk - 1 Hour', 90, 1, NULL, 0, 3, 0),
(15, '3', 'Rise on balls of feet.', 'Heel Raise (Bilateral, Standing)', 0, 1, 'A', 0, 2, 1),
(16, '3', 'Balance on one foot, then rise on ball of foot.', 'Heel Raise (Unilateral, Standing) ', 0, 1, 'A', 0, 2, 1),
(17, '3', 'Rock back on heels', 'Toe Raise (Standing) ', 180, 0, 'A', 0, 2, 1),
(18, '3', 'Sitting with one leg over edge of table or bed and a weight around foot, flex ankle, moving toes toward knee.', 'Dorsiflexion', 180, 0, 'A', 0, 2, 0),
(19, '3', 'Lying on stomach with one knee bent and a weight around foot, point foot toward ceiling.', 'Plantar Flexion (Knee Flexed, Prone) ', 180, 0, 'A', 0, 2, 0),
(20, '3', 'With _____ pound weight around one foot, big toe up, bend ankle up and turn foot in.', 'Inversion (Side-Lying) ', 180, 0, 'A', 0, 2, 0),
(21, '3', 'With _____ pound weight around one foot, big toe down, bend ankle up and turn foot out.', 'Eversion (Side-Lying) ', 180, 1, 'A', 0, 2, 0),
(22, '3', 'Feet flat, other foot forward, slide one foot back until gentle stretch is felt.  Keep entire foot on floor. Hold _____ seconds. Relax', 'Dorsiflexion (Self-Mobilization, Sitting) ', 90, 1, 'AK', 1, 1, 2),
(23, '3', 'Stand on ______ foot, hands on hips.  Keeping hips level, bend forward as if to touch forehead to wall.  Hold _____ seconds.', 'Balance: Forward Lean ', 270, 1, 'AKH', 0, 1, 0),
(24, '3', 'Stand on ______ foot, holding ______ pound weight in other hand.  Bend knee, lowering body and reach across.  Hold _____ seconds.', 'Balance: Reach ', 0, 1, 'AKH', 0, 1, 0),
(25, '3', 'Attempt to balance on _____ leg eyes _____.  Hold _____ seconds.', 'Balance with Eyes Open', 0, 1, 'AKH', 0, 1, 0),
(26, '3', 'Eyes _____, balance with _____ leg on dense foam.  Hold _____ seconds.', 'Balance on Foam with Eyes Closed', 0, 1, 'AKH', 0, 1, 0),
(27, '3', 'Bring _____ heel toward buttocks as close as possible.  Hold _____ seconds.', 'Self-Mobilization: Knee Flexion (Prone) ', 0, 1, 'K', 0, 1, 2),
(28, '3', 'Tighten muscles on front of _____ thigh, then lift leg _____ inches from surface, keeping knee locked.', 'Straight Leg Raise (phase 1)', 0, 1, 'HK', 0, 2, 0),
(29, '3', 'Resting on forearms, tighten muscles on front of _____ thigh, then lift leg _____ inches from surface, keeping knee locked.', 'Straight Leg Raise (phase 2)', 0, 1, 'HK', 0, 2, 0),
(30, '3', 'Resting on hands, tighten muscles on front of _____ thigh, then lift leg _____ inches from surface, keeping knee locked.', 'Straight Leg Raise (phase 3)', 0, 1, 'HK', 0, 2, 0),
(31, '3', 'Tighten muscles on front of _____ thigh, then lift leg _____ inches from surface, keeping knee locked.', 'Hip Extension (Prone) ', 0, 1, 'HK', 0, 2, 1),
(32, '3', 'Tighten muscles on front of _____ thigh, then lift leg _____ inches from surface, keeping knee locked.', 'Hip Abduction ', 0, 1, 'HK', 0, 2, 0),
(33, '3', 'Tighten muscles on front of _____ thigh, then lift leg _____ inches from surface, keeping knee locked.', 'Hip Adduction', 0, 1, 'H', 0, 2, 0),
(34, '3', 'With _____ knee over bolster, straighten knee by tightening muscles on top of thigh.  Keep bottom of knee on bolster.', 'Strengthening: Terminal Knee Extension (Supine) ', 0, 1, 'K', 0, 2, 0),
(35, '3', 'With support, bend _____ knee as far as possible.', 'Knee Flexion (Standing) ', 90, 0, 'K', 0, 1, 2),
(36, '3', 'With tubing around _____ leg, bring leg across body.', 'Hip Adduction (Resisted) ', 90, 0, 'H', 0, 2, 1),
(37, '3', 'With tubing around _____ leg, other side toward anchor, extend leg out from side.', 'Hip Abduction (Resisted) ', 90, 0, 'H', 0, 2, 1),
(38, '3', 'With tubing around _____ leg, face anchor and pull leg straight back.', 'Hip Extension (Resisted) ', 90, 0, 'H', 0, 2, 1),
(39, '3', 'With tubing around _____ ankle, anchor behind, bring leg forward, keeping knee straight.', 'Hip Flexion (Resisted) ', 90, 0, 'H', 0, 2, 1),
(40, '3', 'With tubing around ____ leg, anchor behind on the same side, begin with leg out behind.  Pull leg across front of body as if kicking a soccer ball.', 'Hip Diagonal Abduction (Resisted)', 90, 0, 'H', 0, 2, 1),
(41, '3', 'With tubing around _____ leg, anchor behind on other side, begin with leg in and behind.  Extend leg out from side as in karate kick.', 'Hip Diagonal Abduction', 90, 0, 'H', 0, 2, 1),
(42, '3', 'Place heels together and pull feet toward groin until stretch is felt in groin and inner thigh. Hold _____ seconds.', 'Stretching Inner Thigh ', 0, 1, 'KH', 1, 1, 2),
(43, '3', 'Lying on floor with _____ leg on wall, other leg through doorway, scoot buttocks toward wall until stretch is felt in back of thigh. As leg relaxes, scoot closer to wall.  Hold _____ seconds.', 'Stretching Hamstring (Against Wall)', 0, 1, 'KH', 1, 1, 2),
(44, '3', 'Kneeling on _____ knee, slowly push pelvis down while slightly arching back until stretch is felt on front of hip.', 'Stretching Hip Flexor', 0, 1, 'KHA', 0, 2, 1),
(45, '3', 'Cross _____ leg over other thigh and place elbow over outside of knee. Gently stretch buttock muscles by pushing bent knee across body.  Hold _____ seconds.', 'Stretching Piriformis', 0, 1, 'H', 1, 1, 2),
(46, '3', 'Cross _____ leg over the other, then lean to same side until stretch is felt on other hip.  Hold _____ seconds.', 'Stretching Tensor', 0, 1, 'H', 0, 2, 1),
(47, '3', 'Pull _____ heel toward buttock until stretch is felt in front of thigh.  Hold _____ seconds.', 'Stretching Quadriceps (Standing)', 0, 1, 'KH', 0, 2, 1),
(48, '3', 'Supporting _____ thigh behind knee, slowly straighten knee until stretch is felt in back of thigh.  Hold _____ seconds.', 'Stretching Hamstring (Supine)', 0, 1, 'KH', 0, 2, 0),
(49, '3', 'Place _____ foot on stool.  Slowly lean forward, keeping back straight, until stretch is felt in back of thigh.  Hold _____ seconds.', 'Stretching Hamstring (Standing)', 0, 1, 'HK', 0, 2, 1),
(50, '3', 'With _____ leg straight, tuck other foot near groin.  Reach down until stretch is felt in back of thigh.  Keep back straight.  Hold _____ seconds.', 'Stretching Hamstring (Sitting)', 0, 1, 'HK', 1, 1, 2),
(51, '3', 'Stand with _____ foot back, leg straight, forward leg bent.  Keeping heel on floor, turned slightly out, lean into wall until stretch is felt in calf.  Hold _____ seconds.', 'Stretching Gastroc', 0, 1, 'AK', 0, 1, 0),
(52, '3', 'Stand with _____ foot back, both knees bent.  Keeping heels on floor, turned slightly out, lean into wall until stretch is felt in lower calf.  Hold _____ seconds.', 'Stretching Soleus', 0, 1, 'AK', 0, 1, 0),
(53, '3', 'Facing anchor with _____ knee slightly bent and tubing just above knee, gently pull knee straight back.  Do not overextend knee.', 'Terminal Knee Extension (Resisted)', 90, 0, 'KH', 0, 2, 1),
(54, '3', 'Facing anchor with tubing on _____ ankle, leg straight out, bend knee.', 'Hamstring Curl (Resisted, Sitting)', 0, 0, 'K', 0, 2, 0),
(55, '3', 'Anchor behind, with tubing on _____ ankle, leg straight, bend knee.', 'Hamstring Curl (Resisted, Prone) ', 0, 1, 'K', 0, 2, 0),
(56, '3', 'Slowly "walk" or slide feet on wall toward floor until stretch is felt in knees.', 'Knee Wall Slide', 0, 0, 'K', 1, 1, 2),
(57, '3', 'Cross legs, ____ on top.  Gently pull other knee toward chest until stretch is felt in buttock/hip of top leg.', 'Piriformis (Sitting)', 270, 1, 'H', 0, 1, 2),
(58, '3', 'With band looped around _____ ankle and under other foot, straighten leg with ankle loop.  Keep other leg bent to increase resistance.', 'Knee Extension (Resisted, Sitting) ', 90, 0, 'K', 0, 2, 0),
(59, '3', 'Stand on step, _____ leg off step, knee straight.  Raise unsupported hip keeping knee straight.', 'Hip Hike', 180, 0, 'H', 0, 2, 1),
(60, '3', 'Sit with band under _____ foot and looped around ankle of supported leg.  Pull unsupported leg back.', 'Knee Flexion (Resisted, Sitting) ', 90, 1, 'K', 0, 2, 0),
(61, '3', 'Sit with band loop around _____ ankle, anchor on same side.  Keeping thigh flat and knee bent at right angle, pull ankle across body.', 'Hip External Rotation (resisted, sitting) ', 90, 0, 'H', 0, 2, 0),
(62, '3', 'Sit with band loop around _____ ankle, anchor on other side. Keeping thigh flat and knee bent at right angle, pull ankle away from body.', 'Hip Internal Rotation (Resisted, Sitting) ', 90, 0, 'H', 0, 2, 0),
(63, '3', 'With _____ foot on _____ inch step, raise other hip at right angle letting knee bend.', 'Hip Flexion ', 0, 1, 'HK', 0, 2, 1),
(64, '3', 'With _____ leg supported, chair in front for balance, slowly bend other leg until stretch is felt in thigh of supported leg.  Hold _____ seconds.', 'Stretching Hip Flexor ', 0, 1, 'HK', 0, 2, 1),
(65, '3', 'Sit with knee straight and towel looped around _____ foot.  Gently pull on towel until stretch is felt in calf.  Hold _____ seconds.', 'Stretching Calf ', 270, 0, 'AHK', 0, 2, 0),
(66, '3', 'Pull _____ knee toward opposite shoulder.  Hold _____ seconds.', 'Stretching Piriformis (Supine) ', 180, 1, 'H', 0, 2, 0),
(67, '3', 'Cross _____ leg behind other leg.  Bend at waist, reaching toward floor. Hold _____ seconds.', 'Stretching Iliotibial Band ', 0, 1, 'HK', 1, 1, 2),
(68, '3', 'With _____ knee on knee-height surface, support with same side hand. Gently pull heel toward buttock. Hold _____ seconds.', 'Stretching Quadriceps ', 0, 1, 'AK', 0, 1, 2),
(69, '3', 'Stand with ball between knees. Squat with head up, reaching back with buttocks as if sitting down.', 'Mini Squat with Ball Squeeze ', 0, 1, 'AHK', 0, 1, 0),
(70, '3', 'Place _____ pound weight on _____ ankle and straighten knee fully, lower _____.', 'Knee Extension (Sitting) ', 90, 0, 'K', 0, 2, 0),
(71, '3', 'Sit on edge of chair, feet flat on floor. Stand upright extending knees fully.', 'Sit to Stand ', 0, 1, 'AHK', 0, 1, 0),
(72, '3', 'Keeping feet flat on floor, should width apart, squat as low as comfortable. Use support as necessary.', 'Chair Squat ', 0, 1, 'AHK', 0, 1, 0),
(73, '2', 'Stand with feet shoulder width apart and squat deeply, head and chest up.', 'Deep Squat', 0, 1, 'AHK', 0, 1, 0),
(74, '3', 'With support, _____ pound weight around _____ ankle, slowly bend knee up.  Return _____.', 'Knee Flexion (Resisted, Standing) ', 90, 0, 'K', 0, 1, 2),
(75, '3', 'With foot of involved leg on step, straighten leg. Return.', 'Single Leg Step Up ', 0, 1, 'AHK', 0, 1, 2),
(76, '3', 'Move onto step with one foot, then the other.  Step back off the same way.', 'Forward Step Up ', 0, 1, 'AHK', 0, 1, 2),
(77, '3', 'Step on backwards with one foot, then the other. Step off forward the same way.', 'Retro Step Up ', 0, 1, 'AHK', 0, 1, 2),
(78, '3', 'With feet shoulder-width apart and back against wall, slide down wall until knees are at 30-45 degrees. Return.', 'Quarter Squat ', 90, 1, 'AHK', 1, 1, 2),
(79, '3', 'Standing on involved leg with back against wall, slide down wall until knee is at 30-45 degrees. Return.', 'Single Leg Quarter Squat ', 0, 1, 'AHK', 1, 1, 2),
(80, '3', 'Rotate foot and ankle on board clockwise. Then rotate counterclockwise.', 'Balance Board (Sitting) ', 0, 1, 'A', 1, 1, 2),
(81, '3', 'With involved leg on board and other foot on floor, rotate board clockwise, then counterclockwise.', 'Balance Board (Standing, Two Feet) ', 0, 1, 'A', 1, 1, 2),
(82, '3', 'Standing on board on the involved leg, rotate board clockwise, then counterclockwise.', 'Balance Board (Standing, One Foot) ', 0, 1, 'AHK', 0, 1, 0),
(83, '3', 'Pedal forward or backward. Adjust seat so leg is nearly straight when down.', 'Reserved', 0, 1, 'AHK', 0, 1, 2),
(84, '3', '_____ forward on treadmill at ______ mph with a ______ % elevation for ______ minutes or Do Program ___________ for _______ minutes.', 'Forward Treadmill ', 0, 1, 'AHK', 0, 1, 2),
(85, '3', 'Walk backwards on treadmill at ______ mph with a ______ % elevation for _____ minutes.  Or do program _________________ for _____ minutes.', 'Backward Treadmill ', 0, 1, 'AHK', 0, 1, 2),
(86, '3', 'Perform side steps on treadmill at _____ mph with a _____ % elevation for _____ minutes or Do program _______________ for _____ minutes.', 'Sideways Treadmill ', 0, 1, 'AHK', 0, 1, 2),
(87, '3', 'Using both legs "walk" forward down a long hallway.', 'Forward Stool Walk ', 0, 1, 'AK', 0, 1, 0),
(88, '3', 'Using both legs "walk" backward down a long hallway.', 'Retro Stool Walk ', 0, 1, 'AK', 0, 1, 0),
(89, '3', 'Using both legs "walk" sideways using side steps down a long hallway.', 'Sideways Stool Walk ', 0, 1, 'AK', 0, 1, 0),
(90, '3', 'With rolled pillow against wall, press foot into pillow. Hold for prescribed seconds. Relax.', 'Isometric Plantar Flexion', 270, 1, 'AHK', 1, 1, 2),
(91, '3', 'With rolled pillow between feet, press inner borders of feet into pillow.  Hold for _____ seconds.  Relax', 'Isometric Inversion', 270, 1, 'AHK', 1, 1, 2),
(92, '3', 'With rolled pillow between feet, squeeze feet together.  Hold _____ seconds. Relax.', 'Isometric Dorsiflexion', 270, 1, 'AHK', 1, 1, 2),
(93, '3', 'With rolled pillow against wall, press outer border of foot into pillow.  Hold _____ seconds. Relax.', 'Isometric Eversion', 270, 1, 'AHK', 1, 1, 2),
(94, '3', 'With foot turned outward, tighten muscles on back of thigh by pulling heel downward into surface.  Hold _____ seconds.', 'Strengthening: External Hamstring', 270, 1, 'AHK', 1, 1, 2),
(95, '3', 'With foot turned inward, tighten muscles on back of thigh by pulling heel downward into surface.  Hold _____ seconds.', 'Strengthening: Internal Hamstring', 0, 0, 'AHK', 1, 1, 2),
(96, '3', 'With folded pillow between knees, squeeze knees together.  Hold _____ seconds.', 'Strengthening: Isometric Hip Adduction', 270, 0, 'AHK', 1, 1, 2),
(97, '3', 'Using a folded pillow, push outside of knee into wall. Hold _____ seconds.', 'Strengthening: Isometric Hip Abduction', 270, 0, 'AHK', 1, 1, 2),
(98, '3', 'Tighten muscles on top of thigh by pushing knees down into surface. Hold _____ seconds.', 'Strengthening: Quadriceps Sets', 0, 1, 'AHK', 1, 1, 2),
(99, '3', 'Eyes _____, balance with _____ leg on dense foam.  Hold _____ seconds.', 'Balance on Foam with Eyes Open', 0, 1, 'AKH', 0, 1, 0),
(100, '3', 'Attempt to balance on _____ leg eyes _____.  Hold _____ seconds.', 'Balance with Eyes Closed', 0, 1, 'AKH', 0, 1, 0),
(101, '3', 'Anchor behind, with tubing on _____ ankle, leg straight, bend knee.', 'Hamstring Curl (Prone)', 0, 1, 'K', 0, 2, 0),
(102, '3', 'Facing anchor with tubing on _____ ankle, leg straight out, bend knee.', 'Hamstring Curl (Sitting)', 0, 0, 'K', 0, 2, 0),
(103, '3', 'With tubing around _____ leg, face anchor and pull leg straight back.', 'Hip Extension (Standing)', 90, 0, 'H', 0, 1, 2),
(104, '3', 'Sit with band loop around _____ ankle, anchor on other side. Keeping thigh flat and knee bent at right angle, pull ankle away from body.', 'Hip Internal Rotation (Sitting)', 90, 0, 'H', 0, 2, 0),
(105, '3', 'Sit with band loop around _____ ankle, anchor on same side.  Keeping thigh flat and knee bent at right angle, pull ankle across body.', 'Hip External Rotation (Sitting)', 90, 0, 'H', 0, 2, 0),
(106, '2', 'Pedal forward or backward. Adjust seat so leg is nearly straight when down.', 'Biking - 5 Minutes', 0, 1, 'AHK', 0, 4, 0),
(107, '2', 'Pedal forward or backward. Adjust seat so leg is nearly straight when down.', 'Biking - 10 Minutes', 0, 1, 'AHK', 0, 4, 0),
(108, '2', 'Pedal forward or backward. Adjust seat so leg is nearly straight when down.', 'Biking - 15 Minutes', 0, 1, 'AHK', 0, 4, 0),
(109, '2', 'Pedal forward or backward. Adjust seat so leg is nearly straight when down.', 'Biking - 30 Minutes', 0, 1, 'AHK', 0, 4, 0),
(110, '2', 'Pedal forward or backward. Adjust seat so leg is nearly straight when down.', 'Biking - 45 Minutes', 0, 1, 'AHK', 0, 4, 0),
(111, '2', 'Pedal forward or backward. Adjust seat so leg is nearly straight when down.', 'Biking - 1 Hour', 0, 1, 'AHK', 0, 4, 0),
(112, '3', 'Lift each leg one at a time', 'Marching Steps', 0, 1, 'AKH', 0, 1, 2),
(113, '3', 'Bending your knees with back straight step to the left 3 steps, then to the right 3 steps.', 'Bent Knee Side Steps', 0, 1, 'AKH', 0, 1, 2),
(114, '3', 'Laying on the ground, bring your knees up. Then, bring your buttocks up, tightening the muscles for ___ seconds, release.', 'Bridges', 0, 1, 'AKH', 0, 1, 2),
(115, '3', 'Leaning on a counter with either your hands or forearms, back straight, raise your heels up and hold for ___ seconds, release.', 'Counter Top Plank', 0, 1, 'AKH', 0, 1, 2),
(116, '3', 'Legs apart, with dumbells in your hands, bend your knees keeping your back straight and hold for __ seconds.', 'Dumbell Squat', 0, 1, 'AKH', 0, 1, 2),
(117, '3', 'Balancing on one leg, toss a ball in the air and catch it for __ seconds.  Then switch legs and repeat.', 'Single Leg Stance with Ball Toss', 0, 1, 'AKH', 0, 1, 2),
(118, '3', 'Hands on your hips, standing straight up, put one leg forward and bend it half way down, hold for __ seconds.  Do the same for the other leg.', 'Mini Squat (Lunge)', 0, 1, 'AKH', 0, 1, 2),
(119, '3', 'Bending your knees, walk forward with arms swinging the opposite direction of your legs. Can be done backwards.', 'Monster Walk', 0, 1, 'AKH', 0, 1, 2),
(120, '3', 'Bending your left knee, extend your right foot forward and hold for __ seconds.  Then repeat on the other leg.', 'Single Leg Bent Knee Toe Touch Forward', 0, 1, 'AKH', 0, 1, 2),
(121, '3', 'Bending your left knee, extend your right foot to the side and hold for __ seconds.  Then repeat on the other leg.', 'Single Leg Bent Knee Toe Touch Side', 0, 1, 'AKH', 0, 1, 2),
(122, '3', 'Bending your left knee, extend your right foot behind you and hold for __ seconds.  Then repeat on the other leg.', 'Single Leg Bent Knee Toe Touch to Rear', 0, 1, 'AKH', 0, 1, 2),
(123, '3', 'Standing straight up, extend your right foot forward and hold for __ seconds.  Then repeat on the other leg.', 'Single Leg Toe Touch Forward', 0, 1, 'AKH', 0, 1, 2),
(124, '3', 'Standing straight up, extend your right foot behind you and hold for __ seconds.  Then repeat on the other leg.', 'Single Leg Toe Touch Rear', 0, 1, 'AKH', 0, 1, 2),
(125, '3', 'Standing straight up, extend your right foot to the side and hold for __ seconds.  Then repeat on the other leg.', 'Single Leg Toe Touch Side', 0, 1, 'AKH', 0, 1, 2),
(126, '3', 'Keeping your knees bent, take three steps diagonally with your right leg, then three steps with your left leg.', 'Zig Zag Step', 0, 1, 'AKH', 0, 1, 2),
(127, '3', 'Lying on your side, bend your knees and then lift the upper knee using only your hips.  Hold ___ seconds.  Repeat on your other side.', 'The Clams', 0, 1, 'AKH', 0, 1, 2),
(128, '3', 'Lying on your side supporting yourself with your left arm, raise your hips up off the ground and hold for ___ seconds.  Repeat on other side.', 'Side Lying Plank', 0, 1, 'AKH', 0, 1, 2),
(129, '3', 'Place right leg on stool or step, twist your body and step up lifting your left leg and holding for ___ seconds. Repeat on the other foot.', 'Transverse Step Up', 0, 1, 'AKH', 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `exercise_types`
--

DROP TABLE IF EXISTS `exercise_types`;
CREATE TABLE IF NOT EXISTS `exercise_types` (
  `id` smallint(2) NOT NULL,
  `name` char(5) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `exercise_types`
--

INSERT INTO `exercise_types` (`id`, `name`) VALUES
(1, 'gait'),
(2, 'force'),
(3, 'rom');

-- --------------------------------------------------------

--
-- Table structure for table `extended_dates`
--

DROP TABLE IF EXISTS `extended_dates`;
CREATE TABLE IF NOT EXISTS `extended_dates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `extended_from` date NOT NULL,
  `extended_to` date NOT NULL,
  `extended_when` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=56 ;

-- --------------------------------------------------------

--
-- Table structure for table `forcecalculations`
--

DROP TABLE IF EXISTS `forcecalculations`;
CREATE TABLE IF NOT EXISTS `forcecalculations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `average` double DEFAULT NULL,
  `min` double DEFAULT NULL,
  `max` double DEFAULT NULL,
  `over_max` int(11) DEFAULT NULL,
  `under_min` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `force1` double DEFAULT NULL,
  `force2` double DEFAULT NULL,
  `force3` double DEFAULT NULL,
  `force4` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=112 ;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
CREATE TABLE IF NOT EXISTS `forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aob1` tinyint(1) DEFAULT NULL,
  `aob2` tinyint(1) DEFAULT NULL,
  `aob3` tinyint(1) DEFAULT NULL,
  `aob4` tinyint(1) DEFAULT NULL,
  `aob5` tinyint(1) DEFAULT NULL,
  `aob6` tinyint(1) DEFAULT NULL,
  `insurance` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `ctt_prov` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `ctt_date` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `ctt1` tinyint(1) DEFAULT NULL,
  `pfp_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `pfp_rep` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `pfp_rel` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Table structure for table `gaitcalculations`
--

DROP TABLE IF EXISTS `gaitcalculations`;
CREATE TABLE IF NOT EXISTS `gaitcalculations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stride_dist` double DEFAULT NULL,
  `swing_time` double DEFAULT NULL,
  `stance_time` double DEFAULT NULL,
  `time` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=71 ;

-- --------------------------------------------------------

--
-- Table structure for table `injurytypes`
--

DROP TABLE IF EXISTS `injurytypes`;
CREATE TABLE IF NOT EXISTS `injurytypes` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` char(30) CHARACTER SET latin1 NOT NULL,
  `category` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=40 ;

--
-- Dumping data for table `injurytypes`
--

INSERT INTO `injurytypes` (`id`, `name`, `category`) VALUES
(1, 'Total Hip Replacement', 1),
(2, 'Partial Hip Replacement', 1),
(3, 'Total Reconstruction', 1),
(4, 'Partial Reconstruction', 1),
(5, 'Revision', 1),
(6, 'Repair', 1),
(7, 'Fractured Hip', 1),
(8, 'Dislocated Hip', 1),
(9, 'Introduction or Removal', 1),
(11, 'Total Knee Replacement', 2),
(12, 'Partial Knee Replacement', 2),
(13, 'Total Reconstruction', 2),
(14, 'Partial Reconstruction', 2),
(15, 'Revision', 2),
(16, 'Repair', 2),
(17, 'Fractured Knee', 2),
(18, 'Dislocated Knee', 2),
(19, 'Arthroscopy', 2),
(20, 'ACL', 2),
(21, 'Introduction or Removal', 2),
(22, 'Amputation', 2),
(23, 'Total Ankle Replacement', 3),
(24, 'Partial Ankle Replacement', 3),
(25, 'Total Reconstruction', 3),
(26, 'Partial Reconstruction', 3),
(27, 'Revision', 3),
(28, 'Repair', 3),
(29, 'Fractured Ankle', 3),
(30, 'Dislocated Ankle', 3),
(31, 'Introduction or Removal', 3),
(32, 'Arthrodesis', 3),
(33, 'Amputation', 3),
(34, 'Hindquarter', 4),
(35, 'Femur', 4),
(36, 'Tibia/Fibula', 4),
(37, 'Ankle', 4),
(38, 'Foot', 4),
(39, 'Toes', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `subject` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `note` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `patient_id`, `date`, `subject`, `note`) VALUES
(1, 2, '2012-02-15 00:00:00', 'This is a SOAP Note', 'SOAP Notes are really cool and useful for doctors!  I''m writing this one to test them on our dashboard!');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` mediumint(9) DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `message` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `doctor_id`, `datetime`, `read`, `type`, `message`) VALUES
(1, 59, '2014-01-04 22:04:56', 0, 0, 'This is a normal message'),
(2, 59, '2014-01-01 00:00:00', 0, 1, 'This is a warning message'),
(3, 59, '2014-01-04 22:05:04', 1, 0, 'This is a normal message');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `user_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `mrn` varchar(32) COLLATE utf8_bin NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reg_date` date NOT NULL,
  `weight` smallint(3) unsigned NOT NULL,
  `height` smallint(3) unsigned NOT NULL,
  `pt` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dr` varchar(64) COLLATE utf8_bin NOT NULL,
  `injured_leg` tinyint(1) unsigned NOT NULL,
  `sets` tinyint(10) unsigned NOT NULL,
  `phone_num` varchar(10) COLLATE utf8_bin NOT NULL,
  `processed_date` date DEFAULT NULL,
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `extended` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `treatment` tinyint(1) unsigned DEFAULT '0',
  `aob` tinyint(1) unsigned DEFAULT '0',
  `ctt` tinyint(1) unsigned DEFAULT '0',
  `pfp` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `doctor_id` (`provider_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`user_id`, `provider_id`, `mrn`, `start_date`, `end_date`, `reg_date`, `weight`, `height`, `pt`, `dr`, `injured_leg`, `sets`, `phone_num`, `processed_date`, `form_id`, `extended`, `treatment`, `aob`, `ctt`, `pfp`) VALUES
(2, 1, '123456789', '2014-01-01', '2014-03-14', '2014-01-03', 200, 72, NULL, 'Mike Jones', 0, 3, '5555555555', NULL, 0, 0, 0, 0, 0, 0),
(3, 1, '123456001', '2014-01-02', '2014-04-01', '2014-01-05', 185, 69, 'Habil', 'Zod', 0, 3, '5555555555', NULL, 0, 0, 0, 0, 0, 0),
(4, 1, '123456001', '2013-12-09', '2014-05-08', '2014-01-05', 155, 67, 'Rehab Guy', 'Zoidberg', 0, 8, '5555555555', NULL, 0, 0, 0, 0, 0, 0),
(5, 1, '987654321', '2014-01-01', '2014-01-16', '2014-01-06', 145, 62, 'S.T.A.R.S', 'Jack Kevorkian', 0, 1, '5555555555', NULL, 0, 0, 0, 0, 0, 0),
(6, 1, '123123123', '2014-01-01', '2014-08-01', '2014-01-06', 210, 74, 'John D Rockefeller', 'Andrew Carnegie', 0, 5, '5555555555', NULL, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `protocols`
--

DROP TABLE IF EXISTS `protocols`;
CREATE TABLE IF NOT EXISTS `protocols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` mediumint(9) NOT NULL,
  `exercise_id` mediumint(9) NOT NULL,
  `active` smallint(1) NOT NULL,
  `mandatory` smallint(1) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reps` tinyint(2) unsigned NOT NULL,
  `hold_time` mediumint(3) unsigned NOT NULL,
  `weight` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ClientID` (`patient_id`),
  KEY `CExID` (`exercise_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=46582 ;

--
-- Dumping data for table `protocols`
--

INSERT INTO `protocols` (`id`, `patient_id`, `exercise_id`, `active`, `mandatory`, `start_date`, `end_date`, `reps`, `hold_time`, `weight`) VALUES
(1, 2, 27, 1, 0, '2012-05-10', '2014-03-13', 0, 0, 0),
(2, 2, 2, 1, 1, '2012-05-10', '2014-03-13', 0, 0, 0),
(6, 2, 25, 1, 0, '2012-05-10', '2013-11-04', 0, 0, 0),
(7, 2, 24, 0, 0, '2012-05-10', '2014-03-13', 0, 0, 0),
(8, 2, 28, 0, 0, '2012-05-10', '2014-03-13', 0, 0, 0),
(18, 2, 2, 0, 1, '2012-05-10', '2014-05-20', 0, 0, 0),
(31, 3, 2, 1, 1, '2012-05-10', '2014-05-02', 0, 0, 0),
(32, 3, 4, 1, 1, '2012-05-10', '2014-05-02', 0, 0, 0),
(33, 3, 1, 1, 1, '2012-05-10', '2014-05-02', 0, 0, 0),
(34, 4, 26, 1, 0, '2012-05-10', '2014-03-01', 0, 0, 0),
(35, 4, 27, 1, 0, '2012-05-10', '2014-03-01', 0, 0, 0),
(36, 4, 28, 1, 0, '2012-05-10', '2014-03-01', 0, 0, 0),
(37, 4, 29, 1, 0, '2012-05-10', '2014-03-01', 0, 0, 0),
(38, 4, 2, 1, 1, '2012-05-10', '2014-03-01', 0, 0, 0),
(39, 4, 4, 1, 1, '2012-05-10', '2014-03-01', 0, 0, 0),
(40, 4, 1, 1, 1, '2012-05-10', '2014-03-01', 0, 0, 0),
(41, 5, 26, 1, 0, '2012-04-18', '2014-03-16', 0, 0, 0),
(42, 5, 27, 1, 0, '2012-04-18', '2014-03-16', 0, 0, 0),
(43, 5, 28, 1, 0, '2012-04-18', '2014-03-16', 0, 0, 0),
(44, 5, 29, 0, 0, '2012-04-18', '2014-03-16', 0, 0, 0),
(45, 5, 2, 1, 1, '2012-04-18', '2014-03-16', 0, 0, 0),
(46, 5, 4, 1, 1, '2012-04-18', '2014-03-16', 0, 0, 0),
(47, 5, 1, 1, 1, '2012-04-18', '2014-03-16', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
CREATE TABLE IF NOT EXISTS `providers` (
  `user_id` int(11) NOT NULL,
  `npin` varchar(30) COLLATE utf8_bin NOT NULL,
  `business_name` varchar(60) COLLATE utf8_bin NOT NULL,
  `business_address` varchar(255) COLLATE utf8_bin NOT NULL,
  `phone_num` varchar(10) COLLATE utf8_bin NOT NULL,
  `cell_num` varchar(9) COLLATE utf8_bin DEFAULT NULL,
  `registration_date` date NOT NULL,
  `processed_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`user_id`, `npin`, `business_name`, `business_address`, `phone_num`, `cell_num`, `registration_date`, `processed_date`) VALUES
(1, '123456', 'MedHab', '26 Amberwood Drive', '3175126455', NULL, '2013-12-06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `romcalculations`
--

DROP TABLE IF EXISTS `romcalculations`;
CREATE TABLE IF NOT EXISTS `romcalculations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `average` double DEFAULT NULL,
  `minimum` decimal(6,0) DEFAULT NULL,
  `maximum` double DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `reps` int(11) DEFAULT NULL,
  `rep_average` double DEFAULT NULL,
  `rep_max` double DEFAULT NULL,
  `rep_min` double DEFAULT NULL,
  `force1` double DEFAULT NULL,
  `force2` double DEFAULT NULL,
  `force3` double DEFAULT NULL,
  `force4` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=734 ;

-- --------------------------------------------------------

--
-- Table structure for table `serial`
--

DROP TABLE IF EXISTS `serial`;
CREATE TABLE IF NOT EXISTS `serial` (
  `serial_number` bigint(12) NOT NULL,
  `macl` varchar(12) COLLATE utf8_bin NOT NULL,
  `macr` varchar(12) COLLATE utf8_bin NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT 'id of employee that requested the sn be generated',
  `patient_id` mediumint(9) NOT NULL COMMENT 'patient to which the sn is assigned',
  PRIMARY KEY (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('0ccf52a012ede2eecac902ab95ab5d46', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', 1389274180, 'a:9:{s:9:"user_data";s:0:"";s:9:"last_page";s:19:"provider/dashboards";s:9:"logged_in";b:1;s:7:"user_id";s:1:"1";s:9:"user_type";s:1:"1";s:10:"first_name";s:7:"Matthew";s:9:"last_name";s:8:"Stephens";s:10:"patient_id";s:1:"2";s:11:"captchaWord";s:8:"LDuKEuvJ";}'),
('e46ddcebb50a83f7aa8c2badecd163d0', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', 1389268386, 'a:8:{s:9:"user_data";s:0:"";s:9:"last_page";s:19:"provider/dashboards";s:9:"logged_in";b:1;s:7:"user_id";s:1:"1";s:9:"user_type";s:1:"1";s:10:"first_name";s:7:"Matthew";s:9:"last_name";s:8:"Stephens";s:10:"patient_id";s:1:"3";}');

-- --------------------------------------------------------

--
-- Table structure for table `standard_emails`
--

DROP TABLE IF EXISTS `standard_emails`;
CREATE TABLE IF NOT EXISTS `standard_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET latin1 NOT NULL,
  `subject` varchar(128) COLLATE utf8_bin NOT NULL,
  `content` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `stepcalculations`
--

DROP TABLE IF EXISTS `stepcalculations`;
CREATE TABLE IF NOT EXISTS `stepcalculations` (
  `step_num` int(11) DEFAULT NULL,
  `gait_id` int(11) DEFAULT NULL,
  `stride_dist` double DEFAULT NULL,
  `swing_time` double DEFAULT NULL,
  `stance_time` double DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=193 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `first_name` char(30) COLLATE utf8_bin NOT NULL,
  `last_name` char(30) COLLATE utf8_bin NOT NULL,
  `password` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `debug_password` varchar(12) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `type`, `first_name`, `last_name`, `password`, `email`, `active`, `debug_password`) VALUES
(1, 1, 'Matthew', 'Stephens', 'nHjP9YkNBj60wIdVP9fehYHzSiA41PDH', 'mcstephens@gmail.com', 1, ''),
(2, 2, 'Billy', 'Bob', 'X+OXozGyRFr3OwOjOSgkewQ0mB2Y8h+T', 'billy@bob.com', 1, 'wOm6Tviaz8Df'),
(3, 2, 'Jane', 'Doe', 'bpNu0kWhiTVf95z/ChOon2XtjdlSzFKJ', 'jane@doe.com', 1, 'wkUMr7OYTVkH'),
(4, 2, 'Ada', 'Lovelace', 'IghR8qeWYXK3W23NKD7FhZLQKxlCFwEg', 'ada@lovelace.com', 1, 'zSYrMvimgIWR'),
(5, 2, 'Linus', 'Torvolds', '1342EQqLOq92jlSP7tjdzpjTrtWbR0dC', 'linus@torvolds.com', 1, 'iKsSzf8jPpwT'),
(6, 2, 'Herman', 'Hollerith', 'qrLA4f1+jCCTmEeEnfCs7I+xEzDSUjm7', 'herman@hollerith.com', 0, 'UtMflLNNCttZ');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `type`) VALUES
(2, 'patient'),
(1, 'provider');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
