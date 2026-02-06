// const express = require('express');
// const mysql = require('mysql2');
// const cors = require('cors');

// const app = express();
// app.use(cors());
// app.use(express.json());

// // 连接mysql
// const db = mysql.createConnection({
//   host: 'localhost',
//   user: 'root',
//   password: '123456',
//   database: 'game_user_data'
// });

// db.connect();

// app.get('/role/essential', (req, res) => {
//   db.query('SELECT * FROM characters', (err, result) => {
//     if (err) return res.status(500).send(err);
//     res.json(result);
//   });
// });

// app.listen(3000, () => {
//   console.log('3000端口已开启');
// });

const app = require('./src/app');

app.listen(3000, () => {
  console.log('Server running at http://localhost:3000');
});
