import express from 'express'
import cors from 'cors';

import routerBooks from './routes/books.route';
import routerAdmin from './routes/admin.route';

import BasicAuth from './middleware/auth.middleware';

import { runCron } from './utils/cron/run'

runCron();

const app = express();

const host:string = '127.0.0.1';
const port:number  = 3000;

app.set('views', __dirname + '/views')
app.set('view engine', 'pug')

app.use(cors({
    origin: 'http://localhost:3000',
    methods: ['PUT', 'DELETE'],
    credentials: true
}))

app.use(express.json());

app.use(
    express.static("./src/public")
);

app.use('/', routerBooks)
app.use('/admin', BasicAuth, routerAdmin)

app.listen(port, host, function () {
    console.log(`Server listens http://${host}:${port}`);
});
