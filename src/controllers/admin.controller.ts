import { Request, Response } from 'express'
import fs from 'fs'

import connect from '../database/connection';
import { RowDataPacket } from 'mysql2';
import cron from 'node-cron';
import mysqldump from 'mysqldump';

import { MulterRequest } from '../interfaces/multer.interface';
import { Book } from '../interfaces/books.interface';

export async function getBooks(req: Request, res: Response) {

    let sqlGetBooks = `
    SELECT * FROM books_authors 
    JOIN books ON books_authors.book_id=books.ID
    JOIN authors ON books_authors.author_id=authors.ID
    `

    let resBooks = (await connect.promise().query(sqlGetBooks)) as RowDataPacket;

    const offset: number = 4;

    const pag = !req.query.pag ? 1 : req.query.pag;

    const allBooks = resBooks[0];

    const books: Book[] = allBooks.slice((Number(pag) * offset) - offset, Number(pag) * offset);

    return res.render('admin', {books: books, booksLength: allBooks.length, offset: offset})

}

export async function createBook(req: Request, res: Response) {

    let {title, description, year, pages, authors} = req.body;
    let {filename} = (req as MulterRequest).file;

    let strAuthors = authors.join(',').replace(/^[,\s]+|[,\s]+$/g, '').replace(/,[,\s]*,/g, ',');

    let createAuthor  = (await connect.promise().query('INSERT INTO authors (name) VALUES (?)', [strAuthors])) as RowDataPacket;
    let createBook  = (await connect.promise().query('INSERT INTO books (title, description, year, pages, cover, deleted, views, clicks) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
        [title, description, year, pages , "/images/" + filename ,"false", 0, 0])) as RowDataPacket;

    const createBookAuthor = (await connect.promise().query('INSERT INTO books_authors (book_id, author_id) VALUES (?, ?)', [createAuthor[0].insertId, createBook[0].insertId]))

}

export async function deleteBook(req: Request, res: Response) {
    let { id } = req.params;

    let sqlMarkBook = `UPDATE books SET deleted="true" WHERE ID=${id}`

    let markBook = (await connect.promise().query(sqlMarkBook)) as RowDataPacket;

    return res.send({'ok': true});

}