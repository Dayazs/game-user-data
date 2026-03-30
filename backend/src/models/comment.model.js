import pool from '../utils/db.js'

// 新增评论
async function addComment(user_id, text, character_id) {
  const [res] = await pool.query(
    'INSERT INTO comments (user_id, comment_text, comment_time, like_number, character_id) VALUES (?, ?, NOW(), 0, ?)',
    [+user_id, text, +character_id],
  )
  return res
}

// 点赞记录查询
async function findLike(user_id, comment_id, character_id) {
  const [rows] = await pool.query(
    'SELECT * FROM record_user_likes WHERE user_id=? AND comment_id=? AND character_id=?',
    [user_id, comment_id, character_id],
  )
  return rows[0]
}

// 新增点赞记录
async function addLike(user_id, comment_id, character_id) {
  return pool.query(
    'INSERT INTO record_user_likes (user_id, comment_id, is_like, character_id) VALUES (?, ?, 1, ?)',
    [user_id, comment_id, character_id],
  )
}

// 更新点赞记录
function updateLike(user_id, comment_id, is_like, character_id) {
  return pool.query(
    'UPDATE record_user_likes SET is_like=? WHERE user_id=? AND comment_id=? AND character_id=?',
    [is_like, user_id, comment_id, character_id],
  )
}

// 修改评论点赞数
async function updateCommentLike(comment_id, delta, character_id) {
  return pool.query(
    'UPDATE comments SET like_number = like_number + ? WHERE comment_id=? AND character_id=?',
    [delta, comment_id, character_id],
  )
}

// 查询某位角色评论
async function queryCharacterIdByComment(character_id) {
  const [rows] = await pool.query(
    `
    SELECT 
      c.comment_id, 
      c.comment_text, 
      c.comment_time, 
      c.like_number, 
      u.account_number,
      u.username, 
      u.user_avatar 
    FROM comments c 
    LEFT JOIN users u 
    ON c.user_id = u.id 
    WHERE c.character_id=? `,
    [character_id],
  )
  // console.log(rows)
  return rows
}

// 查询用户在哪个角色点赞的评论
async function queryLikeUserCommentByUserId(user_id, character_id) {
  const [rows] = await pool.query(
    `SELECT user_id, character_id, is_like, comment_id FROM record_user_likes WHERE user_id = ? AND character_id = ?`,
    [user_id, character_id],
  )
  return rows
}

export {
  addComment,
  findLike,
  addLike,
  updateLike,
  updateCommentLike,
  queryCharacterIdByComment,
  queryLikeUserCommentByUserId,
}
