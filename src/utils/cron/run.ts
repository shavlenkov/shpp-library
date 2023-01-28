import cron from 'node-cron';
import dotenv from 'dotenv';
import mysqldump from 'mysqldump';
import connect from "../../database/connection";
import {RowDataPacket} from "mysql2";

dotenv.config({path:'./.env'});

const {
    MYSQL_HOST,
    MYSQL_USER,
    MYSQL_PASSWORD,
    MYSQL_DB
} = process.env;

export  async function runCron() {

    cron.schedule('* * * * *',  async () => {
        await mysqldump({
            connection:{
                host: MYSQL_HOST|| "",
                user: MYSQL_USER|| "",
                password: MYSQL_PASSWORD|| "",
                database: MYSQL_DB|| "",
            },
            dumpToFile: `src/database/backup.sql`,
        });

    });

    cron.schedule('* 10 * * *',  async () => {

        let sqlDeleteBook = `DELETE FROM books WHERE deleted='true'`;

        let deleteBook = (await connect.promise().query(sqlDeleteBook)) as RowDataPacket;

    });

}