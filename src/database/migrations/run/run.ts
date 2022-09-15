import fs from 'fs';
import chalk from 'chalk';

import connect from '../../connection';
import { RowDataPacket } from "mysql2";

const sqlRunMigration = fs.readFileSync(__dirname + '/run.sql').toString().split(';\r\n')

for(let i = 0; i < sqlRunMigration.length; i++) {

    connect.query(sqlRunMigration[i], (error) => {
        if(error) {
            console.log(error)
            connect.end()
        } else {
            console.log(chalk.bgGreen(chalk.black('[MIGRATION]')), 'Migration process successful (UP)')
        }

        if(i == 2) {
            connect.end()
        }

    })
}














