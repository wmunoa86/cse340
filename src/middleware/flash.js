const flashMiddleware = (req, res, next) => {
    if (!req.session.flash) {
        req.session.flash = {};
    }

    req.flash = (type, message) => {
        if (type && message) {
            if (!req.session.flash[type]) {
                req.session.flash[type] = [];
            }
            req.session.flash[type].push(message);
        } else if (type) {
            const messages = req.session.flash[type] || [];
            delete req.session.flash[type];
            return messages;
        } else {
            const all = req.session.flash;
            req.session.flash = {};
            return all;
        }
    };

    next();
};

const flashLocals = (req, res, next) => {
    res.locals.flash = req.flash.bind(req);
    next();
};

const flash = (req, res, next) => {
    flashMiddleware(req, res, () => {
        flashLocals(req, res, next);
    });
};

export default flash;
