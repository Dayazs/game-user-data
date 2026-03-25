import pool from '../utils/db.js'

// 新增评论
async function addComment(user_id, text) {
  const [res] = await pool.query(
    'INSERT INTO comments (user_id, comment_text, comment_time, like_number) VALUES (?, ?, NOW(), 0)',
    [user_id, text],
  )
  return res
}

// 点赞记录查询
async function findLike(user_id, comment_id) {
  const [rows] = await pool.query(
    'SELECT * FROM record_user_likes WHERE user_id=? AND comment_id=?',
    [user_id, comment_id],
  )
  return rows[0]
}

// 新增点赞记录
async function addLike(user_id, comment_id) {
  return pool.query(
    'INSERT INTO record_user_likes (user_id, comment_id, is_like) VALUES (?, ?, 1)',
    [user_id, comment_id],
  )
}

// 更新点赞记录
function updateLike(user_id, comment_id, is_like) {
  return pool.query(
    'UPDATE record_user_likes SET is_like=? WHERE user_id=? AND comment_id=?',
    [is_like, user_id, comment_id],
  )
}

// 修改评论点赞数
async function updateCommentLike(comment_id, delta) {
  return pool.query(
    'UPDATE comments SET like_number = like_number + ? WHERE comment_id=?',
    [delta, comment_id],
  )
}

export { addComment, findLike, addLike, updateLike, updateCommentLike }
