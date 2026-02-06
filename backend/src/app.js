// 初始化express
const express = require('express');
const app = express();

app.use(express.json());

app.use('/api/characters', require('./routes/character.routes'));

module.exports = app;


