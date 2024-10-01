const express = require('express');
const cors = require('cors');
const mysql = require('mysql');

const app = express();
const port = 4300;

app.use(cors());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Yuweiyuan0.',
    // database: 'crowdfunding_db'
    database: 't2'
});

app.listen(port, () => {
    console.log(`Express server is running on port ${port}`);
});

app.get('/fundraisers', (req, res) => {
    const query = 'SELECT * FROM FUNDRAISER WHERE ACTIVE = 1';
    db.query(query, (err, results) => {
        if (err) {
            return res.status(500).json({ error: err });
        }
        res.json(results);
    });
});

app.get('/search', (req, res) => {
    const { organizer, city, category } = req.query;
    let query = 'SELECT * FROM FUNDRAISER WHERE ACTIVE = 1';
    let filters = [];

    if (organizer) filters.push(`ORGANIZER LIKE '%${organizer}%'`);
    if (city) filters.push(`CITY LIKE '%${city}%'`);
    if (category) filters.push(`CATEGORY_ID = (SELECT CATEGORY_ID FROM CATEGORY WHERE NAME = '${category}')`);

    if (filters.length > 0) {
        query += ' AND ' + filters.join(' AND ');
    }

    db.query(query, (err, results) => {
        if (err) {
            return res.status(500).json({ error: err });
        }
        res.json(results);
    });
});

app.get('/fundraiser/:id', (req, res) => {
    const query = 'SELECT * FROM FUNDRAISER WHERE FUNDRAISER_ID = ?';
    db.query(query, [req.params.id], (err, results) => {
        if (err || results.length === 0) {
            return res.status(404).json({ error: 'Not found' });
        }
        res.json(results[0]);
    });
});
