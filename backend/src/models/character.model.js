import db from '../config/db.js';

async function findAllCharacters() {
  const [rows] = await db.query('SELECT * FROM characters');
  return rows;
}

export { findAllCharacters };