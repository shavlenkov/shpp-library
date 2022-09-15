import express from 'express';
const router = express.Router()

import {
    getBooks,
    getBook,
    clickBtn
} from '../controllers/books.controller';

router.route("/books").get(getBooks)
router.route(`/books/:id`).get(getBook)
router.route(`/books/:id`).post(clickBtn)

export default router;