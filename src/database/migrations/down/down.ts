import fs from "fs";

import connect from '../../connection';
import { RowDataPacket } from "mysql2";

import chalk from "chalk";

const sqlRunMigration = fs.readFileSync(__dirname + '/down.sql').toString().split(';\r\n')

for(let i = 0; i < sqlRunMigration.length; i++) {

    connect.query(sqlRunMigration[i], (error) => {
        if(error) {
            console.log(error)
            connect.end()
        } else {
            console.log(chalk.bgGreen(chalk.black('[MIGRATION]')), 'Migration process successful (DOWN)')
        }

        if(i == 2) {
            connect.end()
        }
    })


}






