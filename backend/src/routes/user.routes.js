import express from 'express'
import {
  userRegister,
  userLogin,
  userData,
} from '../controllers/user.controller.js'
import { auth } from '../middlewares/jwt/auth.js'

const userRouter = express.Router()

// 用户注册接口
userRouter.post('/register', userRegister)

// 用户登录接口
userRouter.post('/login', userLogin)

// 获取用户信息接口
userRouter.post('/userData', auth, userData)

export default userRouter
