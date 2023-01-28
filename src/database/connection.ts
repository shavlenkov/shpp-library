import mysql from 'mysql2'
import dotenv from 'dotenv'
import chalk from "chalk";

dotenv.config({ path: './.env' });

const {
    MYSQL_HOST,
    MYSQL_USER,
    MYSQL_PASSWORD,
    MYSQL_DB
} = process.env;

const connect = mysql.createPool({
    host: MYSQL_HOST,
    user: MYSQL_USER,
    password: MYSQL_PASSWORD,
    database: MYSQL_DB
});

connect.getConnection(function(err) {
    if (err) {
        console.log(err.message);
    } else {
        console.log(chalk.bgGreen('[DATABASE]'), chalk.green('Connected to DB'));
    }
});

export default connect;