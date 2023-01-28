import { Request, Response, NextFunction } from 'express'
import auth from 'basic-auth';

export default function BasicAuth(req: Request, res: Response, next: NextFunction) {
    var user = auth(req);
    if (!user || !user.name || !user.pass) {
        res.set('WWW-Authenticate', 'Basic realm=Authorization Required');
        res.sendStatus(401);
        return;
    }
    if (user.name === 'root' && user.pass === 'root') {
        next();
    } else {
        res.set('WWW-Authenticate', 'Basic realm=Authorization Required');
        res.sendStatus(401);
        return;
    }
}


