/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: authors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `authors` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: books
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `books` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `pages` int(11) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `deleted` varchar(7) NOT NULL,
  `views` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `books_authors` (
  `book_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  KEY `book_id` (`book_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`ID`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: authors
# ------------------------------------------------------------

INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (1, 'Марк Саммерфильд');
INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (2, 'Уэс Маккинни');
INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (3, 'Роберт Мартин');
INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (4, 'Сэмюэл Грингард');
INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (5, 'Гэри Маклин Холл');
INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (6, 'Тим Кедлек');
INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (7, 'Белов А.В');
INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (8, 'Андрей Богуславский');
INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (9, 'Джереми Блум');
INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (10, 'Брюс Эккель');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books
# ------------------------------------------------------------

INSERT INTO
  `books` (
    `ID`,
    `title`,
    `description`,
    `year`,
    `pages`,
    `cover`,
    `deleted`,
    `views`,
    `clicks`
  )
VALUES
  (
    1,
    'Программирование на языке Go',
    'Программирование на языке Go',
    2015,
    215,
    '/images/23.jpg',
    'false',
    0,
    0
  );
INSERT INTO
  `books` (
    `ID`,
    `title`,
    `description`,
    `year`,
    `pages`,
    `cover`,
    `deleted`,
    `views`,
    `clicks`
  )
VALUES
  (
    2,
    'Python и анализ данных',
    'Python и анализ данных',
    2009,
    349,
    '/images/26.jpg',
    'false',
    0,
    0
  );
INSERT INTO
  `books` (
    `ID`,
    `title`,
    `description`,
    `year`,
    `pages`,
    `cover`,
    `deleted`,
    `views`,
    `clicks`
  )
VALUES
  (
    3,
    'Чистый код',
    'Чистый код',
    2013,
    310,
    '/images/44.jpg',
    'false',
    0,
    0
  );
INSERT INTO
  `books` (
    `ID`,
    `title`,
    `description`,
    `year`,
    `pages`,
    `cover`,
    `deleted`,
    `views`,
    `clicks`
  )
VALUES
  (
    4,
    'Интернет вещей',
    'Интернет вещей',
    2017,
    252,
    '/images/39.jpg',
    'false',
    0,
    0
  );
INSERT INTO
  `books` (
    `ID`,
    `title`,
    `description`,
    `year`,
    `pages`,
    `cover`,
    `deleted`,
    `views`,
    `clicks`
  )
VALUES
  (
    5,
    'Адаптивный код на C#',
    'Адаптивный код на C#',
    2016,
    345,
    '/images/32.jpg',
    'true',
    0,
    0
  );
INSERT INTO
  `books` (
    `ID`,
    `title`,
    `description`,
    `year`,
    `pages`,
    `cover`,
    `deleted`,
    `views`,
    `clicks`
  )
VALUES
  (
    6,
    'Адаптивный дизайн',
    'Адаптивный дизайн',
    2018,
    192,
    '/images/42.jpg',
    'false',
    0,
    0
  );
INSERT INTO
  `books` (
    `ID`,
    `title`,
    `description`,
    `year`,
    `pages`,
    `cover`,
    `deleted`,
    `views`,
    `clicks`
  )
VALUES
  (
    7,
    'Программирование микроконтроллеров',
    'Программирование микроконтроллеров',
    2018,
    284,
    '/images/38.jpg',
    'false',
    0,
    0
  );
INSERT INTO
  `books` (
    `ID`,
    `title`,
    `description`,
    `year`,
    `pages`,
    `cover`,
    `deleted`,
    `views`,
    `clicks`
  )
VALUES
  (
    8,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    2015,
    252,
    '/images/22.jpg',
    'false',
    0,
    0
  );
INSERT INTO
  `books` (
    `ID`,
    `title`,
    `description`,
    `year`,
    `pages`,
    `cover`,
    `deleted`,
    `views`,
    `clicks`
  )
VALUES
  (
    9,
    'Философия Java',
    'Философия Java',
    2014,
    462,
    '/images/27.jpg',
    'false',
    0,
    0
  );
INSERT INTO
  `books` (
    `ID`,
    `title`,
    `description`,
    `year`,
    `pages`,
    `cover`,
    `deleted`,
    `views`,
    `clicks`
  )
VALUES
  (
    10,
    'Изучаем Arduino',
    'Изучаем Arduino',
    2017,
    182,
    '/images/37.jpg',
    'false',
    0,
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

INSERT INTO
  `books_authors` (`book_id`, `author_id`)
VALUES
  (1, 1);
INSERT INTO
  `books_authors` (`book_id`, `author_id`)
VALUES
  (2, 2);
INSERT INTO
  `books_authors` (`book_id`, `author_id`)
VALUES
  (3, 3);
INSERT INTO
  `books_authors` (`book_id`, `author_id`)
VALUES
  (4, 4);
INSERT INTO
  `books_authors` (`book_id`, `author_id`)
VALUES
  (5, 5);
INSERT INTO
  `books_authors` (`book_id`, `author_id`)
VALUES
  (6, 6);
INSERT INTO
  `books_authors` (`book_id`, `author_id`)
VALUES
  (7, 7);
INSERT INTO
  `books_authors` (`book_id`, `author_id`)
VALUES
  (8, 8);
INSERT INTO
  `books_authors` (`book_id`, `author_id`)
VALUES
  (9, 9);
INSERT INTO
  `books_authors` (`book_id`, `author_id`)
VALUES
  (10, 10);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
