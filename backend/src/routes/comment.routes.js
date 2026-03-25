import express from 'express'
import { postComment, likeComment } from '../controllers/comment.controller.js'
import { auth } from '../middlewares/jwt/auth.js'

const commentRouter = express.Router()

commentRouter.post('/addComment', auth, postComment)
commentRouter.post('/likeComment', auth, likeComment)

export default commentRouter
