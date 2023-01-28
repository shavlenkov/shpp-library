CREATE TABLE IF NOT EXISTS  authors (
    ID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS books (
    ID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    year int NOT NULL,
    pages int NOT NULL,
    cover varchar(255) NOT NULL,
    deleted varchar(7) NOT NULL,
    views int NOT NULL,
    clicks int NOT NULL
);
CREATE TABLE IF NOT EXISTS books_authors (
    book_id INT,
    author_id INT,
    CONSTRAINT `book_id` FOREIGN KEY (book_id) REFERENCES books (ID) ON DELETE CASCADE,
    CONSTRAINT `author_id` FOREIGN KEY (author_id) REFERENCES authors (ID) ON DELETE CASCADE
);