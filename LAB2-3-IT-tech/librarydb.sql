-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 27 2022 г., 17:23
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `librarydb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `ID_Authors` int(11) NOT NULL,
  `Author_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`ID_Authors`, `Author_name`) VALUES
(0, 'Tiffany Hampton'),
(1, 'Charles Walker'),
(2, 'James Sanchez'),
(3, 'Beth Nelson'),
(4, 'Mary Warren'),
(5, 'Gregory Baker'),
(6, 'Vivian Scott'),
(7, 'Wayne Meyer'),
(8, 'Jane Jones'),
(9, 'Robert Roberts'),
(10, 'Jace Davis');

-- --------------------------------------------------------

--
-- Структура таблицы `book_authors`
--

CREATE TABLE `book_authors` (
  `FID_Book` int(11) NOT NULL,
  `FID_Authors` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book_authors`
--

INSERT INTO `book_authors` (`FID_Book`, `FID_Authors`) VALUES
(0, 1),
(1, 0),
(2, 10),
(3, 1),
(2, 2),
(5, 4),
(7, 8),
(4, 5),
(6, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `literature`
--

CREATE TABLE `literature` (
  `ID_Book` int(11) NOT NULL,
  `name` text NOT NULL,
  `date` date DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `publisher` text DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `ISBN` text DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `literate` text NOT NULL,
  `FID_Resourse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `literature`
--

INSERT INTO `literature` (`ID_Book`, `name`, `date`, `year`, `publisher`, `quantity`, `ISBN`, `number`, `literate`, `FID_Resourse`) VALUES
(0, 'Guardian Of Destruction', '1993-04-05', 1996, 'Publisher0', 562, '125-1587-12', 100, 'Book', 0),
(1, 'Sword Of Freedom', '2005-12-24', 1994, 'Publisher1', 176, '123-384-66', 101, 'Juornal', 1),
(2, 'Source Of Hope', '2001-02-08', 2003, 'Publisher3', 199, '331-588-31', 102, 'Newspaper', 0),
(3, 'Foe Of Sorrow', '1973-12-05', 1982, 'Publisher3', 690, '127-987-75', 103, 'Newspaper', 2),
(4, 'Savior Of Stone', '1970-06-12', 1965, 'Publisher4', 252, '175-1879-45', 104, 'Book', 1),
(5, 'Serpents Of Heaven', '2020-02-19', 2010, 'Publisher5', 91, '645-3452-63', 105, 'Book', 2),
(6, 'Design Of Glory', '2015-08-11', 2001, 'Publisher6', 808, '212-6311-32', 106, 'Juornal', 0),
(7, 'Serpent Of Dread', '1997-01-03', 1999, 'Publisher8', 944, '432-4231-12', 107, 'Newspaper', 2),
(8, 'Sword With Wings', '1974-12-19', 1992, 'Publisher9', 497, '87-983-21', 108, 'Book', 1),
(9, 'Warrior Of Dreams', '1989-01-01', 1981, 'Publisher10', 287, '213-871-89', 109, 'Book', 0),
(10, 'Element Of The Void', '2002-03-30', 2012, 'Publisher11', 389, '93-546-77', 110, 'Newspaper', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `resourse`
--

CREATE TABLE `resourse` (
  `ID_Resourse` int(11) NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `resourse`
--

INSERT INTO `resourse` (`ID_Resourse`, `title`) VALUES
(0, 'website'),
(1, 'webtest'),
(2, 'webidk');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD UNIQUE KEY `ID_Authors` (`ID_Authors`),
  ADD KEY `name` (`Author_name`(255));

--
-- Индексы таблицы `book_authors`
--
ALTER TABLE `book_authors`
  ADD KEY `FID_Authors` (`FID_Authors`),
  ADD KEY `FID_Book` (`FID_Book`);

--
-- Индексы таблицы `literature`
--
ALTER TABLE `literature`
  ADD PRIMARY KEY (`ID_Book`) USING BTREE,
  ADD KEY `FID_Resourse` (`FID_Resourse`);

--
-- Индексы таблицы `resourse`
--
ALTER TABLE `resourse`
  ADD UNIQUE KEY `ID_Resourse` (`ID_Resourse`),
  ADD KEY `ID_Resourse_2` (`ID_Resourse`),
  ADD KEY `ID_Resourse_3` (`ID_Resourse`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`FID_Authors`) REFERENCES `authors` (`ID_Authors`),
  ADD CONSTRAINT `book_authors_ibfk_2` FOREIGN KEY (`FID_Book`) REFERENCES `literature` (`ID_Book`);

--
-- Ограничения внешнего ключа таблицы `literature`
--
ALTER TABLE `literature`
  ADD CONSTRAINT `literature_ibfk_1` FOREIGN KEY (`FID_Resourse`) REFERENCES `resourse` (`ID_Resourse`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
