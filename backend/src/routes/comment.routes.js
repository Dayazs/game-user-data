import express from 'express'
import { postComment, likeComment,getCharacterIdByComment } from '../controllers/comment.controller.js'
import { auth } from '../middlewares/jwt/auth.js'

const commentRouter = express.Router()

// 添加评论
commentRouter.post('/addComment', auth, postComment)
// 点赞/取消点赞评论
commentRouter.post('/likeComment', auth, likeComment)
// 获取相关评论
commentRouter.get('/getComment', getCharacterIdByComment)

export default commentRouter
