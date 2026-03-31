import {
  createComment,
  toggleLike,
  findCharacterIdByComment,
} from '../services/comment.service.js'

// 发评论
async function postComment(req, res) {
  try {
    const user_id = req.user.id
    const { comment_text, character_id } = req.body

    let result = await createComment(user_id, comment_text, character_id)

    res.json({ message: '评论成功', code: 20000, comment_id: result.insertId })
  } catch (err) {
    res.json({ message: err.message })
  }
}

// 点赞
async function likeComment(req, res) {
  try {
    const user_id = req.user.id
    const { comment_id, character_id } = req.body

    const msg = await toggleLike(user_id, comment_id, character_id)
    res.json({ message: msg ,code: 20000})
  } catch (err) {
    res.json({ message: err.message })
  }
}

// 获取某位角色评论
async function getCharacterIdByComment(req, res) {
  try {
    const { user_id, character_id } = req.query
    const commentArr = await findCharacterIdByComment(+user_id, +character_id)
    // console.log(commentArr)
    res.json({ message: '评论数据获取成功', commentArr })
  } catch (err) {
    res.json({ message: err.message })
  }
}

export { postComment, likeComment, getCharacterIdByComment }
