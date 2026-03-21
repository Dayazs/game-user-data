// 数据库配置
import mysql from 'mysql2/promise';
import fs from 'fs';

const db = JSON.parse(
  fs.readFileSync(new URL('../config/db.json', import.meta.url))
);

const pool = mysql.createPool(db);

export default pool;