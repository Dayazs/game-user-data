import pool from '../utils/db.js'

// 查用户
async function findUserByAccount(account_number) {
  const [rows] = await pool.query(
    'SELECT * FROM users WHERE account_number = ?',
    [account_number],
  )
  return rows[0]
}

// 注册
async function registerUser(account_number, password, username) {
  const [result] = await pool.query(
    'INSERT INTO users (account_number, password, is_admin, username) VALUES (?, ?, 0, ?)',
    [account_number, password, username],
  )
  return result
}

export { findUserByAccount, registerUser }
