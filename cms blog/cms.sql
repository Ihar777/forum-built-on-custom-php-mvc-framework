-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 27 2017 г., 03:35
-- Версия сервера: 5.7.17
-- Версия PHP: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cms`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Bootstrap'),
(2, 'Javascript'),
(3, 'PHP'),
(4, 'Java'),
(8, 'CSS'),
(9, 'HTML'),
(10, 'HTML5');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(2, 1, 'Cindy', 'cindy@cindy.com', 'Hey Edwin, you Rock, are you married?', 'approved', '2017-05-15'),
(4, 1, 'Ihar Petrushenka', 'petrushen@yahoo.com', 'Nice course', 'approved', '2017-05-16'),
(6, 2, 'tguhij', 'fvhgbj@gvbhjkn.com', 'dcfvghbj', 'approved', '2017-05-16'),
(7, 1, 'htgrfeds', 'hgfds@jhjg.com', 'nhgbdfv', 'approved', '2017-05-16'),
(8, 1, 'Juan', 'bsdhjk@fvd.com', 'bfvdc', 'approved', '2017-05-17'),
(9, 2, 'vsd', 'fvd@fdghgh.com', 'bgdfvd', 'approved', '2017-05-17'),
(10, 2, 'bnvcxz', 'hgbf@vb.com', 'yhfgfd', 'approved', '2017-05-17'),
(11, 1, 'yguhij', 'ghgj@vtuybiu.com', 'tyyiu', 'approved', '2017-05-17'),
(12, 1, 'tgyui', 'sdfrt@tgyhj.com', 'fvgbhn', 'approved', '2017-05-17'),
(13, 1, 'Ihar Petrushenka', 'petrushen@yahoo.com', '', 'approved', '2017-05-21'),
(14, 1, 'NY CITY', 'GFDS@GHHFS.COM', 'NYCITY', 'approved', '2017-05-21'),
(15, 2, 'Ihar Petrushenka', 'gjdf@kfskd.com', 'comment', 'approved', '2017-05-21'),
(19, 2, 'ME', 'fds@hfg.com', 'hi', 'approved', '2017-05-27'),
(20, 6, 'vdc', 'fds@hfg.com', 'gfdd', 'approved', '2017-05-27'),
(21, 7, 'Ihar Petrushenka', 'petrushen@yahoo.com', 'It works!', 'approved', '2017-05-27'),
(22, 8, 'Ihar Petrushenka', 'petrushen@yahoo.com', 'ok', 'approved', '2017-05-27'),
(23, 2, 'Ihar', '', '', 'approved', '2017-06-04'),
(24, 2, 'Ihar', 'petrushen@yahoo.com', 'I wish this car belonged to our family!', 'approved', '2017-06-04'),
(25, 1, 'me', 'fvdc@fkhdjk.com', 'bgrfvdc', 'unapproved', '2017-06-04'),
(28, 1, 'Ihar', 'petrushen@yahoo.com', 'nice', 'unapproved', '2017-06-14'),
(29, 1, 'jmi,k', 'petrushen@yahoo.com', 'byynuh', 'unapproved', '2017-06-14');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_user` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL DEFAULT '0',
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_user`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`) VALUES
(1, 3, 'CMS PHP course is awesome', 'RON', '', '2017-06-10', 'roof.jpg', '<p><strong>WOW, I really like this course</strong></p>', 'JAVA, PLUS JAVA, PHP', 4, 'published', 4),
(2, 9, 'Javascript', 'Belinda', '', '2017-06-10', 'lambo_1.jpg', '<p>WOW man this is really cool post! Can you call me?</p>', 'JAVA, PLUS JAVA', 3, 'published', 0),
(7, 3, 'new post', 'Ihar', '', '2017-05-27', 'roof.jpg', '   dfdgf     ', 'php', 1, 'published', 0),
(8, 3, 'the post after commenting add_post.php post_comment count', 'IHAR PETRUSHENKA', '', '2017-05-27', 'image_5.jpg', 'nice                         \r\n        ', 'php', 1, 'published', 0),
(9, 3, 'Example post 1', 'IHAR PETRUSHENKA', '', '2017-05-28', 'flowers.jpg', '        Great!', 'javascript, course, class, great', 0, 'published', 0),
(12, 3, 'Example post 3', 'IHAR PETRUSHENKA', '', '2017-05-28', 'lambo_1.jpg', 'Great!        \r\n        ', 'php', 0, 'published', 0),
(13, 3, 'This is another post yeah baby, this is cool', 'PHP GUY', '', '2017-06-03', 'image_1.jpg', '        fds', 'Javascript', 0, 'published', 0),
(14, 3, 'just another post', 'Ihar', '', '2017-06-08', 'lambo_1.jpg', 'Just some content', 'hello', 0, 'published', 0),
(15, 1, 'wow, another post :)', 'Ihar', '', '2017-06-11', 'lambo_1.jpg', '<p>This is some content</p>', 'javascript', 0, 'published', 0),
(18, 3, 'CMS PHP course is awesome', 'RON', '', '2017-06-11', 'roof.jpg', '<p><strong>WOW, I really like this course</strong></p>', 'JAVA, PLUS JAVA, PHP', 0, 'published', 0),
(19, 9, 'Javascript', 'Belinda', '', '2017-06-11', 'lambo_1.jpg', '<p>WOW man this is really cool post! Can you call me?</p>', 'JAVA, PLUS JAVA', 0, 'published', 0),
(20, 3, 'just another post', 'Ihar', '', '2017-06-11', 'lambo_1.jpg', 'Just some content', 'hello', 0, 'published', 0),
(21, 1, 'wow, another post :)', 'Ihar', '', '2017-06-11', 'lambo_1.jpg', '<p>This is some content</p>', 'javascript', 0, 'published', 0),
(22, 3, 'just another post', 'Ihar', '', '2017-06-11', 'lambo_1.jpg', 'Just some content', 'hello', 0, 'published', 0),
(23, 1, 'wow, another post :)', 'Ihar', '', '2017-06-11', 'lambo_1.jpg', '<p>This is some content</p>', 'javascript', 0, 'published', 0),
(24, 1, 'wow, another post :)', 'Ihar', '', '2017-06-11', 'lambo_1.jpg', '<p>This is some content</p>', 'javascript', 0, 'published', 0),
(25, 3, 'just another post', 'Ihar', '', '2017-06-11', 'lambo_1.jpg', 'Just some content', 'hello', 0, 'published', 0),
(28, 1, 'TEST 1', '', 'Riconew', '2017-06-17', 'image_1.jpg', '<p>ASDFV</p>', 'DSFDG', 0, 'published', 1),
(29, 1, 'escape', '', 'Riconew', '2017-06-23', 'flowers.jpg', '<p>esrdf</p>', 'aesrdt', 0, 'draft', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL DEFAULT '$2y$10$iusesomecrazystrings22'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`) VALUES
(1, 'rico', '123', 'Rico', 'Suaves', 'ricosuave@gmail.com', '', 'admin', ''),
(2, 'Ihar777', 'Ihar2706', 'Ihar', 'Petrushenka', 'petrushen@yahoo.com', '', 'admin', ''),
(4, 'PETET', 'GDFSD', 'quenchi', 'Peterson', 'petet@gmail.com', '', 'subscriber', ''),
(5, 'funny', 'esrdgf', 'Newuser', 'Gear', 'vcd@hgdf.com', '', 'subscriber', ''),
(6, ' hj', '546878', 'gbhj', 'yjuik', 'tfvbyg@fg.com', '', 'subscriber', ''),
(7, 'whatever', 'fdgfhg', 'w', 'whatever', 'whatever@dfg.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(8, 'gambit', 'hbgvfd', 'gambit', 'good', 'gambit@gmail.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(9, 'newuser', '$1$wvhQxjWI$20JWFRhIt17UFqRVA9gl50', '', '', 'crypt@dfb.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(10, 'Riconew', '$1$tW987Ycm$d9WtZQMT1Me10pAVmPKmO/', 'f', 'f', 'yandex@yahoo.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(11, 'demo2000', '$1$NwaoBI7W$gxM9CUXB1ndL9y8OLEZb2.', '', '', 'gfdfd@dsfdf.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(12, 'Ihar', '123', 'Ihar', 'Petrushenka', 'petrushen@yahoo.com', '', 'admin', '$2y$10$iusesomecrazystrings22'),
(13, 'new_user', '$2y$12$nRVF0I3PlA19TrnVPpwvC..y3mEvREozlmTcYBj.7Yod/mOr7jtcu', '', '', 'petrushen@yahoo.com', '', 'admin', '$2y$10$iusesomecrazystrings22'),
(14, 'new_user2', '$2y$12$5jrk2wWOTUE05CcLKIAYtucaSspkAHTbTj.fF7TZcqOwX/vGmwgkK', '', '', 'petrushen@yahoo.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(15, 'petee', '$2y$10$iunOuLKDrT9YNtVtXm2DGOque8uNPd.C759qYa/lqnyGkdM2O4pfu', 'Pete', 'William', 'petee@gmail.com', '', 'admin', '$2y$10$iusesomecrazystrings22'),
(16, 'demo1', '$2y$10$nLKYb3Ab0XzesvJg1l9eLu01ZUybBpXNOCzl06PGRAqjRZAltpeNK', '', '', '', '', 'subscriber', '$2y$10$iusesomecrazystrings22');

-- --------------------------------------------------------

--
-- Структура таблицы `users_online`
--

CREATE TABLE `users_online` (
  `id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `users_online`
--

INSERT INTO `users_online` (`id`, `session`, `time`) VALUES
(1, 'q4van4aepntebon3tth8o84co3', 1497335923),
(2, 's49l0knoh3o6r9vpaf6gns2732', 1497392837),
(3, 'cpbn7k2lh49nutm4gkh1h8f8d0', 1497392838),
(4, 'ntonfo0f2u73c116802vrb7dg6', 1497423636),
(5, '88u7r2pftm6fjccrlgnpc28o65', 1497702701),
(6, 'h4f9u38aajm91j2h1ne4ss1dm7', 1497736034),
(7, 'c3v5fj3ubpv18jcitt36butfb2', 1498194996),
(8, 'jc9h92nkk69i19fl08heb27cu5', 1498311889);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `post_category_id` (`post_category_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
