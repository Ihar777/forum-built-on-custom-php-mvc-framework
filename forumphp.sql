-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Сен 22 2018 г., 13:55
-- Версия сервера: 5.7.17
-- Версия PHP: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `forumphp`
--

-- --------------------------------------------------------

--
-- Структура таблицы `channels`
--

CREATE TABLE `channels` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `channels`
--

INSERT INTO `channels` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Авто', 'auto', '2018-07-18 08:32:23', '2018-07-18 08:32:23'),
(2, 'Путешествия', 'travelling', '2018-07-18 08:32:45', '2018-07-18 08:32:45'),
(3, 'Новости', 'news', '2018-07-18 09:42:34', '2018-07-18 09:42:34'),
(4, 'Люди', 'people', '2018-07-18 20:17:21', '2018-07-18 20:17:21'),
(5, 'Здоровье', 'health', '2018-07-18 20:34:41', '2018-07-18 20:34:41'),
(6, 'Деньги', 'money', '2018-07-18 20:35:23', '2018-07-18 20:35:23'),
(7, 'Недвижимость', 'realestate', '2018-07-18 20:35:50', '2018-07-18 20:35:50'),
(8, 'Увлечения', 'hobby', '2018-07-18 20:36:20', '2018-07-18 20:36:20');

-- --------------------------------------------------------

--
-- Структура таблицы `discussions`
--

CREATE TABLE `discussions` (
  `id` int(10) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL DEFAULT 'slug',
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `discussions`
--

INSERT INTO `discussions` (`id`, `user_id`, `channel_id`, `slug`, `title`, `content`, `created_at`, `updated_at`) VALUES
(4, 1, 4, 'laravel-homestead-error-undetected-database', 'Какое хобби можно превратить в бизнес?', 'Почти любое.<br />\r\n<br />\r\nНапример, если вы любите готовить сладости, можете делать их на заказ. Если хорошо вяжете — создавайте вещи на продажу. Увлекаетесь архитектурой — водите экскурсии по городу. Любите читать — ведите блог про книжки или создайте платную рассылку.<br />\r\n<br />\r\nОб этом стоит задуматься, если каждый день вы ходите на нелюбимую работу и не можете уделять достаточно времени своим увлечениям. Плюс в том, что сразу бросать работу не нужно. Начните с подработки, а если дело пойдёт — тогда уже уволитесь и будете работать на себя. В России на себя работают 20 млн человек, так что и у вас получится.', '2018-02-22 19:44:05', '2018-02-22 19:44:05'),
(5, 1, 5, 'lorem-ipsum', 'lorem ipsum', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '2018-02-23 13:26:24', '2018-02-23 13:26:24'),
(6, 1, 6, 'Porsche-Cayenne', 'Деньги', 'Средняя апрельская зарплата в Украине составила 652 белорусских рубля (суммы пересчитаны в рубли по курсу Нацбанка Беларуси на 4 июня). По сравнению с мартом она поднялась на 1,2%. Среднемесячная номинальная заработная плата одного работника в Казахстане — нашего соседа по ЕАЭС — в апреле составила 923 рубля.<br />\r\n<br />\r\nВ России средняя зарплата, по оценке Росстата, в апреле составила 1408 белорусских рублей. Это на 12,1% больше, чем в марте.<br />\r\n<br />\r\nВ Эстонии средняя зарплата в первом квартале 2018 года составила 2913 рубля, что на 7,7% выше, чем в аналогичный период прошлого года. Средняя зарплата работников в Польше за первый квартал 2018 года составила 2565 рубля.<br />\r\nСредняя зарплата в Литве в первом квартале 2018 года составила 2100 рублей: в государственном секторе — 2076 рублей, в частном — 2111 рубля. По данным Департамента статистики, по сравнению с 4 кварталом 2017 г. средняя зарплата в Литве увеличилась на 1,2%. В Латвии зарплата до уплаты налогов в первом квартале 2018 года составила 2254 рубля.<br />\r\nЧитать полностью:  https://finance.tut.by/news595393.html<br />', '2018-02-23 13:51:26', '2018-02-25 20:35:50'),
(7, 1, 7, 'new-discussion', 'Недвижимость', 'Успех — достижение поставленных целей в задуманном деле[1], положительный результат чего-либо, общественное признание чего-либо или кого-либо[2].', '2018-02-26 07:08:10', '2018-03-02 17:32:10'),
(8, 2, 8, 'hobbies', 'Увлечение озаряет жизнь', '\nС тех пор как я стала увлекаться моим новым хобби я все время пытаюсь найти как можно больше свободного времени для совершенствования в моем увлечении. ', '2018-07-21 21:00:00', '2018-07-21 21:00:00'),
(9, 1, 1, 'slug', 'Audi Q7', 'Audi Q7 — полноразмерный кроссовер, выпускаемый компанией Audi. Его премьера состоялась в сентябре 2005 года на Международном автосалоне во Франкфурте. Audi Q7 базируется на концепте Audi Pikes Peak quattro, представленном в 2003 году на автосалоне в Детройте. Audi Q7 создан на платформе E. Вместе с ним на заводе Volkswagen Slovakia в Братиславе (Словакия) на этой-же платформе выпускаются модели концерна Volkswagen — Touareg и Porsche Cayenne.', '2018-09-22 09:53:27', '2018-09-22 09:53:27'),
(10, 1, 2, 'slug', 'Пунта-Кана', 'Пунта-Кана – район Доминиканской Республики, расположенный на востоке страны и омываемый водами Карибского моря и Атлантического океана. Он славится пляжами с прозрачной водой, которые протянулись на 32 километра. Районы Пунта-Кана и Баваро образуют область Коста-дель-Коко (Кокосовое побережье), известную своими фешенебельными курортными гостиницами, работающими по системе &#34;все включено&#34;. У отдыхающих популярны активные виды отдыха: зиплайн (спуск по наклонному тросу), виндсерфинг, сплавы на каяках и парусный спорт.', '2018-09-22 09:55:13', '2018-09-22 09:55:13');

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `reply_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `likes`
--

INSERT INTO `likes` (`id`, `reply_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 6, 1, '2018-02-23 13:27:38', '2018-02-23 13:27:38');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `replies`
--

CREATE TABLE `replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `best_answer` tinyint(1) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `replies`
--

INSERT INTO `replies` (`id`, `user_id`, `discussion_id`, `best_answer`, `content`, `created_at`, `updated_at`) VALUES
(7, 1, 6, 1, 'e4wrgtbynhfgvfsdz', '2018-02-23 13:51:35', '2018-02-23 13:51:40'),
(8, 1, 3, 0, 'nice', '2018-02-26 06:56:37', '2018-02-26 06:58:12'),
(16, 1, 8, 0, 'eqwretg', '2018-07-29 10:29:41', NULL),
(17, 1, 8, 0, 'sdf', '2018-07-29 10:49:24', NULL),
(18, 1, 8, 0, 'sdf', '2018-07-29 10:51:28', NULL),
(27, 3, 8, 0, 'ewrgetfhg', '2018-07-29 13:52:51', NULL),
(28, 3, 8, 0, 'cdsfd', '2018-07-29 14:05:45', NULL),
(29, 3, 8, 0, 'dsfvc', '2018-07-29 14:05:58', NULL),
(30, 3, 8, 0, 'dsfd<br />\r\n<br />', '2018-07-29 14:06:35', NULL),
(31, 3, 8, 0, 'hi', '2018-07-29 14:10:09', NULL),
(32, 3, 8, 0, 'hi  again', '2018-07-29 14:11:13', NULL),
(33, 3, 8, 0, 'jgj', '2018-07-29 14:23:23', NULL),
(34, 3, 8, 0, 'h jkn', '2018-07-29 14:24:30', NULL),
(35, 3, 8, 0, 'kml', '2018-07-29 14:25:17', NULL),
(36, 1, 8, 0, 'dsfgh', '2018-07-29 16:38:27', NULL),
(37, 1, 7, 0, 'hkjflsd', '2018-08-05 18:20:42', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT '100',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `avatar`, `points`, `admin`, `created_at`, `updated_at`) VALUES
(1, 'Игорь Петрушенко', 'petrushen@yahoo.com', '$2y$10$IN9NhhNOU40vz62atLVYrOkDpbvI/29bVkp7kJeIG.k0LgYQ1Ah0G', 'Ihar.png', 100, 0, '2018-07-17 12:22:31', NULL),
(2, 'Алеся Петрушенко', 'nice@nice.com', '$2y$10$IN9NhhNOU40vz62atLVYrOkDpbvI/29bVkp7kJeIG.k0LgYQ1Ah0G', 'Alesya.png', 100, 0, NULL, NULL),
(3, 'John Doe', 'johndoe@gmail.com', '$2y$10$V5Y.9pZkhKXifyWgfhqE8Os8snySfjZZl8WUx0CNYAx7eaJOwVp0y', 'male.png', 100, 0, '2018-07-29 12:46:39', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
