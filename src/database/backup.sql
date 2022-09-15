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
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8;

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
  `views` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `books_authors` (
  `bookId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  KEY `book_id` (`bookId`),
  KEY `author_id` (`authorId`),
  CONSTRAINT `author_id` FOREIGN KEY (`authorId`) REFERENCES `authors` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `book_id` FOREIGN KEY (`bookId`) REFERENCES `books` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: authors
# ------------------------------------------------------------

INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (1, '132321,32321,312123');
INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (2, 'sdaasd,sdaasd,dasd');
INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (3, 'Бхаргава А');
INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (4, 'Роберт Мартин');
INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (5, 'Брюс Эккель');
INSERT INTO
  `authors` (`ID`, `name`)
VALUES
  (6, 'Тим Кедлек');

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
    `views`,
    `clicks`
  )
VALUES
  (
    1,
    'asdas',
    '132132',
    23312,
    12312,
    '/images/Price-1 (5).png',
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
    `views`,
    `clicks`
  )
VALUES
  (
    2,
    'xzcasd',
    '21',
    2,
    21,
    '/images/Discover-sajek-valley 2.png',
    3,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

INSERT INTO
  `books_authors` (`bookId`, `authorId`)
VALUES
  (1, 1);
INSERT INTO
  `books_authors` (`bookId`, `authorId`)
VALUES
  (2, 2);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
