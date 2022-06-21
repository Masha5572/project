-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 14 2022 г., 10:11
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `diplom`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `commentable_id` int NOT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(24, 4, 'description', 'text_area', 'Description', 1, 1, 1, 1, 1, 1, '{}', 3),
(25, 4, 'img', 'image', 'Img', 0, 1, 1, 1, 1, 1, '{}', 4),
(26, 4, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(29, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(30, 5, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(31, 5, 'description', 'text_area', 'Description', 1, 1, 1, 1, 1, 1, '{}', 3),
(32, 5, 'img', 'image', 'Img', 0, 1, 1, 1, 1, 1, '{}', 4),
(33, 5, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{}', 5),
(34, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(35, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(36, 4, 'Size', 'text', 'Size', 1, 1, 1, 1, 1, 1, '{}', 6),
(37, 4, 'Color', 'text', 'Color', 1, 1, 1, 1, 1, 1, '{}', 7),
(38, 4, 'categori_id', 'select_dropdown', 'Categori Id', 1, 1, 1, 1, 1, 1, '{\"default\":\"option1\",\"options\":{\"yubka\":\"\\u044e\\u0431\\u043a\\u0430\",\"kofta\":\"\\u041a\\u043e\\u0444\\u0442\\u0430\",\"kostyum\":\"\\u041a\\u043e\\u0441\\u0442\\u044e\\u043c\",\"plat\\u044ce\":\"\\u041f\\u043b\\u0430\\u0442\\u044c\\u0435\",\"dzhinsy\":\"\\u0414\\u0436\\u0438\\u043d\\u0441\\u044b\",\"futbolka\":\"\\u0424\\u0443\\u0442\\u0431\\u043e\\u043b\\u043a\\u0430\",\"top\":\"\\u0422\\u043e\\u043f\",\"zhiletka\":\"\\u0416\\u0438\\u043b\\u0435\\u0442\\u043a\\u0430\",\"bodi\":\"\\u0411\\u043e\\u0434\\u0438\",\"kurtka\":\"\\u041a\\u0443\\u0440\\u0442\\u043a\\u0430\",\"bluzka\":\"\\u0411\\u043b\\u0443\\u0437\\u043a\\u0430\"}}', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-03-31 04:14:12', '2022-03-31 04:14:12'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-03-31 04:14:12', '2022-03-31 04:14:12'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-03-31 04:14:12', '2022-03-31 04:14:12'),
(4, 'products', 'products', 'Product', 'Products', NULL, 'App\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-03-31 07:30:19', '2022-05-21 06:20:07'),
(5, 'productmen', 'productmen', 'Productman', 'Productmen', NULL, 'App\\Productman', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-04-03 04:45:01', '2022-04-03 04:45:01');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-03-31 04:14:12', '2022-03-31 04:14:12');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-03-31 04:14:12', '2022-03-31 04:14:12', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 7, '2022-03-31 04:14:12', '2022-05-21 04:37:59', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2022-03-31 04:14:12', '2022-03-31 04:14:12', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2022-03-31 04:14:12', '2022-03-31 04:14:12', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2022-03-31 04:14:12', '2022-05-21 04:37:59', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-03-31 04:14:12', '2022-03-31 09:04:28', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2022-03-31 04:14:12', '2022-03-31 09:04:28', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-03-31 04:14:12', '2022-03-31 09:04:28', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-03-31 04:14:12', '2022-03-31 09:04:28', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2022-03-31 04:14:12', '2022-05-21 04:37:59', 'voyager.settings.index', NULL),
(11, 1, 'Products', '', '_self', 'voyager-basket', '#000000', NULL, 4, '2022-03-31 07:30:20', '2022-03-31 09:08:39', 'voyager.products.index', 'null'),
(12, 1, 'Productmen', '', '_self', 'voyager-shop', '#000000', NULL, 5, '2022-04-03 04:45:01', '2022-04-03 04:55:24', 'voyager.productmen.index', 'null');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_01_01_000000_add_voyager_user_fields', 2),
(6, '2016_01_01_000000_create_data_types_table', 2),
(7, '2016_05_19_173453_create_menu_table', 2),
(8, '2016_10_21_190000_create_roles_table', 2),
(9, '2016_10_21_190000_create_settings_table', 2),
(10, '2016_11_30_135954_create_permission_table', 2),
(11, '2016_11_30_141208_create_permission_role_table', 2),
(12, '2016_12_26_201236_data_types__add__server_side', 2),
(13, '2017_01_13_000000_add_route_to_menu_items_table', 2),
(14, '2017_01_14_005015_create_translations_table', 2),
(15, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2),
(16, '2017_03_06_000000_add_controller_to_data_types_table', 2),
(17, '2017_04_21_000000_add_order_to_data_rows_table', 2),
(18, '2017_07_05_210000_add_policyname_to_data_types_table', 2),
(19, '2017_08_05_000000_add_group_to_settings_table', 2),
(20, '2017_11_26_013050_add_user_role_relationship', 2),
(21, '2017_11_26_015000_create_user_roles_table', 2),
(22, '2018_03_11_000000_add_user_settings', 2),
(23, '2018_03_14_000000_add_details_to_data_types_table', 2),
(24, '2018_03_16_000000_make_settings_value_nullable', 2),
(26, '2022_05_14_055913_orders', 3),
(27, '2022_05_19_123500_create_comment_table', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `cart_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_sum` double(8,2) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `cart_data`, `total_sum`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 5, 's:2401:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:4:{i:1;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:1;s:4:\"name\";s:41:\"ПЛАТЬЕ МИНИ С V-ВЫРЕЗОМ\";s:5:\"price\";i:4999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\d3487UxKI8XRMJs98XF7.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:8;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:8;s:4:\"name\";s:8:\"Юбка\";s:5:\"price\";i:7799;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\CLhweJi2jo63q6WXxC99.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:7;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:7;s:4:\"name\";s:12:\"Костюм\";s:5:\"price\";i:14990;s:8:\"quantity\";i:2;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\goar6eUho1i1VWovu7fE.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 46777.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-14 02:38:41', '2022-05-14 02:38:41'),
(2, 5, 's:2401:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:4:{i:1;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:1;s:4:\"name\";s:41:\"ПЛАТЬЕ МИНИ С V-ВЫРЕЗОМ\";s:5:\"price\";i:4999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\d3487UxKI8XRMJs98XF7.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:8;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:8;s:4:\"name\";s:8:\"Юбка\";s:5:\"price\";i:7799;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\CLhweJi2jo63q6WXxC99.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:7;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:7;s:4:\"name\";s:12:\"Костюм\";s:5:\"price\";i:14990;s:8:\"quantity\";i:2;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\goar6eUho1i1VWovu7fE.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 46777.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-14 02:39:27', '2022-05-14 02:39:27'),
(3, 5, 's:703:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{i:3;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:3;s:4:\"name\";s:51:\"БЛУЗКА С ОБЪЕМНЫМИ РУКАВАМИ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\HJzs4qpjrys9Uz6ePN5y.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 2999.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-14 05:23:26', '2022-05-14 05:23:26'),
(4, 8, 's:1259:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:2:{i:9;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:9;s:4:\"name\";s:10:\"Кофта\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:42:\"products\\May2022\\1PLlSQ2Wh7e2MzsaKu9G.jpeg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:3;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:3;s:4:\"name\";s:51:\"БЛУЗКА С ОБЪЕМНЫМИ РУКАВАМИ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\HJzs4qpjrys9Uz6ePN5y.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 6998.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-18 00:17:45', '2022-05-18 00:17:45'),
(5, 6, 's:1827:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:3:{i:5;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:5;s:4:\"name\";s:22:\"Свитшот GARDONE\";s:5:\"price\";i:30600;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:9;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:9;s:4:\"name\";s:10:\"Кофта\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:42:\"products\\May2022\\1PLlSQ2Wh7e2MzsaKu9G.jpeg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:2;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:2;s:4:\"name\";s:51:\"ТРИКОТАЖНЫЙ ТОП НА БРЕТЕЛЯХ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\miQl03Mj9G6vMR2s8iFK.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 37598.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-18 00:23:18', '2022-05-18 00:23:18'),
(6, 6, 's:665:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{i:10;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:10;s:4:\"name\";s:12:\"Куртка\";s:5:\"price\";i:70100;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\0URpdIfsw8xlcOcdFOwc.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 70100.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-18 00:40:55', '2022-05-18 00:40:55'),
(7, 6, 's:663:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{i:7;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:7;s:4:\"name\";s:12:\"Костюм\";s:5:\"price\";i:14990;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\goar6eUho1i1VWovu7fE.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 14990.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-18 00:54:08', '2022-05-18 00:54:08'),
(8, 6, 's:703:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{i:3;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:3;s:4:\"name\";s:51:\"БЛУЗКА С ОБЪЕМНЫМИ РУКАВАМИ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\HJzs4qpjrys9Uz6ePN5y.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 2999.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-18 01:15:00', '2022-05-18 01:15:00'),
(9, 6, 's:665:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{i:10;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:10;s:4:\"name\";s:12:\"Куртка\";s:5:\"price\";i:70100;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\0URpdIfsw8xlcOcdFOwc.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 70100.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-18 01:57:29', '2022-05-18 01:57:29'),
(10, 6, 's:703:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 3999.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-18 06:43:20', '2022-05-18 06:43:20'),
(11, 4, 's:1869:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:3:{i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:5;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:5;s:4:\"name\";s:22:\"Свитшот GARDONE\";s:5:\"price\";i:30600;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:2;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:2;s:4:\"name\";s:51:\"ТРИКОТАЖНЫЙ ТОП НА БРЕТЕЛЯХ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\miQl03Mj9G6vMR2s8iFK.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 37598.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-19 00:19:01', '2022-05-19 00:19:01'),
(12, 4, 's:1869:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:3:{i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:5;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:5;s:4:\"name\";s:22:\"Свитшот GARDONE\";s:5:\"price\";i:30600;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:2;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:2;s:4:\"name\";s:51:\"ТРИКОТАЖНЫЙ ТОП НА БРЕТЕЛЯХ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\miQl03Mj9G6vMR2s8iFK.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 37598.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-19 00:19:25', '2022-05-19 00:19:25'),
(13, 4, 's:1869:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:3:{i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:5;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:5;s:4:\"name\";s:22:\"Свитшот GARDONE\";s:5:\"price\";i:30600;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:2;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:2;s:4:\"name\";s:51:\"ТРИКОТАЖНЫЙ ТОП НА БРЕТЕЛЯХ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\miQl03Mj9G6vMR2s8iFK.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 37598.00, 'ул Федюнинского, д 62Тюмень', '89222687921', '2022-05-19 00:27:36', '2022-05-19 00:27:36'),
(14, 4, 's:1869:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:3:{i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:5;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:5;s:4:\"name\";s:22:\"Свитшот GARDONE\";s:5:\"price\";i:30600;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:2;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:2;s:4:\"name\";s:51:\"ТРИКОТАЖНЫЙ ТОП НА БРЕТЕЛЯХ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\miQl03Mj9G6vMR2s8iFK.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 37598.00, 'ул Федюнинского, д 62Тюмень', '89222687921', '2022-05-19 00:37:11', '2022-05-19 00:37:11'),
(15, 4, 's:1869:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:3:{i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:2;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:2;s:4:\"name\";s:51:\"ТРИКОТАЖНЫЙ ТОП НА БРЕТЕЛЯХ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\miQl03Mj9G6vMR2s8iFK.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:5;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:5;s:4:\"name\";s:22:\"Свитшот GARDONE\";s:5:\"price\";i:30600;s:8:\"quantity\";i:2;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 68198.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-19 00:46:45', '2022-05-19 00:46:45'),
(16, 4, 's:673:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{i:5;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:5;s:4:\"name\";s:22:\"Свитшот GARDONE\";s:5:\"price\";i:30600;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 30600.00, 'ул Федюнинского, д 62Тюмень', '89222687921', '2022-05-19 01:16:03', '2022-05-19 01:16:03'),
(17, 4, 's:673:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{i:5;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:5;s:4:\"name\";s:22:\"Свитшот GARDONE\";s:5:\"price\";i:30600;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 30600.00, 'ул Федюнинского, д 62Тюмень', '89222687921', '2022-05-19 02:44:57', '2022-05-19 02:44:57'),
(18, 4, 's:1211:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:2:{i:8;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:8;s:4:\"name\";s:8:\"Юбка\";s:5:\"price\";i:7799;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\CLhweJi2jo63q6WXxC99.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:11;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:11;s:4:\"name\";s:8:\"Боди\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\EYYdyZfkzOfnrXszqfZi.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 11798.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-19 02:45:50', '2022-05-19 02:45:50'),
(19, 4, 's:1869:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:3:{i:5;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:5;s:4:\"name\";s:22:\"Свитшот GARDONE\";s:5:\"price\";i:30600;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:2;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:2;s:4:\"name\";s:51:\"ТРИКОТАЖНЫЙ ТОП НА БРЕТЕЛЯХ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\miQl03Mj9G6vMR2s8iFK.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 37598.00, 'ул Федюнинского, д 62Тюмень', '8988796285', '2022-05-19 03:04:03', '2022-05-19 03:04:03'),
(20, 4, 's:1869:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:3:{i:5;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:5;s:4:\"name\";s:22:\"Свитшот GARDONE\";s:5:\"price\";i:30600;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:2;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:2;s:4:\"name\";s:51:\"ТРИКОТАЖНЫЙ ТОП НА БРЕТЕЛЯХ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\miQl03Mj9G6vMR2s8iFK.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 37598.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-19 03:59:14', '2022-05-19 03:59:14'),
(21, 4, 's:1869:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:3:{i:5;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:5;s:4:\"name\";s:22:\"Свитшот GARDONE\";s:5:\"price\";i:30600;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:2;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:2;s:4:\"name\";s:51:\"ТРИКОТАЖНЫЙ ТОП НА БРЕТЕЛЯХ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\miQl03Mj9G6vMR2s8iFK.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 37598.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-19 04:00:52', '2022-05-19 04:00:52'),
(22, 4, 's:1869:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:3:{i:5;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:5;s:4:\"name\";s:22:\"Свитшот GARDONE\";s:5:\"price\";i:30600;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:2;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:2;s:4:\"name\";s:51:\"ТРИКОТАЖНЫЙ ТОП НА БРЕТЕЛЯХ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\miQl03Mj9G6vMR2s8iFK.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 37598.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-19 04:03:37', '2022-05-19 04:03:37'),
(23, 4, 's:1291:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:2:{i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:1;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:1;s:4:\"name\";s:41:\"ПЛАТЬЕ МИНИ С V-ВЫРЕЗОМ\";s:5:\"price\";i:4999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\d3487UxKI8XRMJs98XF7.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 8998.00, 'широтная 213к1Тюмень', '89044923617', '2022-05-19 04:06:10', '2022-05-19 04:06:10'),
(24, 6, 's:1211:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:2:{i:9;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:9;s:4:\"name\";s:10:\"Кофта\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:42:\"products\\May2022\\1PLlSQ2Wh7e2MzsaKu9G.jpeg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:6;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:6;s:4:\"name\";s:6:\"Топ\";s:5:\"price\";i:1799;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n3sAhcUQ6BnJGtBkjNOW.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 5798.00, 'камчатская 54Тюмень', '89222687921', '2022-05-19 04:10:08', '2022-05-19 04:10:08'),
(25, 2, 's:703:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 3999.00, 'ул Федюнинского, д 62Тюмень', '8988796285', '2022-05-19 04:13:10', '2022-05-19 04:13:10'),
(26, 9, 's:2329:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:4:{i:10;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:10;s:4:\"name\";s:12:\"Куртка\";s:5:\"price\";i:70100;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\0URpdIfsw8xlcOcdFOwc.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:11;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:11;s:4:\"name\";s:8:\"Боди\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\EYYdyZfkzOfnrXszqfZi.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:8;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:8;s:4:\"name\";s:8:\"Юбка\";s:5:\"price\";i:7799;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\CLhweJi2jo63q6WXxC99.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:7;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:7;s:4:\"name\";s:12:\"Костюм\";s:5:\"price\";i:14990;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\goar6eUho1i1VWovu7fE.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 96888.00, 'широтная 213к1Тюмень', '89044923617', '2022-05-19 04:16:59', '2022-05-19 04:16:59'),
(27, 9, 's:2329:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:4:{i:10;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:10;s:4:\"name\";s:12:\"Куртка\";s:5:\"price\";i:70100;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\0URpdIfsw8xlcOcdFOwc.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:11;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:11;s:4:\"name\";s:8:\"Боди\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\EYYdyZfkzOfnrXszqfZi.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:8;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:8;s:4:\"name\";s:8:\"Юбка\";s:5:\"price\";i:7799;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\CLhweJi2jo63q6WXxC99.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:7;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:7;s:4:\"name\";s:12:\"Костюм\";s:5:\"price\";i:14990;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\goar6eUho1i1VWovu7fE.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 96888.00, 'широтная 213к1Тюмень', '89044923617', '2022-05-19 04:17:46', '2022-05-19 04:17:46'),
(28, 9, 's:2329:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:4:{i:10;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:10;s:4:\"name\";s:12:\"Куртка\";s:5:\"price\";i:70100;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\0URpdIfsw8xlcOcdFOwc.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:11;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:11;s:4:\"name\";s:8:\"Боди\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\EYYdyZfkzOfnrXszqfZi.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:8;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:8;s:4:\"name\";s:8:\"Юбка\";s:5:\"price\";i:7799;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\CLhweJi2jo63q6WXxC99.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:7;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:7;s:4:\"name\";s:12:\"Костюм\";s:5:\"price\";i:14990;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\goar6eUho1i1VWovu7fE.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 96888.00, 'широтная 213к1Тюмень', '89044923617', '2022-05-19 04:19:39', '2022-05-19 04:19:39');
INSERT INTO `orders` (`id`, `user_id`, `cart_data`, `total_sum`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(29, 5, 's:1255:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:2:{i:3;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:3;s:4:\"name\";s:51:\"БЛУЗКА С ОБЪЕМНЫМИ РУКАВАМИ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\HJzs4qpjrys9Uz6ePN5y.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:8;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:8;s:4:\"name\";s:8:\"Юбка\";s:5:\"price\";i:7799;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\CLhweJi2jo63q6WXxC99.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 10798.00, 'стартова 5Тюмень', '89923020202', '2022-05-19 04:23:51', '2022-05-19 04:23:51'),
(30, 10, 's:1861:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:3:{i:3;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:3;s:4:\"name\";s:51:\"БЛУЗКА С ОБЪЕМНЫМИ РУКАВАМИ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\HJzs4qpjrys9Uz6ePN5y.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:10;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:10;s:4:\"name\";s:12:\"Куртка\";s:5:\"price\";i:70100;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\0URpdIfsw8xlcOcdFOwc.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 77098.00, 'заславского 14Серов', '89044923617', '2022-05-19 04:27:35', '2022-05-19 04:27:35'),
(31, 11, 's:4631:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:8:{i:1;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:1;s:4:\"name\";s:41:\"ПЛАТЬЕ МИНИ С V-ВЫРЕЗОМ\";s:5:\"price\";i:4999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\d3487UxKI8XRMJs98XF7.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:10;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:10;s:4:\"name\";s:12:\"Куртка\";s:5:\"price\";i:70100;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\0URpdIfsw8xlcOcdFOwc.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:6;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:6;s:4:\"name\";s:6:\"Топ\";s:5:\"price\";i:1799;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n3sAhcUQ6BnJGtBkjNOW.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:8;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:8;s:4:\"name\";s:8:\"Юбка\";s:5:\"price\";i:7799;s:8:\"quantity\";i:2;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\CLhweJi2jo63q6WXxC99.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:9;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:9;s:4:\"name\";s:10:\"Кофта\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:42:\"products\\May2022\\1PLlSQ2Wh7e2MzsaKu9G.jpeg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:5;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:5;s:4:\"name\";s:22:\"Свитшот GARDONE\";s:5:\"price\";i:30600;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:3;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:3;s:4:\"name\";s:51:\"БЛУЗКА С ОБЪЕМНЫМИ РУКАВАМИ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:2;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\HJzs4qpjrys9Uz6ePN5y.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:11;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:11;s:4:\"name\";s:8:\"Боди\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\EYYdyZfkzOfnrXszqfZi.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 137092.00, 'широтная 213к1Тюмень', '89044923617', '2022-05-19 04:31:22', '2022-05-19 04:31:22'),
(32, 11, 's:661:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{i:9;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:9;s:4:\"name\";s:10:\"Кофта\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:42:\"products\\May2022\\1PLlSQ2Wh7e2MzsaKu9G.jpeg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 3999.00, 'широтная 213к1Тюмень', '89044923617', '2022-05-19 04:59:13', '2022-05-19 04:59:13'),
(33, 2, 's:2418:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:4:{i:1;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:1;s:4:\"name\";s:41:\"ПЛАТЬЕ МИНИ С V-ВЫРЕЗОМ\";s:5:\"price\";i:4999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\d3487UxKI8XRMJs98XF7.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:5;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:5;s:4:\"name\";s:22:\"Свитшот GARDONE\";s:5:\"price\";i:30600;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:19;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:19;s:4:\"name\";s:12:\"Джинсы\";s:5:\"price\";i:3599;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\2Gx8qR0Qt2a30Qwx3syP.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 43197.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-21 03:48:10', '2022-05-21 03:48:10'),
(34, 2, 's:1224:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:2:{i:18;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:18;s:4:\"name\";s:12:\"Платье\";s:5:\"price\";i:5499;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:42:\"products\\May2022\\S7Wu9OQfcMYPcrKY5lyU.jpeg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:19;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:19;s:4:\"name\";s:12:\"Джинсы\";s:5:\"price\";i:3599;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\2Gx8qR0Qt2a30Qwx3syP.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 9098.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-21 05:19:43', '2022-05-21 05:19:43'),
(35, 2, 's:1860:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:3:{i:19;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:19;s:4:\"name\";s:12:\"Джинсы\";s:5:\"price\";i:3599;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\2Gx8qR0Qt2a30Qwx3syP.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:2;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:2;s:4:\"name\";s:51:\"ТРИКОТАЖНЫЙ ТОП НА БРЕТЕЛЯХ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\miQl03Mj9G6vMR2s8iFK.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:3;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:3;s:4:\"name\";s:51:\"БЛУЗКА С ОБЪЕМНЫМИ РУКАВАМИ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\HJzs4qpjrys9Uz6ePN5y.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 9597.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-21 05:32:44', '2022-05-21 05:32:44'),
(36, 2, 's:665:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{i:18;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:18;s:4:\"name\";s:12:\"Платье\";s:5:\"price\";i:5499;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:42:\"products\\May2022\\S7Wu9OQfcMYPcrKY5lyU.jpeg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 5499.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-21 05:36:08', '2022-05-21 05:36:08'),
(37, 2, 's:1301:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:2:{i:2;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:2;s:4:\"name\";s:51:\"ТРИКОТАЖНЫЙ ТОП НА БРЕТЕЛЯХ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\March2022\\miQl03Mj9G6vMR2s8iFK.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 6998.00, 'ул Федюнинского, д 62Тюмень', '89044923617', '2022-05-21 08:59:47', '2022-05-21 08:59:47'),
(38, 12, 's:4086:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:7:{i:10;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:10;s:4:\"name\";s:12:\"Куртка\";s:5:\"price\";i:70100;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\0URpdIfsw8xlcOcdFOwc.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:8;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:8;s:4:\"name\";s:8:\"Юбка\";s:5:\"price\";i:7799;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\CLhweJi2jo63q6WXxC99.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:11;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:11;s:4:\"name\";s:8:\"Боди\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\EYYdyZfkzOfnrXszqfZi.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:18;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:18;s:4:\"name\";s:12:\"Платье\";s:5:\"price\";i:5499;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:42:\"products\\May2022\\S7Wu9OQfcMYPcrKY5lyU.jpeg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:16;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:16;s:4:\"name\";s:12:\"Костюм\";s:5:\"price\";i:6799;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\abI4SwTmNOpkFpGTXT7x.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:3;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:3;s:4:\"name\";s:51:\"БЛУЗКА С ОБЪЕМНЫМИ РУКАВАМИ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\HJzs4qpjrys9Uz6ePN5y.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 101194.00, 'камчатская 114Тюмень', '89222687921', '2022-05-22 07:26:48', '2022-05-22 07:26:48'),
(39, 12, 's:1818:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:3:{i:9;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:9;s:4:\"name\";s:10:\"Кофта\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:42:\"products\\May2022\\1PLlSQ2Wh7e2MzsaKu9G.jpeg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:17;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:17;s:4:\"name\";s:12:\"Костюм\";s:5:\"price\";i:9090;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:41:\"products\\May2022\\KDx2qLI9rQairKa76wnQ.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}i:3;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:3;s:4:\"name\";s:51:\"БЛУЗКА С ОБЪЕМНЫМИ РУКАВАМИ\";s:5:\"price\";i:2999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\HJzs4qpjrys9Uz6ePN5y.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 16088.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-22 11:36:33', '2022-05-22 11:36:33'),
(40, 2, 's:105:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 0.00, 'ул Федюнинского, д 62Тюмень', '89088796285', '2022-05-26 05:44:13', '2022-05-26 05:44:13'),
(41, 2, 's:703:\"O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{i:4;O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:9:\"\0*\0config\";a:6:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:7:\"storage\";N;s:6:\"events\";N;}s:8:\"\0*\0items\";a:6:{s:2:\"id\";i:4;s:4:\"name\";s:51:\"СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ\";s:5:\"price\";i:3999;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:1:{s:3:\"img\";s:43:\"products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}\";', 3999.00, 'камчатская 54Тюмень', '89923020202', '2022-05-26 05:45:01', '2022-05-26 05:45:01');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(2, 'browse_bread', NULL, '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(3, 'browse_database', NULL, '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(4, 'browse_media', NULL, '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(5, 'browse_compass', NULL, '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(6, 'browse_menus', 'menus', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(7, 'read_menus', 'menus', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(8, 'edit_menus', 'menus', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(9, 'add_menus', 'menus', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(10, 'delete_menus', 'menus', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(11, 'browse_roles', 'roles', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(12, 'read_roles', 'roles', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(13, 'edit_roles', 'roles', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(14, 'add_roles', 'roles', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(15, 'delete_roles', 'roles', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(16, 'browse_users', 'users', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(17, 'read_users', 'users', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(18, 'edit_users', 'users', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(19, 'add_users', 'users', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(20, 'delete_users', 'users', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(21, 'browse_settings', 'settings', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(22, 'read_settings', 'settings', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(23, 'edit_settings', 'settings', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(24, 'add_settings', 'settings', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(25, 'delete_settings', 'settings', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(26, 'browse_products', 'products', '2022-03-31 07:30:20', '2022-03-31 07:30:20'),
(27, 'read_products', 'products', '2022-03-31 07:30:20', '2022-03-31 07:30:20'),
(28, 'edit_products', 'products', '2022-03-31 07:30:20', '2022-03-31 07:30:20'),
(29, 'add_products', 'products', '2022-03-31 07:30:20', '2022-03-31 07:30:20'),
(30, 'delete_products', 'products', '2022-03-31 07:30:20', '2022-03-31 07:30:20'),
(31, 'browse_productmen', 'productmen', '2022-04-03 04:45:01', '2022-04-03 04:45:01'),
(32, 'read_productmen', 'productmen', '2022-04-03 04:45:01', '2022-04-03 04:45:01'),
(33, 'edit_productmen', 'productmen', '2022-04-03 04:45:01', '2022-04-03 04:45:01'),
(34, 'add_productmen', 'productmen', '2022-04-03 04:45:01', '2022-04-03 04:45:01'),
(35, 'delete_productmen', 'productmen', '2022-04-03 04:45:01', '2022-04-03 04:45:01');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `productmen`
--

CREATE TABLE `productmen` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `productmen`
--

INSERT INTO `productmen` (`id`, `name`, `description`, `img`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Брюки', 'Ты не сдаешься. Ты тренируешься упорно. Ты выкладываешься по полной. Отдыхай по максимуму в этих брюках adidas. Мы называем это балансом. Ультрамягкий футер дарит комфорт в течение всего дня. Долгожданная награда для уставших мышц. Минималистичная модель дополнена логотипом в спортивном стиле. Стандартная посадка Эластичный пояс на завязках-шнурках Футер: 70% хлопок, 30% переработанный полиэстер Зауженный книзу крой', 'productmen\\April2022\\7Zc4ZER3yuzBGYcitqkt.jpg', 3999, '2022-04-03 05:01:01', '2022-04-03 05:01:01'),
(2, 'Рубашка', 'Состав: Хлопок - 98%, Эластан - 2%\r\n\r\nРазмер товара на модели: M INT\r\n\r\nПараметры модели: 100-85-99', 'productmen\\April2022\\dmghEleZ3fDQXBxrEuQV.jpg', 3799, '2022-04-03 05:34:23', '2022-04-03 05:34:23');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categori_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `img`, `price`, `created_at`, `updated_at`, `Size`, `Color`, `categori_id`) VALUES
(1, 'ПЛАТЬЕ МИНИ С V-ВЫРЕЗОМ', 'Платье мини А-силуэта. V-образный вырез, завышенная линия талии, подол с воланами. Объемные рукава со сборкой и манжетами на пуговицах. Модель с атласным подкладом выполнена из ткани в двух цветах: лавандовом и черном. Застегивается на спине на скрытую молнию. На модели размер 42. Крой модели соответствует стандартному размеру.', 'products\\March2022\\d3487UxKI8XRMJs98XF7.jpg', 4999, '2022-03-31 09:16:00', '2022-05-21 06:13:22', 'XS,S,M,L', 'Чёрный', 'platьe'),
(2, 'ТРИКОТАЖНЫЙ ТОП НА БРЕТЕЛЯХ', 'Комбинированный топ из гладкого и фактурного трикотажа выполнен в двух цветах: черном и молочном. Модель облегающего кроя на широких бретелях с U-образным вырезом. На модели размер 42. Крой модели соответствует стандартному размеру.\r\n\r\nСостав: Ткань 1: 85% хлопок, Ткань 1: 15% полиэстер, Ткань 2: 60% хлопок, Ткань 2: 35% полиэстер, Ткань 2: 5% эластан\r\nУход за изделием: Бережная стирка при максимальной температуре 30ºС, Не отбеливать, Сушка в расправленном виде. Не скручивать, Глажение при 110ºС, Профессиональная сухая чистка. Мягкий режим., Не замачивать, Стирать с изделиями похожих цветов.\r\nСтрана-производитель: КИТАЙ', 'products\\March2022\\miQl03Mj9G6vMR2s8iFK.jpg', 2999, '2022-03-31 10:16:00', '2022-05-21 06:20:45', 'XS,S,M,L', 'Чёрный', 'top'),
(3, 'БЛУЗКА С ОБЪЕМНЫМИ РУКАВАМИ', 'Свободная рубашка с объемными рукавами выполнена в двух цветах: белом и белом с принтом в горох. Прямой крой, отложной воротник, манжеты и планка с пуговицами. На модели размер 42. Крой модели соответствует стандартному размеру.\r\n\r\nСостав: 97% хлопок, 3% эластан\r\nУход за изделием: Бережная стирка при максимальной температуре 30ºС, Не отбеливать, Машинная сушка запрещена, Глажение при 110ºС, Профессиональная сухая чистка. Мягкий режим., СТИРАТЬ И ГЛАДИТЬ, ВЫВЕРНУВ НАИЗНАНКУ, С ИЗДЕЛИЯМИ ПОХОЖИХ ЦВЕТОВ\r\nСтрана-производитель: КИТАЙ', 'products\\April2022\\HJzs4qpjrys9Uz6ePN5y.jpg', 2999, '2022-04-03 09:33:00', '2022-05-21 06:15:30', 'XS,S,M,L', 'Белый', 'bluzka'),
(4, 'СТЕГАНАЯ ЖИЛЕТКА ИЗ ЭКОКОЖИ', 'Стеганая жилетка широкого кроя из гладкой экокожи бежевого цвета. Воротник-стойка, боковые карманы, атласный подклад. Внутри жилета предусмотрен искусственный утеплитель, материал защищает от ветра. Комфортная температура для носки модели — не ниже +10°C.\r\n\r\nСостав: Внешний слой: 100% полиуретан, Внутренний слой: 100% полиэстер, Подкладка: 100% полиэстер, Утеплитель: 100% полиэстер\r\nУход за изделием: Не стирать, Не отбеливать, Машинная сушка запрещена, Не гладить, Профессиональная мокрая чистка. Мягкий режим., Протирать поверхность мокрой тканью\r\nСтрана-производитель: КИТАЙ', 'products\\April2022\\e3FuA8FR2NJtb3GQhhZn.jpg', 3999, '2022-04-03 09:35:00', '2022-05-21 06:11:37', 'XS,S,M,L', 'Кофейный', 'zhiletka'),
(5, 'Свитшот GARDONE', 'Состав Хлопок - 100%\r\n\r\nРазмер товара на модели S INT\r\n\r\nПараметры модели 82-60-90\r\n\r\nРост модели на фото 179\r\n\r\nДлина 47 см\r\n\r\nДлина рукава 30 см\r\n\r\nСезон мульти\r\n\r\nЦвет зеленый\r\n\r\nУзор полоска, цветочный\r\n\r\nСтрана производства Китай\r\n\r\nАртикул RTLABI317801', 'products\\May2022\\n2bOLMlACSBpNSWH11I3.jpg', 30600, '2022-05-13 08:56:00', '2022-05-21 06:12:09', 'XS,S,M,L', 'Зеленый', 'kofta'),
(6, 'Топ', 'Состав Вискоза - 100%\r\n\r\nРазмер товара на модели S INT\r\n\r\nПараметры модели 84-60-92\r\n\r\nРост модели на фото 178\r\n\r\nДлина 27 см\r\n\r\nСезон мульти\r\n\r\nЦвет черный\r\n\r\nУзор цветочный\r\n\r\nГарантийный период не установлен\r\n\r\nСтрана производства Индия\r\n\r\nАртикул MP002XW137VS', 'products\\May2022\\n3sAhcUQ6BnJGtBkjNOW.jpg', 1799, '2022-05-13 08:58:00', '2022-05-21 06:21:11', 'XS,S,M,L', 'Чёрный', 'top'),
(7, 'Костюм', 'Состав Вискоза - 60%, Полиэстер - 40%\r\n\r\nМатериал подкладки Другое волокно - 100%\r\n\r\nРазмер товара на модели 44 RUS\r\n\r\nПараметры модели 89-60-84\r\n\r\nРост модели на фото 176\r\n\r\nДлина рукава 60 см\r\n\r\nСезон мульти\r\n\r\nЦвет черный\r\n\r\nУзор однотонный\r\n\r\nПосадка slim fit\r\n\r\nКарманы 4\r\n\r\nКомплектация пиджак, брюки\r\n\r\nГарантийный период 30 дней\r\n\r\nСтрана производства Россия\r\n\r\nЗастежка молния, пуговицы\r\n\r\nАртикул MP002XW0BKFS', 'products\\May2022\\goar6eUho1i1VWovu7fE.jpg', 14990, '2022-05-13 09:00:00', '2022-05-21 06:12:35', 'XS,S,M,L', 'Чёрный', 'kostyum'),
(8, 'Юбка', 'Длинная юбка выполнена из штапеля. Детали: с боковым глубоким разрезом и высокой талией, сзади потайная молния, пояс у юбки притачной из основной ткани.\r\n\r\nСостав Вискоза - 100%\r\n\r\nРазмер товара на модели 42\r\n\r\nПараметры модели 80-60-88\r\n\r\nРост модели на фото 174\r\n\r\nДлина по боковому шву 77 см\r\n\r\nСезон лето\r\n\r\nЦвет черный\r\n\r\nУзор другое\r\n\r\nГарантийный период 30 дней\r\n\r\nСтрана производства Россия\r\n\r\nЗастежка молния\r\n\r\nАртикул MP002XW0CM8O', 'products\\May2022\\CLhweJi2jo63q6WXxC99.jpg', 7799, '2022-05-13 09:01:00', '2022-05-21 06:11:15', 'XS,S,M,L', 'Чёрный', 'yubka'),
(9, 'Кофта', 'Состав Акрил - 100%\r\n\r\nМатериал подкладки без подкладки\r\n\r\nРазмер товара на модели S\r\n\r\nПараметры модели 80-62-88\r\n\r\nРост модели на фото 175\r\n\r\nСезон мульти\r\n\r\nЦвет зеленый\r\n\r\nУзор геометрия\r\n\r\nГарантийный период не установлен\r\n\r\nСтрана производства Китай\r\n\r\nАртикул MP002XW0BSXH', 'products\\May2022\\1PLlSQ2Wh7e2MzsaKu9G.jpeg', 3999, '2022-05-13 09:04:00', '2022-05-21 06:10:53', 'XS,S,M,L', 'Мятный', 'kofta'),
(10, 'Куртка', 'Куртка выполнена из плотного денима. Модель прямого укороченного кроя. Детали: застежка на пуговицах, отложной воротник, 2 кармана.\r\n\r\nСостав Хлопок - 98%, Эластан - 2%\r\n\r\nРазмер товара на модели 40 IT\r\n\r\nПараметры модели 85-58-89\r\n\r\nРост модели на фото 180\r\n\r\nДлина 45 см\r\n\r\nДлина рукава 60 см\r\n\r\nСезон демисезон, лето\r\n\r\nЦвет бежевый\r\n\r\nУзор клетка\r\n\r\nКарманы 2\r\n\r\nКапюшон нет\r\n\r\nСтрана производства Тунис\r\n\r\nЗастежка пуговицы\r\n\r\nАртикул RTLABD768201', 'products\\May2022\\0URpdIfsw8xlcOcdFOwc.jpg', 70100, '2022-05-13 09:05:00', '2022-05-21 06:16:06', 'XS,S,M,L', 'Бежевый', 'kurtka'),
(11, 'Боди', 'Состав Нейлон - 68%, Эластан - 24%, Хлопок - 8%\r\n\r\nРазмер товара на модели 3B IT\r\n\r\nПараметры модели 79-59-88\r\n\r\nРост модели на фото 175\r\n\r\nСезон мульти\r\n\r\nЦвет черный\r\n\r\nУзор однотонный\r\n\r\nКосточки нет\r\n\r\nЧашечки есть\r\n\r\nБретели съемные\r\n\r\nPush up есть\r\n\r\nГарантийный период 30 дней\r\n\r\nСтрана производства Китай\r\n\r\nАртикул MP002XW0Z3CP', 'products\\May2022\\EYYdyZfkzOfnrXszqfZi.jpg', 3999, '2022-05-13 09:07:00', '2022-05-21 06:16:29', 'XS,S,M,L', 'Черный', 'bodi'),
(12, 'Топ', 'Состав Полиэстер - 92%, Эластан - 8%\r\n\r\nРазмер товара на модели S INT\r\n\r\nПараметры модели 87-63-95\r\n\r\nРост модели на фото 176\r\n\r\nДлина 33 см\r\n\r\nСезон мульти\r\n\r\nЦвет черный\r\n\r\nУзор однотонный\r\n\r\nГарантийный период не установлен\r\n\r\nСтрана производства Китай\r\n\r\nАртикул MP002XW0D6AJ', 'products\\May2022\\YqewtHV0eoKFu25OmuNv.jpg', 1799, '2022-05-19 09:32:00', '2022-05-21 06:20:28', 'XS,S,M,L', 'Черный', 'top'),
(13, 'Футболка', 'Состав Хлопок - 95%, Эластан - 5%\r\n\r\nРазмер товара на модели S INT\r\n\r\nПараметры модели 84-60-92\r\n\r\nРост модели на фото 178\r\n\r\nДлина 44 см\r\n\r\nДлина рукава 22 см\r\n\r\nСезон мульти\r\n\r\nЦвет розовый\r\n\r\nУзор однотонный\r\n\r\nГарантийный период не установлен\r\n\r\nСтрана производства Россия\r\n\r\nАртикул MP002XW02CMS', 'products\\May2022\\oVg2x0IQMKo7SVpCf8YS.jpg', 1499, '2022-05-19 09:34:00', '2022-05-21 06:07:53', 'XS,S,M,L', 'Розовый', 'futbolka'),
(14, 'Платье', 'Состав Вискоза - 95%, Эластан - 5%\r\n\r\nРазмер товара на модели 36/38 FR\r\n\r\nПараметры модели 90-64-94\r\n\r\nРост модели на фото 178\r\n\r\nДлина 94 см\r\n\r\nДлина рукава 15 см\r\n\r\nСезон мульти\r\n\r\nЦвет черный\r\n\r\nУзор однотонный\r\n\r\nСтрана производства Турция\r\n\r\nЗастежка без застежки\r\n\r\nАртикул RTLABI539701', 'products\\May2022\\8e3EgK3CoWZ2fTzFTrv4.jpg', 4899, '2022-05-19 09:36:00', '2022-05-21 06:04:28', 'XS,S,M,L', 'Черное', 'platьe'),
(15, 'Костюм спортивный', 'Состав Хлопок - 95%, Эластан - 5%\r\n\r\nРазмер товара на модели 42 RUS\r\n\r\nПараметры модели 85-62-89\r\n\r\nРост модели на фото 179\r\n\r\nДлина рукава 25 см\r\n\r\nСезон мульти\r\n\r\nЦвет фиолетовый\r\n\r\nУзор однотонный\r\n\r\nКарманы 2\r\n\r\nКомплектация футболка, брюки\r\n\r\nГарантийный период не установлен\r\n\r\nСтрана производства Россия\r\n\r\nЗастежка без застежки, шнурки\r\n\r\nАртикул MP002XW0D1TZ', 'products\\May2022\\YJU5eCu6xpObH0g46lxV.jpg', 7890, '2022-05-19 09:38:00', '2022-05-20 10:40:33', 'XS,S,M,L', 'Фиолетовый', 'kostyum'),
(16, 'Костюм', 'Состав Вискоза - 45%, Полиэстер - 33%, Эластан - 22%\r\n\r\nМатериал подкладки Полиэстер - 100%\r\n\r\nРазмер товара на модели 42 RUS\r\n\r\nПараметры модели 86-60-92\r\n\r\nРост модели на фото 175\r\n\r\nДлина 45 см\r\n\r\nДлина рукава 60 см\r\n\r\nСезон мульти\r\n\r\nЦвет коричневый\r\n\r\nУзор другое, однотонный\r\n\r\nКомплектация пиджак, юбка\r\n\r\nГарантийный период не установлен\r\n\r\nСтрана производства Россия\r\n\r\nЗастежка без застежки\r\n\r\nАртикул MP002XW0CF25', 'products\\May2022\\abI4SwTmNOpkFpGTXT7x.jpg', 6799, '2022-05-19 09:41:00', '2022-05-20 10:39:45', 'XS,S,M,L', 'Коричневый', 'kostyum'),
(17, 'Костюм', 'Состав Полиэстер - 100%\r\n\r\nМатериал подкладки Полиэстер - 100%\r\n\r\nРазмер товара на модели 42 RUS\r\n\r\nПараметры модели 83-61-90\r\n\r\nРост модели на фото 180\r\n\r\nДлина рукава 60 см\r\n\r\nСезон мульти\r\n\r\nЦвет оранжевый\r\n\r\nУзор однотонный\r\n\r\nПосадка regular fit\r\n\r\nКарманы 4\r\n\r\nКомплектация пиджак, брюки\r\n\r\nСтрана производства Россия\r\n\r\nЗастежка пуговицы\r\n\r\nКоллекция outlet\r\n\r\nАртикул RTLABL835101', 'products\\May2022\\KDx2qLI9rQairKa76wnQ.jpg', 9090, '2022-05-19 09:43:00', '2022-05-20 10:39:30', 'XS,S,M,L', 'Оранжевый', 'kostyum'),
(18, 'Платье', 'Состав Хлопок - 50%, Полиэстер - 45%, Лайкра - 5%\r\n\r\nМатериал подкладки без подкладки\r\n\r\nРазмер товара на модели XS\r\n\r\nПараметры модели 84-60-90\r\n\r\nРост модели на фото 173\r\n\r\nДлина 83 см\r\n\r\nСезон мульти\r\n\r\nЦвет черный\r\n\r\nУзор однотонный\r\n\r\nГарантийный период 30 дней\r\n\r\nСтрана производства Киргизия\r\n\r\nЗастежка молния\r\n\r\nАртикул MP002XW0CVMG', 'products\\May2022\\S7Wu9OQfcMYPcrKY5lyU.jpeg', 5499, '2022-05-19 09:46:00', '2022-05-21 06:04:12', 'XS,S,M,L', 'Черный', 'platьe'),
(19, 'Джинсы', 'Состав Хлопок - 85%, Вискоза - 15%\r\n\r\nРазмер товара на модели S INT\r\n\r\nПараметры модели 85-62-91\r\n\r\nРост модели на фото 178\r\n\r\nВысота 31 см\r\n\r\nДлина по внутреннему шву 70 см\r\n\r\nДлина по боковому шву 100 см\r\n\r\nШирина по низу 18 см\r\n\r\nСезон мульти\r\n\r\nЦвет голубой\r\n\r\nУзор однотонный\r\n\r\nТалия высокая\r\n\r\nКарманы 4\r\n\r\nГарантийный период не установлен\r\n\r\nСтрана производства Бангладеш\r\n\r\nЗастежка молния\r\n\r\nАртикул MP002XW0CCK5', 'products\\May2022\\2Gx8qR0Qt2a30Qwx3syP.jpg', 3599, '2022-05-19 09:52:00', '2022-05-20 10:39:05', 'XS,S,M,L', 'Голубые', 'dzhinsy'),
(20, 'Джинсы', 'Состав Хлопок - 78%, Полиэстер - 21%, Спандекс - 1%\r\n\r\nРазмер товара на модели 27 JEANS\r\n\r\nПараметры модели 84-59-90\r\n\r\nРост модели на фото 174\r\n\r\nВысота 27 см\r\n\r\nДлина по внутреннему шву 71 см\r\n\r\nШирина по низу 12 см\r\n\r\nСезон мульти\r\n\r\nЦвет черный\r\n\r\nУзор однотонный\r\n\r\nТалия высокая\r\n\r\nКарманы 5\r\n\r\nГарантийный период 30 дней\r\n\r\nСтрана производства Россия\r\n\r\nЗастежка молния, пуговицы\r\n\r\nАртикул MP002XW08KBR', 'products\\May2022\\MijA1dZ91zDEkwtcUIe8.jpg', 2390, '2022-05-19 09:53:00', '2022-05-20 10:38:53', 'XS,S,M,L', 'Черный', 'dzhinsy'),
(21, 'Джинсы', 'Состав Хлопок - 78%, Полиэстер - 21%, Спандекс - 1%\r\n\r\nРазмер товара на модели 27 JEANS\r\n\r\nПараметры модели 84-59-90\r\n\r\nРост модели на фото 174\r\n\r\nВысота 27 см\r\n\r\nДлина по внутреннему шву 71 см\r\n\r\nШирина по низу 12 см\r\n\r\nСезон мульти\r\n\r\nЦвет черный\r\n\r\nУзор однотонный\r\n\r\nТалия высокая\r\n\r\nКарманы 5\r\n\r\nГарантийный период 30 дней\r\n\r\nСтрана производства Россия\r\n\r\nЗастежка молния, пуговицы\r\n\r\nАртикул MP002XW08KBR', 'products\\May2022\\kmkWs4E5tDmEOkj73Ws7.jpeg', 3599, '2022-05-19 09:55:00', '2022-05-20 09:50:56', 'XS,S,M,L', 'Бежевый', 'dzhinsy');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-03-31 04:14:13', '2022-03-31 04:14:13'),
(2, 'user', 'Normal User', '2022-03-31 04:14:13', '2022-03-31 04:14:13');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(2, 1, 'Masha', 'pashkovamariya0@gmail.com', 'users/default.png', NULL, '$2y$10$9oS9//LHM0oH4PffSibD7.7JGYgwuR/J.7PRcQY9T2J2ktYqr91fW', 'oLyya3woDRyp1Hs1Ma8FYo8iKiO2m4Wu9n5nEURPB4uN5X9cQtTgFx1fQutF', '{\"locale\":\"ru\"}', '2022-03-31 05:10:13', '2022-03-31 05:19:31'),
(3, 2, 'Liza', 'Liza@gmail.com', 'users/default.png', NULL, '$2y$10$CI72he3fm558hDeAASgtOOzks9ufVy7IpdKQYa0vA8YI09DTb66FO', NULL, NULL, '2022-03-31 05:11:15', '2022-03-31 05:11:16'),
(4, 2, 'Максим', 'max@gmail.com', 'users/default.png', NULL, '$2y$10$GbpX02JtUekGWS1SfVrpX.p1qrdlSuIOea7IDvvehzc73RrGb5OXK', NULL, NULL, '2022-04-21 11:47:03', '2022-04-21 11:47:03'),
(5, 2, 'Ira', 'Ira@gmail.com', 'users/default.png', NULL, '$2y$10$/aUMQw9E.HUr8SJGe5exMeENEDHlZQSslTlaRS5BJdhkm9qgmj/Hq', NULL, NULL, '2022-04-28 10:29:38', '2022-04-28 10:29:38'),
(6, 2, 'Lada', 'Lada@gmail.com', 'users/default.png', NULL, '$2y$10$xFCB4N/99K4Wyo8KspFyRupcV9056KFlZlJCdk.GhK8XgfK2SMoCe', NULL, NULL, '2022-04-28 10:32:13', '2022-04-28 10:32:13'),
(7, 2, 'Max', 'max@mail.com', 'users/default.png', NULL, '$2y$10$dluy8j6PDSbmpWPfhZo6zuK5OhQJ.UKg7I.GypLQpifeO0C.5J9fC', NULL, NULL, '2022-05-02 10:05:16', '2022-05-02 10:05:16'),
(8, 2, 'masha', 'masha@gmail.com', 'users/default.png', NULL, '$2y$10$L6.a5TBw7JCUZmpYUdOTROboVZq9CIZGfIJGKgRZ276d98ILOoI22', NULL, NULL, '2022-05-18 00:16:25', '2022-05-18 00:16:25'),
(9, 2, 'Максим', 'maxnigegorodcew@gmail.ru', 'users/default.png', NULL, '$2y$10$G.z4JEzya0OeRHZ4QqbxlemVofRLsTojjbLCQog6EJ00UEGBRniiy', NULL, NULL, '2022-05-19 04:15:32', '2022-05-19 04:15:32'),
(10, 2, 'Лиза', 'liza.lykova2001@bk.ru', 'users/default.png', NULL, '$2y$10$dYQZCawtDek4MrJ5gf4oOeADOUA.7/qyTbOp5poY4Id3qyXUK/kHG', NULL, NULL, '2022-05-19 04:25:25', '2022-05-19 04:25:25'),
(11, 2, 'Максимка', 'maxnigegorodcew@gmail.com', 'users/default.png', NULL, '$2y$10$KvWytL8VSNOoSVHTVNi/ROcTNt5fazkHbSmYYpeJgus47uQGXelDi', NULL, NULL, '2022-05-19 04:29:41', '2022-05-19 04:29:41'),
(12, 2, 'Данил', 'Raut_2003@bk.ru', 'users/default.png', NULL, '$2y$10$/EeG3RXXXE37atlG.zQK2OTPF0/WMNA3x4XX.slIHMutdaF.xKoNi', NULL, NULL, '2022-05-22 07:23:26', '2022-05-22 07:23:26');

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Индексы таблицы `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_id_index` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `productmen`
--
ALTER TABLE `productmen`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `productmen`
--
ALTER TABLE `productmen`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
