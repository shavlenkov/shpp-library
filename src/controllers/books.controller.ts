import { Request, Response } from 'express'
import fs from 'fs'

import connect from '../database/connection';
import { RowDataPacket } from "mysql2";

import { Book } from '../interfaces/books.interface';

export async function getBooks(req: Request, res: Response) {

    let search = !req.query.search ? "" : req.query.search

    let {year, author} = req.query;

    let sqlGetBooks = `SELECT * FROM books_authors 
    JOIN books ON books_authors.book_id=books.ID
    JOIN authors ON books_authors.author_id=authors.ID
    WHERE books.deleted="false" AND (books.title LIKE '%${search}%')
    `

    if(year) {
        sqlGetBooks += ` AND year=${year}`
    }

    if(author) {
        sqlGetBooks += ` AND author_id=${author}`
    }

    let resBooks = (await connect.promise().query(sqlGetBooks)) as RowDataPacket;

    const offset = !req.query.offset ? 2 : Number(req.query.offset);

    const allBooks = resBooks[0];

    let books: Book[] = allBooks.slice(0, offset);

    if(offset < 1) {
        books = []
    }

    res.render('books', {books: books, booksLength: allBooks.length, offset: offset})

}

export async function getBook(req: Request, res: Response) {

    let { id } = req.params;

    const sqlViews = `
    UPDATE books SET views = views + 1 WHERE ID=${id} 
    `
    const update = (await connect.promise().query(sqlViews)) as RowDataPacket;

    const sqlGetBook = `
    SELECT * FROM books_authors
    JOIN books ON books_authors.book_id=books.ID
    JOIN authors ON books_authors.author_id=authors.ID
    WHERE book_id=${id}
    `

    const resBook = (await connect.promise().query(sqlGetBook)) as RowDataPacket;

    const book: Book = resBook[0][0];

    res.render('book', {book: book})
}

export async function clickBtn(req: Request, res: Response) {
    let { id } = req.params;

    const sqlClickOnBook = `
    UPDATE books SET clicks = clicks + 1 WHERE ID=${id} 
    `
    const update = (await connect.promise().query(sqlClickOnBook)) as RowDataPacket;

    return res.send({"ok": true})
}