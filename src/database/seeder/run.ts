import fs from 'fs';
import connect from '../connection';
import { RowDataPacket } from 'mysql2';
import chalk from 'chalk';

const sqlRunMigration = fs.readFileSync(__dirname + '/seeder.sql').toString().split(';\r\n');

let i = 0;

let interval = setInterval(function () {

    connect.query(sqlRunMigration[i], (error) => {
        if(error) {
            console.log(error)
            connect.end()
        } else {
            console.log(chalk.bgGreen('[SEEDER]'), chalk.green('Seeder process successful'));
        }

        if(i == 3) {
            connect.end()
            clearInterval(interval)
        }
    })

    i++;

}, 2000);






