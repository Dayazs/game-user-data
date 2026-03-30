import express from 'express'
import characterRoutes from './routes/character.routes.js'
import userRouter from './routes/user.routes.js'
import commentRouter from './routes/comment.routes.js'

const app = express()

app.use(express.json())

// 用户相关接口
app.use('/api/user', userRouter)

// 角色相关接口
app.use('/api/characters', characterRoutes)

// 评论相关接口
app.use('/api/comment', commentRouter)

// 获取静态资源
app.use('/api/images', express.static('public/images'))

export default app
