import fs from 'fs';
import connect from '../../connection';
import chalk from 'chalk';
import { RowDataPacket } from 'mysql2';

const sqlRunMigration = fs.readFileSync(__dirname + '/run.sql').toString().split(';\r\n')

let i = 0;

let interval = setInterval(function () {

    connect.query(sqlRunMigration[i], (error) => {
        if(error) {
            console.log(error)
            connect.end()
        } else {
            console.log(chalk.bgGreen('[MIGRATION]'), chalk.green('Migration process successful (UP)'));
        }

        if(i == 3) {
            connect.end()
            clearInterval(interval)
        }

    })

    i++;

}, 2000)