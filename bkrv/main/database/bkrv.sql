-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 12, 2021 at 05:08 PM
-- Server version: 5.7.32-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bkrv`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add restaurant', 6, 'add_restaurant'),
(22, 'Can change restaurant', 6, 'change_restaurant'),
(23, 'Can delete restaurant', 6, 'delete_restaurant'),
(24, 'Can view restaurant', 6, 'view_restaurant'),
(25, 'Can add review', 7, 'add_review'),
(26, 'Can change review', 7, 'change_review'),
(27, 'Can delete review', 7, 'delete_review'),
(28, 'Can view review', 7, 'view_review'),
(29, 'Can add user', 8, 'add_customuser'),
(30, 'Can change user', 8, 'change_customuser'),
(31, 'Can delete user', 8, 'delete_customuser'),
(32, 'Can view user', 8, 'view_customuser'),
(33, 'Can add review item', 9, 'add_reviewitem'),
(34, 'Can change review item', 9, 'change_reviewitem'),
(35, 'Can delete review item', 9, 'delete_reviewitem'),
(36, 'Can view review item', 9, 'view_reviewitem'),
(37, 'Can add review comment', 10, 'add_reviewcomment'),
(38, 'Can change review comment', 10, 'change_reviewcomment'),
(39, 'Can delete review comment', 10, 'delete_reviewcomment'),
(40, 'Can view review comment', 10, 'view_reviewcomment'),
(41, 'Can add vote', 11, 'add_vote'),
(42, 'Can change vote', 11, 'change_vote'),
(43, 'Can delete vote', 11, 'delete_vote'),
(44, 'Can view vote', 11, 'view_vote'),
(45, 'Can add restaurant item', 9, 'add_restaurantitem'),
(46, 'Can change restaurant item', 9, 'change_restaurantitem'),
(47, 'Can delete restaurant item', 9, 'delete_restaurantitem'),
(48, 'Can view restaurant item', 9, 'view_restaurantitem'),
(49, 'Can add review image', 12, 'add_reviewimage'),
(50, 'Can change review image', 12, 'change_reviewimage'),
(51, 'Can delete review image', 12, 'delete_reviewimage'),
(52, 'Can view review image', 12, 'view_reviewimage');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(18, '2019-06-26 17:54:44.890093', '3', 'Review object (3)', 1, '[{\"added\": {}}]', 7, 6),
(19, '2019-06-26 17:54:55.170288', '4', 'Review object (4)', 1, '[{\"added\": {}}]', 7, 6),
(20, '2019-06-26 17:55:13.288075', '3', 'Review object (3)', 2, '[]', 7, 6),
(21, '2019-06-26 17:55:16.144603', '4', 'Review object (4)', 2, '[]', 7, 6),
(22, '2019-06-28 17:00:02.712549', '5', 'browser restaurant', 3, '', 6, 6),
(23, '2019-06-28 17:00:02.716720', '4', 'browser restaurant', 3, '', 6, 6),
(24, '2019-06-28 17:00:02.719775', '3', 'browser restaurant', 3, '', 6, 6),
(25, '2019-06-28 17:54:28.619794', '6', 'browser restaurant', 3, '', 6, 6),
(26, '2019-06-28 18:08:09.303092', '7', 'browser restaurant', 3, '', 6, 6),
(27, '2019-06-29 08:15:49.961465', '10', 'Test Restaurant', 3, '', 6, 6),
(28, '2019-06-29 08:15:49.965825', '9', 'browser restaurant1', 3, '', 6, 6),
(29, '2019-06-29 09:06:59.478256', '9', 'some test', 3, '', 9, 6),
(30, '2019-06-29 09:07:14.692661', '11', 'browser restaurant', 3, '', 6, 6),
(31, '2019-06-29 14:25:33.259911', '15', 'browser restaurant', 3, '', 6, 6),
(32, '2019-06-29 14:39:18.571853', '17', 'browser restaurant', 3, '', 6, 6),
(33, '2019-06-29 14:39:18.574209', '16', 'browser restaurant', 3, '', 6, 6),
(34, '2019-06-30 12:53:35.980066', '20', 'test', 1, '[{\"added\": {}}]', 9, 6),
(35, '2019-07-01 17:52:29.153810', '1', 'UP', 3, '', 11, 6),
(36, '2019-07-14 03:09:13.458732', '21', 'Spam test', 3, '', 6, 6),
(37, '2019-07-14 03:09:13.461586', '20', 'Spam test', 3, '', 6, 6),
(38, '2019-07-14 03:09:13.462883', '19', 'Spam test', 3, '', 6, 6),
(39, '2019-07-14 03:09:13.464777', '18', 'browser restaurant', 3, '', 6, 6),
(40, '2019-07-14 03:09:13.467897', '14', 'Template test', 3, '', 6, 6),
(41, '2019-07-14 03:09:13.469209', '13', 'browser restaurant', 3, '', 6, 6),
(42, '2019-07-14 03:09:13.470385', '12', 'image restaurant', 3, '', 6, 6),
(43, '2019-07-14 03:09:13.472403', '8', 'browser restaurant', 3, '', 6, 6),
(44, '2019-07-14 03:09:13.473643', '2', 'Duc\'s Restaurant', 3, '', 6, 6),
(45, '2019-07-14 03:09:13.474882', '1', 'Test Restaurant', 3, '', 6, 6),
(46, '2020-01-28 14:54:53.844057', '25', 'Spam test', 3, '', 6, 6),
(47, '2020-01-28 14:54:53.849263', '24', 'Eterna Primavera Bakery', 3, '', 6, 6),
(48, '2020-01-28 14:54:53.852012', '23', 'Eterna Primavera Bakery', 3, '', 6, 6),
(49, '2020-01-28 14:54:53.853863', '22', 'Eterna Primavera Bakery', 3, '', 6, 6),
(50, '2020-01-28 17:00:55.554738', '27', 'Bulgara', 2, '[{\"changed\": {\"fields\": [\"address\"]}}]', 6, 6),
(51, '2020-01-28 17:09:38.483423', '27', 'ReviewImage object (27)', 2, '[]', 12, 6),
(52, '2020-01-28 17:09:44.299720', '26', 'ReviewImage object (26)', 2, '[]', 12, 6),
(53, '2020-01-28 17:34:43.732975', '26', 'ReviewImage object (26)', 2, '[]', 12, 6),
(54, '2020-01-28 17:34:49.021280', '27', 'ReviewImage object (27)', 2, '[]', 12, 6),
(55, '2020-01-28 17:36:48.738746', '27', 'ReviewImage object (27)', 2, '[]', 12, 6),
(56, '2020-01-28 17:36:54.496524', '26', 'ReviewImage object (26)', 2, '[]', 12, 6);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(8, 'main', 'customuser'),
(6, 'main', 'restaurant'),
(9, 'main', 'restaurantitem'),
(7, 'main', 'review'),
(10, 'main', 'reviewcomment'),
(12, 'main', 'reviewimage'),
(11, 'main', 'vote'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-06-22 10:37:03.269245'),
(2, 'contenttypes', '0002_remove_content_type_name', '2019-06-22 10:37:03.339096'),
(3, 'auth', '0001_initial', '2019-06-22 10:37:03.428120'),
(4, 'auth', '0002_alter_permission_name_max_length', '2019-06-22 10:37:03.568981'),
(5, 'auth', '0003_alter_user_email_max_length', '2019-06-22 10:37:03.584146'),
(6, 'auth', '0004_alter_user_username_opts', '2019-06-22 10:37:03.598659'),
(7, 'auth', '0005_alter_user_last_login_null', '2019-06-22 10:37:03.612984'),
(8, 'auth', '0006_require_contenttypes_0002', '2019-06-22 10:37:03.617121'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2019-06-22 10:37:03.630561'),
(10, 'auth', '0008_alter_user_username_max_length', '2019-06-22 10:37:03.639191'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2019-06-22 10:37:03.646259'),
(12, 'auth', '0010_alter_group_name_max_length', '2019-06-22 10:37:03.655623'),
(13, 'auth', '0011_update_proxy_permissions', '2019-06-22 10:37:03.661855'),
(14, 'main', '0001_initial', '2019-06-22 10:37:03.758417'),
(15, 'admin', '0001_initial', '2019-06-22 10:37:03.996692'),
(16, 'admin', '0002_logentry_remove_auto_add', '2019-06-22 10:37:04.081476'),
(17, 'admin', '0003_logentry_add_action_flag_choices', '2019-06-22 10:37:04.096616'),
(18, 'sessions', '0001_initial', '2019-06-22 10:37:04.117109'),
(19, 'main', '0002_review_user', '2019-06-22 11:02:12.136074'),
(20, 'main', '0003_auto_20190622_1109', '2019-06-22 11:09:47.096130'),
(21, 'main', '0004_auto_20190622_1114', '2019-06-22 11:14:28.389884'),
(22, 'main', '0005_review_review', '2019-06-22 11:16:31.592978'),
(23, 'main', '0006_auto_20190622_1119', '2019-06-22 11:19:03.276998'),
(24, 'main', '0002_auto_20190622_1138', '2019-06-22 11:38:55.783917'),
(25, 'main', '0003_auto_20190622_1139', '2019-06-22 11:39:11.592015'),
(26, 'main', '0004_auto_20190622_1139', '2019-06-22 11:39:18.607615'),
(27, 'main', '0005_auto_20190622_1139', '2019-06-22 11:39:33.742986'),
(28, 'main', '0006_auto_20190622_1139', '2019-06-22 11:39:39.088822'),
(29, 'main', '0007_auto_20190622_1140', '2019-06-22 11:40:10.051234'),
(30, 'main', '0008_auto_20190622_1140', '2019-06-22 11:40:31.624268'),
(31, 'main', '0009_auto_20190622_1140', '2019-06-22 11:40:53.054709'),
(32, 'main', '0010_auto_20190622_1216', '2019-06-22 12:16:48.174929'),
(33, 'main', '0011_auto_20190622_1300', '2019-06-22 13:00:06.463653'),
(34, 'main', '0012_auto_20190622_1300', '2019-06-22 13:00:36.472123'),
(35, 'main', '0013_auto_20190622_1303', '2019-06-22 13:03:06.028482'),
(36, 'main', '0014_reviewitem', '2019-06-22 13:29:16.527808'),
(37, 'main', '0015_reviewcomment_vote', '2019-06-22 13:36:56.217807'),
(38, 'main', '0016_auto_20190626_0852', '2019-06-26 08:52:58.480013'),
(39, 'main', '0017_auto_20190626_0915', '2019-06-26 09:16:00.410927'),
(40, 'main', '0018_customuser_picture', '2019-06-26 17:14:30.171203'),
(41, 'main', '0019_auto_20190626_1735', '2019-06-26 17:35:05.395533'),
(42, 'main', '0020_review_rating', '2019-06-26 17:49:52.066315'),
(43, 'main', '0021_reviewimage', '2019-06-29 08:09:01.296007'),
(44, 'main', '0022_auto_20190629_1241', '2019-06-29 12:41:55.167177'),
(45, 'main', '0023_auto_20190701_1534', '2019-07-01 15:34:18.283001'),
(46, 'main', '0024_auto_20190701_1542', '2019-07-01 15:42:24.928910'),
(47, 'main', '0025_auto_20190912_0046', '2020-01-28 14:04:06.255426');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0ko0i4keid0box0rpkpxjjy3ni4iltnq', 'MjJhOGY1OWIzNjY0ZmZjOWI3ZGM0YThlNTUwZGRiZmEwOTY0ZWU5Njp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZTUzZDZlMmJmMmZmZTJiZDA5MGU0YTBhNDIxNjg3NGY4OTM0MmU1In0=', '2019-07-28 03:09:02.067145'),
('6inpn0og2hh0sncsh5in7242vsb5kxhv', 'YzhjMTg4ZmJkNWI2N2Y4MjUzNTUzM2VlODk2N2NlZTIzNjg0NjFkMjp7fQ==', '2019-07-07 14:27:29.643301'),
('7pyzi3vc4dz0neno0kxnmb3lvk1bq13h', 'MjJhOGY1OWIzNjY0ZmZjOWI3ZGM0YThlNTUwZGRiZmEwOTY0ZWU5Njp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZTUzZDZlMmJmMmZmZTJiZDA5MGU0YTBhNDIxNjg3NGY4OTM0MmU1In0=', '2020-02-12 05:46:19.115439'),
('s21ghcch033v5qgh9u1ygop4bhb90ywg', 'MjJhOGY1OWIzNjY0ZmZjOWI3ZGM0YThlNTUwZGRiZmEwOTY0ZWU5Njp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZTUzZDZlMmJmMmZmZTJiZDA5MGU0YTBhNDIxNjg3NGY4OTM0MmU1In0=', '2020-02-11 15:39:30.408341');

-- --------------------------------------------------------

--
-- Table structure for table `main_customuser`
--

CREATE TABLE `main_customuser` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_customuser`
--

INSERT INTO `main_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `picture`) VALUES
(6, 'pbkdf2_sha256$150000$ozLPFkgTexP9$5MNynteZEugVYin9UA5N3GOOAx/kUn8b/THBOkukf8M=', '2020-01-29 05:46:19.112269', 1, 'vuduc153', '', '', 'none@gmail.com', 1, 1, '2019-06-26 17:40:17.995468', 'users/default_avatar.jpg'),
(7, 'pbkdf2_sha256$150000$ONOZBDk5GOSy$2dw05YuclyfSlQFw8mPqt34yciTRj2da/vg8a+6fgFk=', '2019-06-26 17:41:15.557725', 0, 'sad1503', '', '', 'vuductran153@gmail.com', 0, 1, '2019-06-26 17:41:15.314229', 'users/default_avatar.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `main_customuser_groups`
--

CREATE TABLE `main_customuser_groups` (
  `id` int(11) NOT NULL,
  `customuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `main_customuser_user_permissions`
--

CREATE TABLE `main_customuser_user_permissions` (
  `id` int(11) NOT NULL,
  `customuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `main_restaurant`
--

CREATE TABLE `main_restaurant` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `type` varchar(30) NOT NULL,
  `time_close` time(6) NOT NULL,
  `time_open` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_restaurant`
--

INSERT INTO `main_restaurant` (`id`, `name`, `address`, `type`, `time_close`, `time_open`) VALUES
(26, 'Ristobar', '2300 Chestnut St  San Francisco, CA 94123', 'Restaurant', '22:00:00.000000', '05:00:00.000000'),
(27, 'Bulgara', '279 Columbus San Francisco, CA 94133', 'Restaurant', '22:00:00.000000', '11:30:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `main_restaurantitem`
--

CREATE TABLE `main_restaurantitem` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `restaurant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_restaurantitem`
--

INSERT INTO `main_restaurantitem` (`id`, `name`, `price`, `restaurant_id`) VALUES
(29, 'Grilled Calamari', 10, 26),
(30, 'Rotisserie Chicken combo', 12, 27);

-- --------------------------------------------------------

--
-- Table structure for table `main_review`
--

CREATE TABLE `main_review` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review` longtext NOT NULL,
  `rating` int(11) NOT NULL,
  `downvotes` int(11) NOT NULL,
  `upvotes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_review`
--

INSERT INTO `main_review` (`id`, `restaurant_id`, `user_id`, `review`, `rating`, `downvotes`, `upvotes`) VALUES
(26, 26, 6, 'If you haven\'t been to this new (one month) restaurant it\'s one you should put on your \"absolutely gotta go\" list before it becomes too discovered and too crowded, which I\'m guessing won\'t take long.\r\n\r\nDelicately flavored food, not overly large portions, and superb service. The grilled calamari was very fresh with a really nice salad accompaniment. The raviolini, just scrumptious.\r\n\r\nThe rest of the menu looks fantastic too and we\'ll actually go back this week to try more dishes.\r\n\r\nSmall, but adequate wine list and a bartender who certainly looks like she knows what she\'s doing. Will try a cocktail next time.', 10, 0, 0),
(27, 27, 6, 'I called for a pick-up order the order day and had a great experience overall.\r\n\r\nI ordered the Half Rotisserie Chicken combo and chose to get sweet potato fries as a side. I was told it would be ready in about 20 minutes.\r\n\r\nGot there, waited a few minutes and received my order. Their rotisserie is the best I\'ve had, I\'m a fan! The meat was juicy all-around and the skin was flavorful and crisp! Sweet potato fries were good too.\r\n\r\nWorth every dollar, I would definitely be back!', 8, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `main_reviewcomment`
--

CREATE TABLE `main_reviewcomment` (
  `id` int(11) NOT NULL,
  `summary` longtext NOT NULL,
  `comment` longtext NOT NULL,
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `main_reviewimage`
--

CREATE TABLE `main_reviewimage` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `review_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_reviewimage`
--

INSERT INTO `main_reviewimage` (`id`, `image`, `review_id`) VALUES
(26, 'reviews/26/o.jpg', 26),
(27, 'reviews/27/j.jpg', 27);

-- --------------------------------------------------------

--
-- Table structure for table `main_vote`
--

CREATE TABLE `main_vote` (
  `id` int(11) NOT NULL,
  `vote` varchar(5) NOT NULL,
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_main_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `main_customuser`
--
ALTER TABLE `main_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `main_customuser_groups`
--
ALTER TABLE `main_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `main_customuser_groups_customuser_id_group_id_8a5023dd_uniq` (`customuser_id`,`group_id`),
  ADD KEY `main_customuser_groups_group_id_8149f607_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `main_customuser_user_permissions`
--
ALTER TABLE `main_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `main_customuser_user_per_customuser_id_permission_06a652d8_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `main_customuser_user_permission_id_38e6f657_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `main_restaurant`
--
ALTER TABLE `main_restaurant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_restaurantitem`
--
ALTER TABLE `main_restaurantitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_restaurantitem_restaurant_id_bd50f80f_fk_main_restaurant_id` (`restaurant_id`);

--
-- Indexes for table `main_review`
--
ALTER TABLE `main_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_review_restaurant_id_6b6dae0f_fk_main_restaurant_id` (`restaurant_id`),
  ADD KEY `main_review_user_id_ee71ed52_fk_main_customuser_id` (`user_id`);

--
-- Indexes for table `main_reviewcomment`
--
ALTER TABLE `main_reviewcomment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_reviewcomment_review_id_4f603307_fk_main_review_id` (`review_id`),
  ADD KEY `main_reviewcomment_user_id_afd0f90f_fk_main_customuser_id` (`user_id`);

--
-- Indexes for table `main_reviewimage`
--
ALTER TABLE `main_reviewimage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_reviewimage_review_id_12bc3baa_fk_main_review_id` (`review_id`);

--
-- Indexes for table `main_vote`
--
ALTER TABLE `main_vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_vote_review_id_e7f6a941_fk_main_review_id` (`review_id`),
  ADD KEY `main_vote_user_id_95515d7a_fk_main_customuser_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `main_customuser`
--
ALTER TABLE `main_customuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `main_customuser_groups`
--
ALTER TABLE `main_customuser_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `main_customuser_user_permissions`
--
ALTER TABLE `main_customuser_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `main_restaurant`
--
ALTER TABLE `main_restaurant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `main_restaurantitem`
--
ALTER TABLE `main_restaurantitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `main_review`
--
ALTER TABLE `main_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `main_reviewcomment`
--
ALTER TABLE `main_reviewcomment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `main_reviewimage`
--
ALTER TABLE `main_reviewimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `main_vote`
--
ALTER TABLE `main_vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
