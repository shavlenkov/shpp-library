import express from 'express';
const router = express.Router()

import multer from 'multer';

const storageConfig = multer.diskStorage({
    destination: (req, file, cb) =>{
        cb(null, "./src/public/images");
    },
    filename: (req, file, cb) =>{
        cb(null, file.originalname);
    }
});

const upload = multer({ storage: storageConfig })

import {
    getBooks,
    createBook,
    deleteBook
} from '../controllers/admin.controller';

router.route("/books").get(getBooks);
router.route("/books/create").post(upload.single('avatar'), createBook);
router.route("/books/:id/delete").delete(deleteBook);

export default router