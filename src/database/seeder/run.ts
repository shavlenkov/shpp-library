import fs from "fs";

import connect from '../connection';
import { RowDataPacket } from "mysql2";


const sqlRunMigration = fs.readFileSync(__dirname + '/seeder.sql').toString().split(';\r\n')


for(let i = 0; i < sqlRunMigration.length; i++) {

    connect.query(sqlRunMigration[i], (error) => {
        if(error) {
            console.log(error)
            connect.end()
        } else {
            console.log('\x1b[32m','[MIGRATION]','\x1b[0m','Seeder process successful (UP)')
        }

        if(i == 2) {
            connect.end()
        }
    })


}






