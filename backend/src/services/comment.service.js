import {
  addComment,
  findLike,
  addLike,
  updateLike,
  updateCommentLike,
} from '../models/comment.model.js'

// 发评论
async function createComment(user_id, text) {
  if (!text) {
    throw new Error('评论不能为空')
  }
  return await addComment(user_id, text)
}

// 点赞/取消点赞
async function toggleLike(user_id, comment_id) {
  const record = await findLike(user_id, comment_id)

  // 第一次点赞
  if (!record) {
    await addLike(user_id, comment_id)
    await updateCommentLike(comment_id, +1)
    return '点赞成功'
  }

  // 已经点赞，取消
  if (record.is_like == 1) {
    await updateLike(user_id, comment_id, 0)
    await updateCommentLike(comment_id, -1)
    return '取消点赞'
  }

  // 未点赞，点赞
  await updateLike(user_id, comment_id, 1)
  await updateCommentLike(comment_id, +1)
  return '点赞成功'
}

export { createComment, toggleLike }
