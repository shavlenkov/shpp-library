INSERT INTO authors (name)
VALUES
    ('Бхаргава А'),
    ('Роберт Мартин'),
    ('Брюс Эккель'),
    ('Тим Кедлек');
INSERT INTO books (title, description, year, pages, cover, deleted, views, clicks)
VALUES
    ("Грокаем алгоритмы", "sfdsfsfdsfsfd", 2013, 332, '/images/44.jpg', "false", 0, 0),
    ('Чистый код', "sfdsfsfdsfsfd", 2009, 445, '/images/44.jpg', "false", 0, 0),
    ('Философия Java' "sfdsfsfdsfsfd",, 2010, 445, '/images/27.jpg', "false", 0, 0),
    ('Адаптивный дизайн', "sfdsfsfdsfsfd", 2016, 445, '/images/42.jpg', "false", 0, 0);
INSERT INTO books_authors (bookId, authorId)
VALUES
    (1,1),
    (2,2),
    (3,3),
    (4,4);