const db = require('../config/db');

async function findAllCharacters() {
  const [rows] = await db.query('SELECT * FROM characters');
  return rows;
}

module.exports = {
  findAllCharacters
};
