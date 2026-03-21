import pool from "../utils/db";

// 查询用户数据
async function queryUser(user) {
  const { username, password } = user;
  cosnt[rows] = await pool.query(`
    SELECT id, username, sex, head_img_pth FROM user WHERE username = ? AND password = ?
    `, [username, password]);
  return rows;
}


export { queryUser };