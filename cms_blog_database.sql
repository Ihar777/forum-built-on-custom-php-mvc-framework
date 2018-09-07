-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Хост: localhost:3306
-- Время создания: Июн 23 2018 г., 02:45
-- Версия сервера: 5.6.39-cll-lve
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `new database`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(3) NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(255) NOT NULL,
  `cat_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `cat_image`) VALUES
(16, 'Javascript', '<i class="fab fa-js fa-lg"></i>'),
(17, 'Laravel', '<i class="fab fa-laravel fa-lg"></i>'),
(18, 'PHP', '<i class="fab fa-php fa-lg"></i>'),
(19, 'CSS', '<i class="fab fa-css3-alt fa-lg"></i>'),
(20, 'SQL', '<i class="fas fa-database fa-lg"></i>'),
(21, 'HTML 5', '<i class="fab fa-html5 fa-lg"></i>'),
(31, 'Wordpress', '<i class="fab fa-wordpress"></i>'),
(32, 'Python', '<i class="fab fa-python"></i>');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(3) NOT NULL AUTO_INCREMENT,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(2, 1, 'Cindy', 'cindy@cindy.com', 'Hey Edwin, you Rock, are you married?', 'unapproved', '2017-05-15'),
(4, 1, 'Ihar Petrushenka', 'petrushen@yahoo.com', 'Nice course', 'approved', '2017-05-16'),
(6, 2, 'tguhij', 'fvhgbj@gvbhjkn.com', 'dcfvghbj', 'approved', '2017-05-16'),
(7, 1, 'htgrfeds', 'hgfds@jhjg.com', 'nhgbdfv', 'approved', '2017-05-16'),
(8, 1, 'Juan', 'bsdhjk@fvd.com', 'bfvdc', 'approved', '2017-05-17'),
(9, 2, 'vsd', 'fvd@fdghgh.com', 'bgdfvd', 'approved', '2017-05-17'),
(10, 2, 'bnvcxz', 'hgbf@vb.com', 'yhfgfd', 'approved', '2017-05-17'),
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
(25, 1, 'me', 'fvdc@fkhdjk.com', 'bgrfvdc', 'approved', '2017-06-04'),
(28, 1, 'Ihar', 'petrushen@yahoo.com', 'nice', 'approved', '2017-06-14'),
(29, 1, 'jmi,k', 'petrushen@yahoo.com', 'byynuh', 'approved', '2017-06-14'),
(30, 25, 'Ihar', 'gdkjfls@gfjkdfl.com', 'cool', 'approved', '2018-03-17'),
(31, 1, 'Ihar', 'petrushen@yahoo.com', 'You are so f...ing right!', 'approved', '2018-03-18'),
(34, 1, 'Ihar', 'petrushen@yahoo.com', 'new comment', 'approved', '2018-03-23'),
(35, 1, 'Ihar', 'petrushen@yahoo.com', 'writing silly comments just for testing purposes :-) :-D', 'approved', '2018-03-24'),
(36, 25, 'Ihar', 'petrushen@yahoo.com', 'ÐŸÐ¾Ñ…Ð¾Ð¶Ð° Ð½Ðµ Ð½Ð° Ñ€ÐµÐ°Ð»ÑŒÐ½ÑƒÑŽ, Ð° Ð½Ð° Ð¸Ð³Ñ€ÑƒÑˆÐµÑ‡Ð½ÑƒÑŽ Ð¼Ð°ÑˆÐ¸Ð½Ñƒ!', 'approved', '2018-03-24'),
(37, 1, 'Ihar', 'petrushen@yahoo.com', 'simply testing after making protection from sql-injection', 'approved', '2018-04-01'),
(38, 8, 'Guestblifs', 'samburton202@aol.co.uk', 'guest test post \r\n<a href=" http://temresults2018.com/ ">bbcode</a> \r\n<a href="http://temresults2018.com/">html</a> \r\nhttp://temresults2018.com/ simple', 'unapproved', '2018-06-10'),
(39, 8, 'Guestblifs', 'samburton202@aol.co.uk', 'guest test post \r\n<a href=" http://temresults2018.com/ ">bbcode</a> \r\n<a href="http://temresults2018.com/">html</a> \r\nhttp://temresults2018.com/ simple', 'unapproved', '2018-06-12'),
(40, 8, 'Cash Advance', 'luise@regiopost.top', 'faxless payday loans <a href="http://loansonline.cars">loan online</a> loans online no credit check http://loansonline.cars - payday loan online', 'unapproved', '2018-06-16'),
(41, 8, 'Get A Loan', 'cortezofelia@mailllc.top', 'dental loans <a href="http://loansonline.cars">how to get a home loan with bad credit</a> cash loans online <a href=http://loansonline.cars>installment loan online</a>', 'unapproved', '2018-06-20'),
(42, 8, 'Money Loan', 'redhot97233@evropost.top', 'loan online <a href="http://loansonline.cars">installment loans online</a> loan online <a href=http://loansonline.cars>lion loans</a>', 'unapproved', '2018-06-20'),
(43, 8, 'Get A Loan', 'millienangel@evropost.top', 'payday loan with no credit check <a href="http://loansonline.cars">online loan</a> loan online http://loansonline.cars - cash loans online', 'unapproved', '2018-06-23');

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(3) NOT NULL AUTO_INCREMENT,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_user` varchar(255) NOT NULL,
  `post_date` datetime NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL DEFAULT '0',
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL,
  `likes` int(11) DEFAULT '0',
  `dislikes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `post_category_id` (`post_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_user`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`, `likes`, `dislikes`) VALUES
(1, 18, 'CMS PHP course is awesome', 'RON', 'RON', '2018-05-05 07:37:32', 'London.jpg', '<p><i><strong>WOW, I really like this course. You''d better not waste your time and join in.</strong></i></p>', 'JAVA, PLUS JAVA, PHP', 4, 'published', 311, 123462, 123463),
(8, 18, 'the post after commenting add_post.php post_comment count', 'IHAR PETRUSHENKA', 'IHAR PETRUSHENKA', '2018-05-05 07:37:23', 'architecture.jpg', '<p>Vivamus lectus dui, interdum et ligula eu, accumsan iaculis orci. Fusce sed congue nunc. Cras lacinia magna quam. Praesent a ultrices ex. Aliquam erat volutpat. Duis vitae malesuada tellus. Donec id tristique nulla. Sed pulvinar dapibus ante, vel bibendum leo. Proin semper aliquam est ultricies cursus. Curabitur tempor luctus orci sed bibendum. Proin vulputate mattis ligula, nec elementum quam luctus ut. Proin pharetra blandit eleifend. Sed sodales tortor vel vestibulum pellentesque. Mauris lobortis vestibulum turpis. In in feugiat massa, dapibus imperdiet ligula.</p>', 'php', 1, 'published', 143, 131, 132),
(9, 18, 'Example post 1', 'IHAR PETRUSHENKA', 'IHAR PETRUSHENKA', '2018-05-05 07:37:12', 'flowers.jpg', '<p>Donec non tortor et nisi maximus vehicula nec nec purus. Suspendisse in congue orci. Aliquam blandit viverra enim. Maecenas facilisis purus porttitor odio facilisis, at aliquet tellus porta. Quisque dapibus ornare justo, vel eleifend nisi laoreet vitae. Mauris tempor leo nec velit laoreet, sed posuere magna scelerisque. Aenean elementum facilisis nisl, vitae condimentum odio eleifend eu. Nunc ac lacus sed leo porta pretium a eu dolor. Vestibulum porttitor tortor tincidunt erat convallis, at commodo velit egestas. Cras sed euismod risus, ac mollis leo. Proin elementum eros a libero condimentum, a laoreet nisi lacinia.</p>', 'javascript, course, class, great', 0, 'published', 67, 129, 130),
(12, 18, 'Php example post', 'IHAR PETRUSHENKA', 'IHAR PETRUSHENKA', '2018-05-05 07:37:03', 'lambo_1.jpg', '<p>In lobortis urna a laoreet convallis. Aenean bibendum mattis diam in bibendum. Duis ornare diam eget nisl condimentum pellentesque iaculis id purus. Vestibulum quam nunc, iaculis at mattis nec, euismod ac ligula. In vestibulum, nisl sed euismod finibus, ante elit venenatis augue, vel vestibulum purus enim id massa. Duis est nulla, fermentum sed diam sed, condimentum dignissim sapien. Aliquam auctor accumsan accumsan. Nam bibendum nec risus sit amet mollis. Integer orci sapien, facilisis eu lobortis vitae, dignissim sed dui. Suspendisse enim nisi, aliquet non rhoncus gravida, fringilla vitae diam. In at ultrices arcu. Vestibulum at congue odio, quis sodales nulla. Curabitur ac mollis lectus. Nullam nec enim id ex ultricies fringilla.</p>', 'php', 0, 'published', 69, 130, 131),
(13, 18, 'This is another post. It will make you stop and stare at it in admiration', 'PHP GUY', 'Ihar', '2018-05-05 07:36:52', 'magnet.jpg', '<p>Curabitur id odio lectus. Sed vel dui id tellus malesuada pulvinar eget eget erat. Integer convallis mollis tellus ut condimentum. Aliquam vitae nisl non eros pellentesque luctus. Suspendisse potenti. Aliquam scelerisque laoreet porttitor. Sed sit amet turpis libero. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque vestibulum, mauris fermentum volutpat iaculis, ex quam maximus nunc, et consectetur ipsum enim ut quam. Ut bibendum lorem dignissim auctor pretium.</p><p>&nbsp;</p>', 'Javascript', 0, 'published', 59, 130, 131),
(14, 18, 'just another post', 'Ihar', 'Ihar', '2018-05-05 07:36:40', 'elephant.jpg', '<p>Aliquam erat volutpat. Suspendisse tempus dui lectus, sodales feugiat nulla fringilla in. Proin semper sodales elementum. Curabitur posuere consequat laoreet. Aenean fringilla ligula non risus fringilla faucibus. Proin purus orci, vulputate eu ullamcorper id, gravida sit amet sem. Etiam vitae cursus lacus, ac pharetra risus. Pellentesque porttitor euismod tellus, ac tincidunt tellus luctus eu. Suspendisse potenti. Curabitur sit amet sem porttitor dolor condimentum feugiat. Sed hendrerit commodo purus sit amet tristique. Fusce sagittis, odio eu elementum efficitur, nibh leo varius arcu, in ullamcorper velit ex sed augue. Phasellus hendrerit urna ut massa consectetur hendrerit. Ut consectetur id erat in egestas.</p>', 'hello', 0, 'published', 35, 131, 132),
(18, 18, 'CMS PHP course is awesome', 'RON', 'RON', '2018-05-05 07:36:26', 'roof.jpg', '<p>Sed eget aliquet felis. Quisque scelerisque ante vel lorem auctor, eget faucibus risus porta. Phasellus quis euismod turpis. In sit amet leo eget nibh condimentum porttitor. Suspendisse massa risus, vehicula sit amet libero vitae, hendrerit lobortis nunc. Sed convallis magna at neque ultricies, in venenatis risus convallis. Vestibulum vulputate vehicula sagittis. Phasellus tellus nisl, ultrices et sem quis, semper consectetur ipsum. Quisque augue nunc, pulvinar a sapien mattis, tempor scelerisque risus. Sed mattis aliquet dapibus. Vivamus fringilla, diam at consectetur facilisis, turpis nibh scelerisque turpis, a fringilla sapien arcu ac orci. Nam pulvinar, risus posuere semper interdum, lorem lacus condimentum libero, et viverra leo quam in quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed ex tellus, congue quis diam a, dignissim faucibus felis. Donec aliquam quam eget cursus finibus.</p><p>Pellentesque sodales cursus scelerisque. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse ornare elit odio, ultrices rhoncus purus commodo vel. Curabitur est metus, rutrum nec viverra id, dignissim sagittis odio. Maecenas id tristique dolor. Nunc magna est, porttitor in est eu, pharetra finibus nunc. Fusce sodales lectus dolor, in fermentum felis pulvinar sit amet. Pellentesque sagittis iaculis quam, vitae volutpat enim. Morbi mollis suscipit dapibus. Vivamus vel tristique metus, at auctor nisi. Sed laoreet auctor turpis, quis dictum augue varius id. Vivamus fermentum orci ut maximus imperdiet. Duis sit amet lacus ac risus consectetur blandit eu non sapien. Vivamus ac lorem non libero posuere lacinia. Aliquam erat volutpat.</p><p>Quisque vitae ipsum at eros auctor luctus. Ut porttitor congue tincidunt. Vivamus rhoncus lectus ut diam accumsan iaculis. Vivamus eu odio vitae nibh ornare placerat. Mauris eu arcu quis libero finibus varius et quis augue. Phasellus at diam euismod, convallis ipsum ut, placerat massa. Morbi condimentum luctus est. Vivamus erat nunc, fringilla et cursus a, maximus nec sem. Vestibulum pharetra nibh id lacus mollis, eget vulputate lectus pretium. Integer diam arcu, rutrum id laoreet in, sollicitudin ultrices lectus. Quisque leo turpis, consectetur in dignissim at, consectetur vel lacus.</p>', 'JAVA, PLUS JAVA, PHP', 0, 'published', 33, 133, 134),
(23, 31, 'wow, another post :)', 'Ihar', 'Ihar', '2018-05-05 07:36:14', 'lambo_1.jpg', '<p>In my humble opinion (imho) this post is really awesome:))&nbsp; The author seems to be very good at solving different kinds of problems and helps people to become happy.</p>', 'javascript', 0, 'published', 30, 133, 134),
(25, 16, 'just another post', 'Ihar', 'Ihar', '2018-05-05 07:36:03', 'aston.jpg', '<p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 'javascript ajax', 0, 'published', 88, 135, 136),
(28, 31, 'Bootstrap is awesome', 'Ihar', 'Riconew', '2018-05-05 07:35:47', 'image_1.jpg', '<h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 'bootstrap', 0, 'published', 31, 135, 135),
(29, 31, 'Just some useless data', 'Ihar', 'Riconew', '2018-05-05 07:35:34', 'flowers.jpg', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\\\\''s standard dummy text ever since the 1500s, when an <i><strong>unknown printer</strong></i> took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'programming language', 0, 'published', 46, 137, 138),
(30, 18, 'Cheer up!', 'Ihar', 'Ihar', '2018-05-07 10:44:50', 'image5.jpg', '<p>I''ve never been to San-Francisco. Moreover, I''ve never been to the United States. Nevertheless, Dominican Republic, which is situated not far from the United States, has left unforgettable impressions in my mind.</p>', 'USA, Golden Gates, Frisco, San-Francisco, beach, nature, beauty', 0, 'published', 14, 137, 137),
(31, 19, 'Just some dummy data for testing purposes', 'Ihar', 'Ihar', '2018-05-06 04:59:54', 'image1.jpg', '<p>Belarusian people feel uncomfortable while visiting developed countries as tourists. The reason is that they understand that they are poor if compared with native citizens and can''t afford spending freely on a daily basis as much money as, for example people, living in the U.S.A, Germany, France, Great Britain, Canada and so on.</p>', 'ocean, surfboard, USA', 0, 'published', 28, 9500004, 9500005),
(32, 16, 'It''s getting better all the time', 'Ihar', 'Ihar', '2018-05-06 13:09:48', 'image2.jpg', '<h2><i>I&nbsp;shot&nbsp;an&nbsp;Arrow&nbsp;into&nbsp;the&nbsp;air</i></h2><p>I shot an Arrow into the air</p><p>It fell to earth I knew not where,</p><p>For so swiftly it flew, the sight</p><p>Could not follow it in its flight.</p><p>I breathed a Song into the air</p><p>It fell to earth, I knew not where.</p><p>For who has sight so keen and strong</p><p>That it can follow the flight of a song?</p><p>Long, long afterward in an oak</p><p>I found the Arrow still unbroke;</p><p>And the Song from begining to end</p><p>I found again in the heart of a friend.</p>', '', 0, 'published', 29, 140, 141),
(33, 31, 'Just some useless data', 'Ihar', 'Riconew', '2018-05-05 07:34:24', 'flowers.jpg', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\''s standard dummy text ever since the 1500s, when an <i><strong>unknown printer</strong></i> took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'programming language', 0, 'published', 15, 141, 142),
(34, 17, 'It''s getting better all the time', 'Ihar', 'Ihar', '2018-05-06 13:08:43', 'image2.jpg', '<h2><i>I&nbsp;shot&nbsp;an&nbsp;Arrow&nbsp;into&nbsp;the&nbsp;air</i></h2><p>I shot an Arrow into the air</p><p>It fell to earth I knew not where,</p><p>For so swiftly it flew, the sight</p><p>Could not follow it in its flight.</p><p>I breathed a Song into the air</p><p>It fell to earth, I knew not where.</p><p>For who has sight so keen and strong</p><p>That it can follow the flight of a song?</p><p>Long, long afterward in an oak</p><p>I found the Arrow still unbroke;</p><p>And the Song from begining to end</p><p>I found again in the heart of a friend.</p>', '', 0, 'published', 28, 142, 143),
(35, 18, 'Social Network', 'Ihar', 'Ihar', '2018-05-12 09:17:16', 'social network.png', '<p><a href="http://iharpetrushenka.com/socialnetwork/register.php">Social Network</a> - Social network with a yet to be improved design. &nbsp;</p><p>&nbsp;</p>', 'php, social network, javascript, html, jquery', 0, 'published', 27, 4, 5),
(45, 18, 'Just a Song', 'Ihar', 'Ihar', '2018-05-13 00:17:28', 'good.jpg', '<br><iframe width=''640'' height=''480'' src=''https://www.youtube.com/embed/ikGyZh0VbPQ''></iframe><br>', 'tags', 0, 'published', 22, 3, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(3) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL DEFAULT '$2y$10$iusesomecrazystrings22',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`) VALUES
(4, 'PETET', '$2y$12$0E7wcUmy9wGouqTHzpIece5mmwHOf58jJ5fk/wgVHN9zN8kJBxxFy', 'James', 'Peterson', 'petet@gmail.com', '', 'subscriber', ''),
(5, 'funny', 'esrdgf', 'Newuser', 'Gear', 'vcd@hgdf.com', '', 'subscriber', ''),
(7, 'whatever', 'fdgfhg', 'w', 'whatever', 'whatever@dfg.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(8, 'gambit', 'hbgvfd', 'gambit', 'good', 'gambit@gmail.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(9, 'newuser', '$1$wvhQxjWI$20JWFRhIt17UFqRVA9gl50', '', '', 'crypt@dfb.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(10, 'Riconew', '$1$tW987Ycm$d9WtZQMT1Me10pAVmPKmO/', 'f', 'f', 'yandex@yahoo.com', '', 'admin', '$2y$10$iusesomecrazystrings22'),
(11, 'demo2000', '$1$NwaoBI7W$gxM9CUXB1ndL9y8OLEZb2.', '', '', 'gfdfd@dsfdf.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(15, 'petee', '$2y$10$iunOuLKDrT9YNtVtXm2DGOque8uNPd.C759qYa/lqnyGkdM2O4pfu', 'Pete', 'William', 'petee@gmail.com', '', 'admin', '$2y$10$iusesomecrazystrings22'),
(18, 'rico', '$2y$12$HOcdarBn1vd/Eb4cqfM7IuZCkkgCllsCPDV7iYN5w3BQIn8h/r35e', '', '', 'dfsd@dfdgf.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(19, 'rico', '$2y$12$RM/23hr82zCfa5LfSu.e6e7gno1wRDcsq6fTPv/l8DjcoamGT0zyC', '', '', 'dfsd@dfdgf.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(20, 'usernewlycreated', '$2y$12$Ma4wLSwsKiidf7JpHjcgUeaMaT5r4Wdgxgu7cAXQcrGWEJWS67CrC', '', '', 'jsfdka@fjn.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(21, 'edwindiaz', '$2y$12$0o0mWd7mZTg61QjycrmTjefeEYS1DPHr5T6JsFEBn2l0KKefihcB.', '', '', 'edwindiaz@nijfdkmsd.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(23, 'fockers', '$2y$12$fj1GFyxYBoWOvdKYTbCpOuGAp/bS3NrdxPcx3.T9PaBYoB/8xlUF6', '', '', 'ghdfkjs@hfjd.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(26, 'Ihar', '$2y$12$MJQNDbSpEarOzm8f.3TC..TAvDHL/3rN8xG9VqCHd7Gu.RBJ8.z7q', 'Ihar', 'Petrushenka', 'petrushen@yahoo.com', '''images/avatar.png''', 'admin', '$2y$10$iusesomecrazystrings22');

-- --------------------------------------------------------

--
-- Структура таблицы `users_online`
--

CREATE TABLE IF NOT EXISTS `users_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

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
(8, 'jc9h92nkk69i19fl08heb27cu5', 1498311889),
(9, 'b9da1ncljj2gfml3fsdtptl604', 1498854131),
(10, 'bj07g8gpro9gb1fs27s1iega06', 1498909968),
(11, '4kaotkv3pjgk14dli46ah1k176', 1498944895),
(12, 'n355akld8ksbt3bplgpdt6dai2', 1499002364),
(13, '4oi724p7vhafdnd4p3spk4c9m1', 1499039337),
(14, 'hulhcng1gnmhggbuo9opgsmee5', 1499078127),
(15, 'mfitgu80391r16qpgsehugbte0', 1499098023),
(16, '1235a25dda7c42ed420a1cccbfd4a664', 1499109174),
(17, '7e4pqb0o10mes1rjhom8djc937', 1521315355),
(18, 'ic4r48tc6k3bkuapndjbb5tu06', 1521376103);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
