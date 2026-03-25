import express from 'express'
import { userRegister, userLogin } from '../controllers/user.controller.js'

const userRouter = express.Router()

// 用户注册接口
userRouter.post('/register', userRegister)

// 用户登录接口
userRouter.post('/login', userLogin)

export default userRouter
