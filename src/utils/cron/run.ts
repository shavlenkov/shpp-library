import cron from 'node-cron';
import dotenv from 'dotenv';
import mysqldump from 'mysqldump';

dotenv.config({path:'.env'});

const {
    MYSQL_HOST,
    MYSQL_USER,
    MYSQL_PASSWORD,
    MYSQL_DB
} = process.env;


export  async function runCron() {
    cron.schedule('* 9 * * *',  async () => {
        await mysqldump({
            connection:{
                host: MYSQL_HOST|| "",
                user: MYSQL_USER|| "",
                password: MYSQL_PASSWORD|| "",
                database: MYSQL_DB|| "",
            },
            dumpToFile:`src/database/backup.sql`,
        });
    });



}