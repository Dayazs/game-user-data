import {
  addComment,
  findLike,
  addLike,
  updateLike,
  updateCommentLike,
  queryCharacterIdByComment,
  queryLikeUserCommentByUserId,
} from '../models/comment.model.js'

// 发评论
async function createComment(user_id, text, character_id) {
  if (!text) {
    throw new Error('评论不能为空')
  }
  return await addComment(user_id, text, character_id)
}

// 点赞/取消点赞
async function toggleLike(user_id, comment_id, character_id) {
  const record = await findLike(user_id, comment_id, character_id)

  // 第一次点赞
  if (!record) {
    await addLike(user_id, comment_id, character_id)
    await updateCommentLike(comment_id, +1, character_id)
    return '点赞成功'
  }

  // 已经点赞，取消
  if (record.is_like == 1) {
    await updateLike(user_id, comment_id, 0, character_id)
    await updateCommentLike(comment_id, -1, character_id)
    return '取消点赞'
  }

  // 未点赞，点赞
  await updateLike(user_id, comment_id, 1, character_id)
  await updateCommentLike(comment_id, +1, character_id)
  return '点赞成功'
}

// 获取某位角色评论
async function findCharacterIdByComment(user_id, character_id) {
  // 查询指定角色的所有评论
  const rows = await queryCharacterIdByComment(character_id)

  // 如果没有登录
  if (!user_id) {
    rows.forEach((item) => {
      item.showBtn = false
      item.isExpand = false
      // 是否点赞
      item.isLike = false
    })
    return rows
  }

  // 已登录
  // 查询指定用户在某个角色点赞的评论记录
  const userLikeComments = await queryLikeUserCommentByUserId(
    user_id,
    character_id,
  )
  // console.log(userLikeComments)
  const likeSet = new Set(
    // 用户点赞的评论
    userLikeComments
      .filter((item) => item.is_like === 1)
      .map((item) => item.comment_id),
  )

  rows.forEach((item) => {
    item.showBtn = false
    item.isExpand = false

    // 将用户点赞评论和角色评论匹配
    item.isLike = likeSet.has(item.comment_id) || false
  })
  return rows
}

export { createComment, toggleLike, findCharacterIdByComment }
