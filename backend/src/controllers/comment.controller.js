import { createComment, toggleLike } from '../services/comment.service.js'

// 发评论
async function postComment(req, res) {
  try {
    const user_id = req.user.id
    const { comment_text } = req.body

    await createComment(user_id, comment_text)

    res.json({ message: '评论成功' })
  } catch (err) {
    res.json({ message: err.message })
  }
}

// 点赞
async function likeComment(req, res) {
  try {
    const user_id = req.user.id
    const { comment_id } = req.body

    const msg = await toggleLike(user_id, comment_id)
    res.json({ message: msg })
  } catch (err) {
    res.json({ message: err.message })
  }
}

export { postComment, likeComment }
